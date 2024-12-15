# SPDX-License-Identifier: GPL-3.0-only
# SPDX-FileCopyrightText: 2024 System76, Inc.

# Disable built-in rules and variables
MAKEFLAGS += --no-builtin-rules --no-builtin-variables
.SUFFIXES:

TARGET = x86_64-unknown-uefi

.PHONY: all
all:
	cargo build --target $(TARGET) --release

.PHONY: crate
crate:
	cargo build --target $(TARGET) --release --package $(CRATE)

.PHONY: clippy
clippy:
	cargo clippy --target $(TARGET)

.PHONY: clean
clean:
	cargo clean
