# Adding a Cargo package

Create a new Rust application in the `crates/` directory.

Example:

```
cargo new --bin crates/example-driver
```

## `.cargo/config.toml`

Create a `.cargo/config.toml` file in the package directory that sets the
default target to `x86_64-unknown-uefi` and sets the subsystem linker arg.

Example:

```toml
# SPDX-License-Identifier: CC0-1.0
# SPDX-FileCopyrightText: NONE

[build]
target = "x86_64-unknown-uefi"
rustflags = [
    "-Clink-arg=/subsystem:efi_runtime_driver",
]
```

## Makefile

Add a Makefile that sets the `PACKAGE` name and includes `common.mk`.

Example:

```make
# SPDX-License-Identifier: GPL-3.0-only
# SPDX-FileCopyrightText: 2024 System76, Inc.

PACKAGE = example-driver

include ../common.mk
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
