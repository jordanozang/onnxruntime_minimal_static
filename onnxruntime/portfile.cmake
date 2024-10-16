vcpkg_from_github(
	REPO jordanozang/onnxruntime
	OUT_SOURCE_PATH SOURCE_PATH
	REF 77f7188fe83de43a73a85f54ff6aab88753290da 
	SHA512 3e847f67a13d728d4d0a2f7e82181fc4f5d9a29f965d6b13e0c66ff62d58dc1d08c8aca3551abfccc46c6a752e6e4b9b86e95feb4e96f15878ed35f5a1ac95b3 
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

