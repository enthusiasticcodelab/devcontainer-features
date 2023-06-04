#!/usr/bin/env bash

set -euo pipefail

devcontainer_feature_json="$(pwd)/src/typescript-node/devcontainer-feature.json"

# Read the current version from the JSON file
current_version=$(sed -n 's/.*"version": "\([^"]*\)".*/\1/p' "${devcontainer_feature_json}")

# Prompt the user for the new version
echo -n "Enter the new version: "
read -r new_version

# Ask for confirmation
read -rsp $'Are you sure you want to update the version and write it to the file? (y/n) ' -n1 confirm
echo

if [[ $confirm != "y" ]]; then
  echo "Version update cancelled."
  exit 0
fi

sed -i "s/\"version\": \"${current_version}\"/\"version\": \"${new_version}\"/" "${devcontainer_feature_json}"

git add "${devcontainer_feature_json}"
git commit -m "chore: bump up version"
