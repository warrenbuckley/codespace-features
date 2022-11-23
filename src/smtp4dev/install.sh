#!/bin/sh

# Set –e is used within Bash to stop execution instantly 
# as a query exits while having a non-zero status. 
# This function is also used when you need to know 
# the error location in the running code
set -e

################################################################################
echo "Activating SMTP4Dev feature"

# Variables
AUTORUN=${AUTORUN:-"true"}
DOTNET_TOOLS_DIR=${DOTNET_TOOLS_DIR:-"/usr/local/dotnet-tools"}


################################################################################
echo "Verifying dotnet is available"
if ! type dotnet >/dev/null 2>&1; then
  echo "ERROR: Use a base image with dotnet installed or add the feature to devcontainer.json as 'dotnet tool install' is needed

    "features": {
        "ghcr.io/devcontainers/features/dotnet:1": {}
    }
  "
  exit 1
fi


################################################################################
echo "Installing SMTP4Dev as a dotnet global tool"
dotnet tool install --tool-path ${DOTNET_TOOLS_DIR} Rnwood.Smtp4dev 


################################################################################
# https://github.com/devcontainers/features/blob/main/src/java/install.sh#L146-L155

echo "Set permissions on SMTP4Dev tool (Allows port 25 to be used)"

# Create smtp4dev group, dir, and set sticky bit
if ! cat /etc/group | grep -e "^smtp4dev:" > /dev/null 2>&1; then
    groupadd -r smtp4dev
fi
usermod -a -G smtp4dev ${_REMOTE_USER}
umask 0002

chown -R "${_REMOTE_USER}:smtp4dev" ${DOTNET_TOOLS_DIR}
find ${DOTNET_TOOLS_DIR} -type d -print0 | xargs -d '\n' -0 chmod g+s


################################################################################
echo "Add dotnet tools to PATH"
cat << \EOF >> ~/.bash_profile
# Add .NET Core SDK tools
export PATH="$PATH:/usr/local/dotnet-tools"
EOF


################################################################################
echo "Verify SMTP4Dev is installed"
dotnet tool list --tool-path /usr/local/dotnet-tools


################################################################################

# By default SMTP4Dev will autorun
if [ "${AUTORUN}" = "true" ]; then

  echo "Copy over the entrypoint launch script to autorun SMTP4Dev"
  cp -f smtp4dev-entrypoint.sh /usr/local/share

fi


