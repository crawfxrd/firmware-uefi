# SPDX-License-Identifier: GPL-3.0-only
# SPDX-FileCopyrightText: 2024 System76, Inc.

# Disable built-in rules and variables
MAKEFLAGS += --no-builtin-rules --no-builtin-variables
.SUFFIXES:

export TARGET = x86_64-unknown-uefi

# cargo will only read `.cargo/config.toml` from the working directory it was
# invoked from. Since each crate may have to set different flags, it is not
# possible to:
# - call `cargo build` directly
# - specify the manifest path to each crate
# Ref: https://doc.rust-lang.org/cargo/reference/config.html
# Ref: https://github.com/rust-lang/cargo/issues/2930

.PHONY: all
all:
	@for crate in $$(find crates/ -name 'Cargo.toml' -printf "%h\n"); do \
		$(MAKE) -C "$$crate/" || exit 1; \
	done

.PHONY: crate
crate:
	$(MAKE) -C "crates/$(CRATE)"

.PHONY: clippy
clippy:
	cargo clippy --target $(TARGET) --release

.PHONY: clean
clean:
	cargo clean
