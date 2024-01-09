![Overall Downloads](https://img.shields.io/github/downloads/julianxhokaxhiu/SteamworksSDKCI/total?label=Overall%20Downloads) [![Build Status](https://dev.azure.com/julianxhokaxhiu/Github/_apis/build/status/julianxhokaxhiu.SteamworksSDKCI?branchName=master)](https://dev.azure.com/julianxhokaxhiu/Github/_build/latest?definitionId=1&branchName=master)

# SteamworksSDKCI
CI builds of Steamworks SDK for CMake build systems

## How to use

> **PLEASE NOTE:** Choose the relative [version tag](https://github.com/julianxhokaxhiu/SteamworksSDKCI/tags) before using CMake files as they **will be updated to reflect each version needs**!

See [cmake](cmake) folder for include files. Then in your own library `CMakeLists.txt` do:

```cmake
find_package(SteamworksSDK REQUIRED)

...

target_link_libraries(<libname>
  ...
  # Link the SDK
  SteamworksSDK::SteamworksSDK
  # Link the AppTicket
  SteamworksSDK::AppTicket
  ...
)
```

## SDK Documentation

SDK documentation can be found here: https://partner.steamgames.com/doc/sdk
