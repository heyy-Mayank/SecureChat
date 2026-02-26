cmake_minimum_required(VERSION 3.16)
project(SecureChatClient)

set(CMAKE_CXX_STANDARD 20)

find_package(OpenSSL REQUIRED)

add_subdirectory(IXWebSocket)

add_executable(client
    src/main.cpp
    src/crypto.cpp
)

target_link_libraries(client
    ixwebsocket
    OpenSSL::SSL
    OpenSSL::Crypto
)

target_include_directories(client PRIVATE json/include)