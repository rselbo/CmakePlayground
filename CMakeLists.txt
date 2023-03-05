cmake_minimum_required(VERSION 3.22)
project(cmake_test)

include(cmake/Config.cmake)
include(cmake/Functions.cmake)

add_subdirectory(embedded)
add_subdirectory(main)