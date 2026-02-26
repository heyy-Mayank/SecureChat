#include "crypto.hpp"
#include <openssl/pem.h>
#include <openssl/evp.h>
#include <openssl/rand.h>
#include <openssl/bio.h>
#include <openssl/buffer.h>
#include <iostream>



void handleErrors()
{
    std::cerr << "Crypto error\n";
    exit(1);
}

// ---------------- RSA ----------------

RSA* generateRSAKey()
{
    return RSA_generate_key(2048, RSA_F4, NULL, NULL);
}

std::string getPublicKeyPEM(RSA* rsa)
{
    BIO* bio = BIO_new(BIO_s_mem());
    PEM_write_bio_RSAPublicKey(bio, rsa);

    char* data;
    long len = BIO_get_mem_data(bio, &data);
    std::string publicKey(data, len);

    BIO_free(bio);
    return publicKey;
}

// ---------------- AES ----------------

bool aesEncrypt(const std::string& plaintext,
                std::vector<unsigned char>& ciphertext,
                std::vector<unsigned char>& key,
                std::vector<unsigned char>& iv,
                std::vector<unsigned char>& tag)
{
    key.resize(AES_KEYLEN);
    iv.resize(AES_IVLEN);
    tag.resize(AES_TAGLEN);

    if (!RAND_bytes(key.data(), AES_KEYLEN)) return false;
    if (!RAND_bytes(iv.data(), AES_IVLEN)) return false;

    EVP_CIPHER_CTX* ctx = EVP_CIPHER_CTX_new();
    if (!ctx) return false;

    if (1 != EVP_EncryptInit_ex(ctx, EVP_aes_256_gcm(), NULL, NULL, NULL)) return false;
    if (1 != EVP_CIPHER_CTX_ctrl(ctx, EVP_CTRL_GCM_SET_IVLEN, AES_IVLEN, NULL)) return false;
    if (1 != EVP_EncryptInit_ex(ctx, NULL, NULL, key.data(), iv.data())) return false;

    ciphertext.resize(plaintext.size());

    int len;
    if (1 != EVP_EncryptUpdate(ctx, ciphertext.data(), &len,
                               (unsigned char*)plaintext.data(),
                               plaintext.size())) return false;

    int ciphertext_len = len;

    if (1 != EVP_EncryptFinal_ex(ctx, ciphertext.data() + len, &len)) return false;
    ciphertext_len += len;

    if (1 != EVP_CIPHER_CTX_ctrl(ctx, EVP_CTRL_GCM_GET_TAG, AES_TAGLEN, tag.data())) return false;

    ciphertext.resize(ciphertext_len);

    EVP_CIPHER_CTX_free(ctx);
    return true;
}

bool aesDecrypt(const std::vector<unsigned char>& ciphertext,
                const std::vector<unsigned char>& key,
                const std::vector<unsigned char>& iv,
                const std::vector<unsigned char>& tag,
                std::string& decryptedText)
{
    EVP_CIPHER_CTX* ctx = EVP_CIPHER_CTX_new();
    if (!ctx) return false;

    if (1 != EVP_DecryptInit_ex(ctx, EVP_aes_256_gcm(), NULL, NULL, NULL)) return false;
    if (1 != EVP_CIPHER_CTX_ctrl(ctx, EVP_CTRL_GCM_SET_IVLEN, AES_IVLEN, NULL)) return false;
    if (1 != EVP_DecryptInit_ex(ctx, NULL, NULL, key.data(), iv.data())) return false;

    std::vector<unsigned char> plaintext(ciphertext.size());

    int len;
    if (1 != EVP_DecryptUpdate(ctx, plaintext.data(), &len,
                               ciphertext.data(), ciphertext.size())) return false;

    int plaintext_len = len;

    if (1 != EVP_CIPHER_CTX_ctrl(ctx, EVP_CTRL_GCM_SET_TAG, AES_TAGLEN, (void*)tag.data())) return false;

    if (1 != EVP_DecryptFinal_ex(ctx, plaintext.data() + len, &len)) return false;

    plaintext_len += len;

    decryptedText.assign((char*)plaintext.data(), plaintext_len);

    EVP_CIPHER_CTX_free(ctx);
    return true;
}
// ---------------- RSA Encrypt / Decrypt ----------------

std::string rsaEncrypt(const std::vector<unsigned char>& data, const std::string& publicKeyPEM)
{
    BIO* bio = BIO_new_mem_buf(publicKeyPEM.data(), -1);
    RSA* rsa = PEM_read_bio_RSAPublicKey(bio, NULL, NULL, NULL);
    BIO_free(bio);

    if (!rsa) handleErrors();

    std::vector<unsigned char> encrypted(RSA_size(rsa));

    int len = RSA_public_encrypt(
        data.size(),
        data.data(),
        encrypted.data(),
        rsa,
        RSA_PKCS1_OAEP_PADDING
    );

    RSA_free(rsa);

    if (len == -1) handleErrors();

    return std::string((char*)encrypted.data(), len);
}

std::vector<unsigned char> rsaDecrypt(const std::string& encryptedData, RSA* privateRSA)
{
    std::vector<unsigned char> decrypted(RSA_size(privateRSA));

    int len = RSA_private_decrypt(
        encryptedData.size(),
        (unsigned char*)encryptedData.data(),
        decrypted.data(),
        privateRSA,
        RSA_PKCS1_OAEP_PADDING
    );

    if (len == -1) handleErrors();

    decrypted.resize(len);
    return decrypted;
}


// ---------------- Base64 ----------------

std::string base64Encode(const std::vector<unsigned char>& data)
{
    BIO* bio = BIO_new(BIO_s_mem());
    BIO* b64 = BIO_new(BIO_f_base64());
    BIO_set_flags(b64, BIO_FLAGS_BASE64_NO_NL);
    bio = BIO_push(b64, bio);

    BIO_write(bio, data.data(), data.size());
    BIO_flush(bio);

    BUF_MEM* bufferPtr;
    BIO_get_mem_ptr(bio, &bufferPtr);

    std::string result(bufferPtr->data, bufferPtr->length);
    BIO_free_all(bio);
    return result;
}

std::vector<unsigned char> base64Decode(const std::string& encoded)
{
    BIO* bio = BIO_new_mem_buf(encoded.data(), encoded.size());
    BIO* b64 = BIO_new(BIO_f_base64());
    BIO_set_flags(b64, BIO_FLAGS_BASE64_NO_NL);
    bio = BIO_push(b64, bio);

    std::vector<unsigned char> buffer(encoded.size());
    int len = BIO_read(bio, buffer.data(), buffer.size());
    buffer.resize(len);

    BIO_free_all(bio);
    return buffer;
}