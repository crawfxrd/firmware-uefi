# Adding a Cargo package

Create a new Rust application in the `crates/` directory.

Example:

```
cargo new --bin crates/example-driver
```

## Package build script

`*-unknown-uefi` by default creates UEFI applications. For drivers, the
subsystem type must be set by a linker argument.

Create a `build.rs` file in the package root that sets `/subsystem` for UEFI
targets.

Example:

```rust
// SPDX-License-Identifier: GPL-3.0-only
// SPDX-FileCopyrightText: 2024 System76, Inc.

use std::env;

fn main() {
    let target = env::var("TARGET").unwrap();
    if target.ends_with("-unknown-uefi") {
        println!("cargo::rustc-link-arg=/subsystem:efi_boot_service_driver");
    }
}
```

## EDK II Module Information (INF) file

Add a `module.inf` if the package is to be integrated into an edk2 build.

Example:

```ini
# SPDX-License-Identifier: GPL-3.0-only
# SPDX-FileCopyrightText: 2024 System76, Inc.

[Defines]
  INF_VERSION                    = 1.27
  BASE_NAME                      = example-driver
  FILE_GUID                      = fefc99de-af68-4858-ab50-4fad04805400
  MODULE_TYPE                    = DXE_DRIVER
  VERSION_STRING                 = 0.1

[Binaries.X64]
  PE32|target/x86_64-unknown-uefi/release/example-driver.efi|*
```
