// SPDX-License-Identifier: GPL-3.0-only
// SPDX-FileCopyrightText: 2024 System76, Inc.

use std::env;

fn main() {
    println!("cargo::rerun-if-changed=build.rs");

    let target = env::var("TARGET").unwrap();
    if target.ends_with("-unknown-uefi") {
        println!("cargo::rustc-link-arg=/subsystem:efi_boot_service_driver");
    }
}
