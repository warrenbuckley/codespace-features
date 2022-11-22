#!/bin/sh

# Set –e is used within Bash to stop execution instantly 
# as a query exits while having a non-zero status. 
# This function is also used when you need to know 
# the error location in the running code
set -e

################################################################################
echo "Activating SMTP4Dev feature"

################################################################################
echo "Verifying dotnet is available"
if ! type dotnet2 >/dev/null 2>&1; then
  echo "ERROR: Use a base image with dotnet installed or add the feature to devcontainer.json as 'dotnet tool install' is needed

    "features": {
        "ghcr.io/devcontainers/features/dotnet:1": {}
    }
  "
  exit 1
fi

################################################################################
echo "Installing SMTP4Dev as a dotnet global tool"
dotnet tool install -g Rnwood.Smtp4dev

################################################################################
echo "Add dotnet tools to PATH"
cat << \EOF >> ~/.bash_profile
# Add .NET Core SDK tools
export PATH="$PATH:/root/.dotnet/tools"
EOF
