# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(mostro_sdk_library VERSION 0.0.1 LANGUAGES C)

add_library(mostro_sdk SHARED
  "mostro_sdk.c"
)

set_target_properties(mostro_sdk PROPERTIES
  PUBLIC_HEADER mostro_sdk.h
  OUTPUT_NAME "mostro_sdk"
)

target_compile_definitions(mostro_sdk PUBLIC DART_SHARED_LIB)
