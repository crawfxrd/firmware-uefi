# Building

The xtask pattern is used for ad-hoc tooling written in Rust. It allows mixing
host tooling and UEFI target packages in a single workspace without relying on
external tooling like GNU Make or shell/Python scripts.

```
cargo xtask build
```
