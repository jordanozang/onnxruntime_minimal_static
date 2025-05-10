vcpkg_from_github(
	REPO jordanozang/onnxruntime
	OUT_SOURCE_PATH SOURCE_PATH
	REF ce612e6d93e620d96fe339aaa84b9e67fd2de3b5 
	SHA512 784e58a10c2d05de5978ab9082fa52f2027f8aa5097ca2a3c61c452f553957ca4873179e820ae9a52f75000a3a00aaa4d0f4b758dc34c0bac069048e9a4dcae5
 )

vcpkg_cmake_configure(
	SOURCE_PATH ${SOURCE_PATH}/cmake
	OPTIONS
	--compile-no-warning-as-error
	-Donnxruntime_USE_VCPKG=ON
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/onnxruntime)
vcpkg_fixup_pkgconfig()


file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
