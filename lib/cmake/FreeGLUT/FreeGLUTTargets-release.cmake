#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "FreeGLUT::freeglut" for configuration "Release"
set_property(TARGET FreeGLUT::freeglut APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(FreeGLUT::freeglut PROPERTIES
  IMPORTED_LOCATION_RELEASE "/data/yuqingchi/Code/AgenticVLA/third_party/imagemagick_env/lib/libglut.so.3.11.1"
  IMPORTED_SONAME_RELEASE "libglut.so.3"
  )

list(APPEND _cmake_import_check_targets FreeGLUT::freeglut )
list(APPEND _cmake_import_check_files_for_FreeGLUT::freeglut "/data/yuqingchi/Code/AgenticVLA/third_party/imagemagick_env/lib/libglut.so.3.11.1" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
