#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'sqlite' feature with no options.
#
# Eg:
# {
#    "image": "<..some-base-image...>",
#    "features": {
#      "sqlite": {}
#    }
# }
# 
# This test can be run with the following command (from the root of this repo)
#    devcontainer features test --features sqlite

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.

# Definition specific tests
check "version info" sqlite3 --version

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults