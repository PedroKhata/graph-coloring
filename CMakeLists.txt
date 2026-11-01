cmake_minimum_required(VERSION 3.12)
project(graph_coloring CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

# Tudo que está em src/ (menos o main) vira uma biblioteca, usada pelo programa e pelos testes
file(GLOB_RECURSE LIB_SOURCES CONFIGURE_DEPENDS src/*.cpp)
list(REMOVE_ITEM LIB_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp)

add_library(coloring_lib STATIC ${LIB_SOURCES})
target_include_directories(coloring_lib PUBLIC src)
if(NOT MSVC)
  target_compile_options(coloring_lib PUBLIC -Wall -Wextra)
endif()

add_executable(coloring src/main.cpp)
target_link_libraries(coloring PRIVATE coloring_lib)

file(GLOB TEST_SOURCES CONFIGURE_DEPENDS tests/*.cpp)
add_executable(run_tests ${TEST_SOURCES})
target_link_libraries(run_tests PRIVATE coloring_lib)

enable_testing()
add_test(NAME all_tests COMMAND run_tests)
