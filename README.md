# 🔐 SecureChat

SecureChat is a real-time encrypted chat application built using C++, OpenSSL, and WebSockets.  
It implements hybrid encryption (RSA + AES-GCM) to provide end-to-end encrypted communication between clients.

The server only forwards encrypted data and cannot decrypt messages.

------------------------------------------------------------------------------------------------

## 🚀 Features

- Real-time communication using WebSockets
- End-to-End Encryption (E2EE)
- Hybrid Encryption (RSA + AES-GCM)
- RSA Public Key Exchange
- AES-GCM authenticated encryption
- Secure key transmission (AES key encrypted using RSA)
- Server does not have access to plaintext messages
- Multi-client support

-------------------------------------------------------------------------------------------------


## 🏗 Architecture
Client A <--encrypted--> Server <--encrypted--> Client B

-------------------------------------------------------------------------------------------------

### Encryption Flow

1. Each client generates its own RSA key pair on startup.
2. Public keys are registered with the server.
3. When sending a message:
   - A random AES session key is generated.
   - The message is encrypted using AES-GCM.
   - The AES key is encrypted using recipient's RSA public key.
   - The server forwards encrypted payload.
4. Receiver:
   - Decrypts AES key using private RSA key.
   - Decrypts message using AES key.

The server never decrypts message content.

-------------------------------------------------------------------------------------------------


## 🔐 Cryptography Used

- RSA (2048-bit) – Key Exchange
- AES-256-GCM – Message Encryption
- OpenSSL – Cryptographic operations
- Base64 – Safe binary transmission
- WebSocket – Real-time communication

-------------------------------------------------------------------------------------------------


## 📦 Project Structure
SecureChat/
│
├── client/
│ ├── src/
│ │ ├── main.cpp
│ │ ├── crypto.cpp
│ │ └── crypto.hpp
│ ├── CMakeLists.txt
│
├── server/
│ └── server.js
│
└── README.md



-------------------------------------------------------------------------------------------------

### ⚙ Installation & Setup

### 📌 Requirements:

- Node.js (v16+)
- npm
- CMake (v3.16+)
- C++20 compatible compiler (Clang / GCC)
- OpenSSL
- Git

### 🚀 Quick Setup Guide: 

### 1️⃣ Clone the Repository
https://github.com/heyy-Mayank/SecureChat.git
cd SecureChat

### 2️⃣ Install Server Dependencies
cd server
npm install ws

### 3️⃣ Start the WebSocket Server
node server.js
You should see:- 
Server running on ws://localhost:8080
Leave this terminal running.

### 4️⃣ Build the C++ Client
Open a new terminal:
cd client
mkdir build
cd build
cmake ..
make
If successful, the client executable will be created.

### 5️⃣ Run Two Clients

Open two separate terminals.
Terminal 1
cd client/build
./client
Enter username: mayank

Terminal 2
cd client/build
./client
Enter username: alice

### 6️⃣ Send Encrypted Messages

From one client:
Send to: alice
Message: Hello!
The other client will securely receive and decrypt the message.

-------------------------------------------------------------------------------------------------

### Educational Purpose

This project demonstrates:
- Hybrid cryptography (RSA + AES)
- Secure key exchange
- Authenticated encryption (AES-GCM)
- Real-time encrypted communication
- Client-server architecture
- Practical cryptographic implementation using OpenSSL

-------------------------------------------------------------------------------------------------
### License (MIT License)

MIT License

Copyright (c) 2026 Mayank

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
