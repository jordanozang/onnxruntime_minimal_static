vcpkg_from_github(
	REPO jordanozang/onnxruntime
	OUT_SOURCE_PATH SOURCE_PATH
	REF 6e977f12906ea09578a642f26297ce4b16bcc27c 
	SHA512 945fbd8c8aaaecb3f3e1c8fc409d64a431edb46c2505fa60fb865f49eac7ae6922d8b8d7b05916597ee73fbc84fe4dd9b977be5632ca6b63871b93a4b3028388 
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

