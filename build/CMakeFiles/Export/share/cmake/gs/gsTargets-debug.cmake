#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "gs" for configuration "Debug"
set_property(TARGET gs APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(gs PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libgs.so.1.1.0"
  IMPORTED_SONAME_DEBUG "libgs.so.0"
  )

list(APPEND _IMPORT_CHECK_TARGETS gs )
list(APPEND _IMPORT_CHECK_FILES_FOR_gs "${_IMPORT_PREFIX}/lib/libgs.so.1.1.0" )

# Import target "gs-static" for configuration "Debug"
set_property(TARGET gs-static APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(gs-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libgs.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS gs-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_gs-static "${_IMPORT_PREFIX}/lib/libgs.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
