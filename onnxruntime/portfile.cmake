vcpkg_from_github(
	REPO jordanozang/onnxruntime
	OUT_SOURCE_PATH SOURCE_PATH
	REF 7ad118802cafa7a5cf7ae27f6862206ab25cabc2 
	SHA512 1f93da2e15c67de8064a14d612fefb78831e6b30ea4910b9029657da08b6165e2a3e4e708325e812cff7a5e104ee31fe43db9e13b153777cb833147f81dc0276
 )

vcpkg_cmake_configure(
	SOURCE_PATH ${SOURCE_PATH}/cmake
	OPTIONS
	--compile-no-warning-as-error
	-Donnxruntime_USE_EIGEN_PACKAGE=ON
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/onnxruntime)
vcpkg_fixup_pkgconfig()


file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)

