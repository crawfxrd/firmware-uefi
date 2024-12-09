# Adding a package

- Create a new Rust application
  - `cargo new --bin crates/<package>`
  - Fix formatting of the members in `Cargo.toml` workspace
- Create a `.cargo/config.toml` file in the package directory
  - Set the default target to `x86_64-unknown-uefi`
  - Set the subsystem linker arg
- Add a Makefile that sets the `PACKAGE` name and includes `common.mk`
- Add `package.inf` for integration with edk2

Example package `.cargo/config.toml`:

```toml
[build]
target = "x86_64-unknown-uefi"
rustflags = [
    "-Clink-arg=/subsystem:efi_boot_service_driver",
]
```
