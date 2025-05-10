vcpkg_from_github(
	REPO jordanozang/onnxruntime
	OUT_SOURCE_PATH SOURCE_PATH
	REF 31054341ee64536ffe2d8af07ec422a419d19a8a 
	SHA512 b099cc46275ce7b65db5cde57f0147175099a8417dbb36de51935d40de68605a162f025803605684d98ec358dbf7ea81a538e92f8c312a8977f25db935079314
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
