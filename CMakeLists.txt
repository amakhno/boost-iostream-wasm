cmake_minimum_required(VERSION 3.27)
project(tzergity_native)
set(CMAKE_CXX_STANDARD 11)

include(vcpkg/scripts/buildsystems/vcpkg.cmake)

find_package(Boost REQUIRED COMPONENTS iostreams)
add_executable(webgl_test main.cpp)
target_link_libraries(webgl_test PRIVATE Boost::boost Boost::iostreams)