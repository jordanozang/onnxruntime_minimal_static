
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO onnx/onnx
    REF v1.16.1 
    SHA512 0ae1b36563ddeaa9947bf452eb20b83174e4c2bc4696b61768f096c401666323343fac0f699f756da99d3c29df15a0bd78fe3fa51da15f133617d7310c5b28d4
)

vcpkg_cmake_configure(
	SOURCE_PATH "${SOURCE_PATH}"
	OPTIONS
	    -DONNX_ML=ON
        -DONNX_GEN_PB_TYPE_STUBS=ON
        -DONNX_USE_PROTOBUF_SHARED_LIBS=${USE_PROTOBUF_SHARED}
        -DONNX_USE_LITE_PROTO=OFF
        -DONNX_USE_MSVC_STATIC_RUNTIME=${USE_STATIC_RUNTIME}
        -DONNX_BUILD_TESTS=OFF
        -DONNX_BUILD_BENCHMARKS=OFF
		-DONNX_DISABLE_STATIC_REGISTRATION=ON
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/ONNX)

file(READ "${CURRENT_PACKAGES_DIR}/share/onnx/ONNXConfig.cmake" FILE_CONTENTS)
string(REPLACE "Protobuf" "protobuf" FILE_CONTENTS "${FILE_CONTENTS}")
string(REPLACE "/../../../" "/../../" FILE_CONTENTS "${FILE_CONTENTS}")
file(WRITE "${CURRENT_PACKAGES_DIR}/share/onnx/ONNXConfig.cmake" "${FILE_CONTENTS}")

file(COPY ${SOURCE_PATH}/onnx/onnx-ml.proto DESTINATION ${CURRENT_PACKAGES_DIR}/include/onnx/)


