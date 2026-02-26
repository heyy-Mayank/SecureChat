#pragma once

#include <string>
#include <vector>
#include <openssl/rsa.h>

#define AES_KEYLEN 32
#define AES_IVLEN 12
#define AES_TAGLEN 16

// RSA
RSA* generateRSAKey();
std::string getPublicKeyPEM(RSA* rsa);

// AES
bool aesEncrypt(const std::string& plaintext,
                std::vector<unsigned char>& ciphertext,
                std::vector<unsigned char>& key,
                std::vector<unsigned char>& iv,
                std::vector<unsigned char>& tag);

bool aesDecrypt(const std::vector<unsigned char>& ciphertext,
                const std::vector<unsigned char>& key,
                const std::vector<unsigned char>& iv,
                const std::vector<unsigned char>& tag,
                std::string& decryptedText);

// RSA encryption of AES key
std::string rsaEncrypt(const std::vector<unsigned char>& data, const std::string& publicKeyPEM);
std::vector<unsigned char> rsaDecrypt(const std::string& encryptedData, RSA* privateRSA);

std::string base64Encode(const std::vector<unsigned char>& data);
std::vector<unsigned char> base64Decode(const std::string& encoded);