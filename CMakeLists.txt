# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
cmake_minimum_required(VERSION 3.30)

project(test_proj)

#find_package(absl 20240722 REQUIRED)
#find_package(date REQUIRED)
#find_package(Eigen3 REQUIRED)
#find_package(nlohmann_json REQUIRED)
#find_package(ONNX 1.16.1 REQUIRED)
#add_library(ONNX::onnx ALIAS onnx)
#add_library(ONNX::onnx_proto ALIAS onnx_proto)
#find_package(re2 REQUIRED)
#find_package(flatbuffers REQUIRED)
#find_package(unofficial-nsync CONFIG REQUIRED)
#find_package(cpuinfo REQUIRED)
#find_package(protobuf REQUIRED)
#find_package(Boost REQUIRED COMPONENTS mp11)
#add_library(nsync_cpp ALIAS unofficial::nsync::nsync_cpp)
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
