cmake_minimum_required(VERSION 3.7)

###################################################################
# This is a fake CMake config to make the project work in CLion   #
# Do not attempt to build it with cmake, use make instead.        #
###################################################################

project(INIParser)

set(CMAKE_CXX_STANDARD GNU99)

set(SOURCE_FILES
        src/ini_parse.rl
        src/ini_parse.c
        include/ini_parse.h
        examples/example.c
)

include_directories(include)

add_definitions(
  
)

add_executable(INIParser ${SOURCE_FILES})
