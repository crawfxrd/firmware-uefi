# SPDX-License-Identifier: GPL-3.0-only
# SPDX-FileCopyrightText: 2024 System76, Inc.

# Targets common for all crates

TARGET ?= x86_64-unknown-uefi

.PHONY: build
build:
	cargo build --target $(TARGET) --release

.PHONY: clippy
clippy:
	cargo clippy --target $(TARGET) --release

.PHONY: clean
clean:
	cargo clean --target $(TARGET) --release --package $(PACKAGE)
