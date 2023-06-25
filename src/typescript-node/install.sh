#!/usr/bin/env bash

set -euo pipefail

pnpm config set store-dir ~/.pnpm-store

echo "Activating feature 'typescript-node'"
