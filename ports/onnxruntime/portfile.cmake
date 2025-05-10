vcpkg_from_github(
	REPO jordanozang/onnxruntime
	OUT_SOURCE_PATH SOURCE_PATH
	REF 20f7f58d7744bbe0d303c22caa4efd148cc86006 
	SHA512 3f2b807a414161bfd39dedb7dbc4a86c12620b6032f957a903be887e47be504707a8509a58ed4ec0747c88b15a561282385a6713535fa3fc56f9e12ca67df9c5
 )

vcpkg_cmake_configure(
	SOURCE_PATH ${SOURCE_PATH}/cmake
	OPTIONS
	--compile-no-warning-as-error
	-Donnxruntime_USE_EIGEN_PACKAGE=ON
	-Donnxruntime_USE_VCPKG=ON
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/onnxruntime)
vcpkg_fixup_pkgconfig()


file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
