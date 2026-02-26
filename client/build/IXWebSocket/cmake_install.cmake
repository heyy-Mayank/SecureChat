# Install script for directory: /Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/hey_mayank/Desktop/SecureChat/client/build/IXWebSocket/libixwebsocket.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libixwebsocket.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libixwebsocket.a")
    execute_process(COMMAND "/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libixwebsocket.a")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ixwebsocket" TYPE FILE FILES
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXBase64.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXBench.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXCancellationRequest.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXConnectionState.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXDNSLookup.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXExponentialBackoff.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXGetFreePort.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXGzipCodec.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXHttp.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXHttpClient.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXHttpServer.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXNetSystem.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXProgressCallback.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXSelectInterrupt.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXSelectInterruptFactory.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXSelectInterruptPipe.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXSelectInterruptEvent.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXSetThreadName.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXSocket.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXSocketConnect.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXSocketFactory.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXSocketServer.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXSocketTLSOptions.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXStrCaseCompare.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXUdpSocket.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXUniquePtr.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXUrlParser.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXUuid.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXUtf8Validator.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXUserAgent.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocket.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketCloseConstants.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketCloseInfo.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketErrorInfo.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketHandshake.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketHandshakeKeyGen.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketHttpHeaders.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketInitResult.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketMessage.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketMessageType.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketOpenInfo.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketPerMessageDeflate.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketPerMessageDeflateCodec.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketPerMessageDeflateOptions.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketProxyServer.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketSendData.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketSendInfo.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketServer.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketTransport.h"
    "/Users/hey_mayank/Desktop/SecureChat/client/IXWebSocket/ixwebsocket/IXWebSocketVersion.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ixwebsocket" TYPE FILE FILES "/Users/hey_mayank/Desktop/SecureChat/client/build/IXWebSocket/ixwebsocket-config.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/hey_mayank/Desktop/SecureChat/client/build/IXWebSocket/ixwebsocket.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ixwebsocket/ixwebsocket-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ixwebsocket/ixwebsocket-targets.cmake"
         "/Users/hey_mayank/Desktop/SecureChat/client/build/IXWebSocket/CMakeFiles/Export/dbc99e06a99e696141dafd40631f8060/ixwebsocket-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ixwebsocket/ixwebsocket-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/ixwebsocket/ixwebsocket-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ixwebsocket" TYPE FILE FILES "/Users/hey_mayank/Desktop/SecureChat/client/build/IXWebSocket/CMakeFiles/Export/dbc99e06a99e696141dafd40631f8060/ixwebsocket-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/ixwebsocket" TYPE FILE FILES "/Users/hey_mayank/Desktop/SecureChat/client/build/IXWebSocket/CMakeFiles/Export/dbc99e06a99e696141dafd40631f8060/ixwebsocket-targets-noconfig.cmake")
  endif()
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/hey_mayank/Desktop/SecureChat/client/build/IXWebSocket/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
