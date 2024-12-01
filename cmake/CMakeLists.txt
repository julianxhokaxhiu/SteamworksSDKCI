include(ExternalProject)

set(SWSDK_VERSION "1.60")
set(SWSDK_RELEASE "x86")
if( CMAKE_SIZEOF_VOID_P EQUAL 8 )
    set(SWSDK_RELEASE "x64")
endif()

ExternalProject_Add(
	SteamworksSDK
	URL			"https://github.com/julianxhokaxhiu/SteamworksSDKCI/releases/download/${SWSDK_VERSION}/SteamworksSDK-v${SWSDK_VERSION}.0_${SWSDK_RELEASE}.zip"
	INSTALL_DIR		"${CMAKE_BINARY_DIR}/vendor"
	CONFIGURE_COMMAND	""
	BUILD_COMMAND		""
	INSTALL_COMMAND		"${CMAKE_COMMAND}" -E copy_directory "<SOURCE_DIR>" "<INSTALL_DIR>"
)
