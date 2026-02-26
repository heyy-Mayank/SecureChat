#include "crypto.hpp"
#include <ixwebsocket/IXWebSocket.h>
#include <nlohmann/json.hpp>
#include <openssl/rand.h>
#include <iostream>
#include <atomic>
#include <thread>
#include <map>

using json = nlohmann::json;

int main()
{
    std::string username;
    std::cout << "Enter username: ";
    std::getline(std::cin, username);

    // Generate RSA key pair
    RSA* rsa = generateRSAKey();
    std::string publicKey = getPublicKeyPEM(rsa);

    ix::WebSocket webSocket;
    webSocket.setUrl("ws://localhost:8080");

    std::atomic<bool> connected(false);

    // Store known public keys
    std::map<std::string, std::string> publicKeyStore;

    // Store pending message
    std::string pendingRecipient;
    std::string pendingMessage;

    webSocket.setOnMessageCallback([&](const ix::WebSocketMessagePtr& msg)
    {
        if (msg->type == ix::WebSocketMessageType::Open)
        {
            connected = true;
            std::cout << "\nConnected!\n";

            json registerMsg = {
                {"type", "register"},
                {"username", username},
                {"publicKey", publicKey}
            };

            webSocket.send(registerMsg.dump());
        }
        else if (msg->type == ix::WebSocketMessageType::Message)
        {
            auto data = json::parse(msg->str);

            // Handle public key response
            if (data["type"] == "public_key_response")
            {
                std::string user = data["username"];
                std::string key = data["publicKey"];

                publicKeyStore[user] = key;

                // If waiting to send message to this user
                if (user == pendingRecipient)
                {
                    std::vector<unsigned char> ciphertext, aesKey, iv, tag;
                    aesEncrypt(pendingMessage, ciphertext, aesKey, iv, tag);

                    std::string encryptedKey =
                        rsaEncrypt(aesKey, key);

                    json msg = {
                        {"type", "message"},
                        {"from", username},
                        {"to", user},
                        {"encryptedKey", base64Encode(
                            std::vector<unsigned char>(encryptedKey.begin(), encryptedKey.end()))},
                        {"ciphertext", base64Encode(ciphertext)},
                        {"iv", base64Encode(iv)},
                        {"tag", base64Encode(tag)}
                    };

                    webSocket.send(msg.dump());

                    pendingRecipient.clear();
                    pendingMessage.clear();
                }
            }

            // Handle incoming encrypted message
            else if (data["type"] == "message")
            {
                auto encryptedKey = base64Decode(data["encryptedKey"]);
                auto ciphertext = base64Decode(data["ciphertext"]);
                auto iv = base64Decode(data["iv"]);
                auto tag = base64Decode(data["tag"]);

                std::vector<unsigned char> aesKey =
                    rsaDecrypt(std::string((char*)encryptedKey.data(), encryptedKey.size()), rsa);

                std::string decrypted;
                aesDecrypt(ciphertext, aesKey, iv, tag, decrypted);

                std::cout << "\n" << data["from"] << ": " << decrypted << "\n";
            }
        }
    });

    webSocket.start();

    while (!connected)
        std::this_thread::sleep_for(std::chrono::milliseconds(100));

    while (true)
    {
        std::string to;
        std::cout << "Send to: ";
        std::getline(std::cin, to);

        std::string message;
        std::cout << "Message: ";
        std::getline(std::cin, message);

        // If public key already known
        if (publicKeyStore.count(to))
        {
            std::vector<unsigned char> ciphertext, aesKey, iv, tag;
            aesEncrypt(message, ciphertext, aesKey, iv, tag);

            std::string encryptedKey =
                rsaEncrypt(aesKey, publicKeyStore[to]);

            json msg = {
                {"type", "message"},
                {"from", username},
                {"to", to},
                {"encryptedKey", base64Encode(
                    std::vector<unsigned char>(encryptedKey.begin(), encryptedKey.end()))},
                {"ciphertext", base64Encode(ciphertext)},
                {"iv", base64Encode(iv)},
                {"tag", base64Encode(tag)}
            };

            webSocket.send(msg.dump());
        }
        else
        {
            // Store pending message
            pendingRecipient = to;
            pendingMessage = message;

            json keyRequest = {
                {"type", "get_public_key"},
                {"username", to}
            };

            webSocket.send(keyRequest.dump());
        }
    }

    RSA_free(rsa);
    return 0;
}