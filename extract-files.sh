#!/bin/bash
#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=veux
VENDOR=xiaomi

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}"/../../..

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
        vendor/lib64/camera/components/com.qti.node.mialgocontrol.so)
            llvm-strip --strip-debug  "${2}"
            grep -q "libpiex_shim.so" "${2}" || "${PATCHELF}" --add-needed "libpiex_shim.so" "${2}"
            ;;
vendor/etc/seccomp_policy/vendor.qti.hardware.dsp.policy)
            echo 'madvise: 1' >> ${2}
            ;;
        vendor/lib/libstagefright_soft_ddpdec.so | vendor/lib/libstagefright_soft_ac4dec.so | \
        vendor/lib/libstagefrightdolby.so | vendor/lib64/libstagefright_soft_ddpdec.so | \
        vendor/lib64/libdlbdsservice.so | vendor/lib64/libstagefright_soft_ac4dec.so | vendor/lib64/libstagefrightdolby.so)
            "${PATCHELF}" --replace-needed "libstagefright_foundation.so" "libstagefright_foundation-v33.so" "${2}"
            ;;
    esac
}

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" true "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"
if [ -s "${MY_DIR}/proprietary-files-recovery.txt" ]; then
    extract "${MY_DIR}/proprietary-files-recovery.txt" "${SRC}" "${KANG}" --section "${SECTION}"
fi

"${MY_DIR}/setup-makefiles.sh"
