cmake_minimum_required(VERSION 3.22)
project(cmake_test)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

include(Config)
include(Functions)

add_subdirectory(embedded)
add_subdirectory(main)