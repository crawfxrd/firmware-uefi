# SPDX-License-Identifier: GPL-3.0-only
# SPDX-FileCopyrightText: 2024 System76, Inc.

# Targets common for all crates

.PHONY: build
build:
	cargo build --release

.PHONY: clean
clean:
	cargo clean --package $(PACKAGE)
