
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO KhronosGroup/SPIRV-Headers
    REF sdk-1.3.250.1
    SHA512 ce48d6655a15bdc969cf31376d93ddf3225ae5d2a55d47bdae2219a79c6e1f6f90b4eae1ab8df7309287e3dab32567559efd7bb779bb9d59651be9f5ccfd816e
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)
vcpkg_cmake_install()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

vcpkg_fixup_pkgconfig()

# Handle copyright
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)