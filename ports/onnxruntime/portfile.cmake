vcpkg_from_github(
	REPO jordanozang/onnxruntime
	OUT_SOURCE_PATH SOURCE_PATH
	REF 3a442d8161c9833e9d621a76d75129708a59b940 
	SHA512 75b55300137ed255feb152824e054f153b6d45cb0eb62d711909cc74c3c8998fc58ca43810c96daddd68177fcf9eb3d453b28aab995447635ad2faa884a38fa5
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
