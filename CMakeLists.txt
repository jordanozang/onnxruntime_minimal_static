# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
cmake_minimum_required(VERSION 3.30)

project(test_proj)

find_package(onnxruntime)

find_package(PNG REQUIRED)

include_directories(/home/jordanozang/installed/onnxruntime/include)

add_executable(fns_candy_style_transfer "fns_candy_style_transfer.c" "image_file.h")
if(WIN32)
  target_sources(fns_candy_style_transfer PRIVATE image_file_wic.cc)
else()
  target_sources(fns_candy_style_transfer PRIVATE image_file_libpng.c)
endif()
target_include_directories(fns_candy_style_transfer PRIVATE ${PROJECT_SOURCE_DIR}/include ${PNG_INCLUDE_DIRS})
target_link_libraries(fns_candy_style_transfer PRIVATE onnxruntime::onnxruntime ${PNG_LIBRARIES} ${WIL_LIB})
if(PNG_LIBDIR)
  target_link_directories(fns_candy_style_transfer PRIVATE ${PNG_LIBDIR})
endif()

link_libraries(PNG::PNG)
