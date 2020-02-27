# SteamworksSDKCI
CI builds of Steamworks SDK for CMake build systems

## How to use

> **PLEASE NOTE:** Choose the relative [version tag](https://github.com/julianxhokaxhiu/SteamworksSDKCI/tags) before using CMake files as they **will be updated to reflect each version needs**!

See [cmake](cmake) folder for include files. Then in your own library `CMakeLists.txt` do:

```cmake
find_package(STEAMWORKSSDK REQUIRED)

...

target_link_libraries(<libname>
  ...
  STEAMWORKSSDK::STEAMWORKSSDK
  ...
)
```

## SDK Documentation

SDK documentation can be found here: https://partner.steamgames.com/doc/sdk
