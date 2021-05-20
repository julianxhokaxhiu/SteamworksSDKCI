include(FindPackageHandleStandardArgs)

if (NOT STEAMWORKSSDK_FOUND)
	find_library(
		STEAMWORKSSDK_LIBRARY
		steam_api
		steam_api64
		PATH_SUFFIXES
		lib/steam
		vendor/lib/steam
	)

	find_path(
		STEAMWORKSSDK_INCLUDE_DIR
		steam
		PATH_SUFFIXES
		include
		vendor/include
	)

	add_library(STEAMWORKSSDK::STEAMWORKSSDK STATIC IMPORTED)

	set_target_properties(
		STEAMWORKSSDK::STEAMWORKSSDK
		PROPERTIES
		IMPORTED_LOCATION
		"${STEAMWORKSSDK_LIBRARY}"
		INTERFACE_INCLUDE_DIRECTORIES
		"${STEAMWORKSSDK_INCLUDE_DIR}"
	)

	#-----------------------------------------

  find_library(
		STEAMWORKSSDK_APPTICKET_LIBRARY
		sdkencryptedappticket
		sdkencryptedappticket64
		PATH_SUFFIXES
		lib/steam
		vendor/lib/steam
	)

	add_library(STEAMWORKSSDK::APPTICKET STATIC IMPORTED)

	set_target_properties(
		STEAMWORKSSDK::APPTICKET
		PROPERTIES
		IMPORTED_LOCATION
		"${STEAMWORKSSDK_APPTICKET_LIBRARY}"
	)

	#-----------------------------------------

	find_package_handle_standard_args(STEAMWORKSSDK DEFAULT_MSG STEAMWORKSSDK_LIBRARY STEAMWORKSSDK_APPTICKET_LIBRARY STEAMWORKSSDK_INCLUDE_DIR)
endif()
