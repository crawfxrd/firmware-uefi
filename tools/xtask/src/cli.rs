// SPDX-License-Identifier: GPL-3.0-only
// SPDX-FileCopyrightText: 2025 System76, Inc.

use clap::{Parser, Subcommand};

#[derive(Debug, Subcommand)]
pub enum Command {
    /// Build UEFI modules
    Build,
}

#[derive(Debug, Parser)]
pub struct Cli {
    #[clap(subcommand)]
    pub command: Command,
}
