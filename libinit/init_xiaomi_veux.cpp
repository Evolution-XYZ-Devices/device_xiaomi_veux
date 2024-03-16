/*
 * Copyright (C) 2022 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_dalvik_heap.h>
#include <libinit_variant.h>
#include <libinit_utils.h>
#include <libinit_lmk.h>

#include "vendor_init.h"

static const variant_info_t veux_global_info = {
    .hwc_value = "Global",
    .model_value = "S88006AA1",

    .brand = "Redmi",
    .device = "veux",
    .marketname = "Redmi Note 11 Pro 5G",
    .model = "2201116SG",
    .name = "veux_global",
    .build_fingerprint = "Redmi/veux_global/veux:13/TKQ1.221114.001/V14.0.4.0.TKCMIXM:user/release-keys",

    .nfc = true,
};

static const variant_info_t veux_in_info = {
    .hwc_value = "India",
    .model_value = "S88006AA1",

    .brand = "Redmi",
    .device = "veux",
    .marketname = "Redmi Note 11 Pro 5G",
    .model = "2201116SG",
    .name = "veux_in",
    .build_fingerprint = "Redmi/veux_in/veux:13/TKQ1.221114.001/V14.0.6.0.TKCINXM:user/release-keys",
};

static const variant_info_t veux_info = {
    .hwc_value = "CN",
    .model_value = "S88007AA1",

    .brand = "Redmi",
    .device = "veux",
    .marketname = "Redmi Note 11E Pro",
    .model = "2201116SC",
    .name = "veux",
    .build_fingerprint = "Redmi/veux/veux:12/TKQ1.221114.001/V14.0.1.0.TKCCNXM:user/release-keys",

    .nfc = true,
};

static const variant_info_t peux_in_info = {
    .hwc_value = "",
    .model_value = "S88007EA1",

    .brand = "Redmi",
    .device = "peux",
    .marketname = "Redmi Note 11 Pro+ 5G",
    .model = "2201116SI",
    .name = "peux_in",
    .build_fingerprint = "Redmi/peux_in/peux:13/TKQ1.221114.001/V14.0.6.0.TKCINXM:user/release-keys",
};

static const variant_info_t veux_jp_info = {
    .hwc_value = "",
    .model_value = "S88008BA1",

    .brand = "Redmi",
    .device = "veux",
    .marketname = "Redmi Note 11 Pro 5G",
    .model = "2201116SR",
    .name = "veux_jp",
    .build_fingerprint = "Redmi/veux_jp/veux:13/TKQ1.221114.001/V14.0.1.0.TKCJPXM:user/release-keys",

    .nfc = true,
};

static const variant_info_t veux_p_global_info = {
    .hwc_value = "Global",
    .model_value = "S88106BA1",

    .brand = "POCO",
    .device = "veux",
    .marketname = "POCO X4 Pro 5G",
    .model = "2201116PG",
    .name = "veux_p_global",
    .build_fingerprint = "POCO/veux_p_global/veux:13/TKQ1.221114.001/V14.0.4.0.TKCMIXM:user/release-keys",

    .nfc = true,
};

static const variant_info_t veux_p_in_info = {
    .hwc_value = "India",
    .model_value = "S88106BA1",

    .brand = "POCO",
    .device = "veux",
    .marketname = "POCO X4 Pro 5G",
    .model = "2201116PG",
    .name = "veux_p_in",
    .build_fingerprint = "POCO/veux_p_in/veux:13/TKQ1.221114.001/V14.0.6.0.TKCINXM:user/release-keys",
};

static const variant_info_t peux_p_in_info = {
    .hwc_value = "India",
    .model_value = "S88107BA1",

    .brand = "POCO",
    .device = "veux",
    .marketname = "POCO X4 Pro 5G",
    .model = "2201116PI",
    .name = "peux_p_in",
    .build_fingerprint = "POCO/peux_p_in/peux:13/TKQ1.221114.001/V14.0.6.0.TKCINXM:user/release-keys",
};

static const std::vector<variant_info_t> variants = {
    veux_global_info,
    veux_in_info,
    veux_info,
    peux_in_info,
    veux_jp_info,
    veux_p_global_info,
    veux_p_in_info,
    peux_p_in_info,
};

void vendor_load_properties() {
    search_variant(variants);
    set_dalvik_heap();
    set_lmk();

    // SafetyNet workaround
    property_override("ro.boot.verifiedbootstate", "green");
    property_override("ro.oem_unlock_supported", "0");

    // LMKD Tunning

}
