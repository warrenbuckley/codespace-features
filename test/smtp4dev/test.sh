#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'sqlite' feature with no options.
#
# Eg:
# {
#    "image": "<..some-base-image...>",
#    "features": {
#      "smtp4dev": {}
#    }
# }
# 
# This test can be run with the following command (from the root of this repo)
#    devcontainer features test --features smtp4dev
#    devcontainer features test --features smtp4dev --base-image mcr.microsoft.com/devcontainers/dotnet:0-7.0

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.

# Definition specific tests
check "smtp4dev installed" type smtp4dev
check "smtp4dev dotnet tool list" dotnet tool list --tool-path /usr/local/dotnet-tools

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults