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
chmod -R g+r+w "${DOTNET_TOOLS_DIR}"
find "${DOTNET_TOOLS_DIR}" -type d | xargs -n 1 chmod g+s

# Trying something new...
# https://www.geeksforgeeks.org/bind-port-number-less-1024-non-root-access/
setcap CAP_NET_BIND_SERVICE=+eip ${DOTNET_TOOLS_DIR}/smtp4dev



################################################################################
echo "Add dotnet tools to PATH"
cat << \EOF >> ~/.bash_profile
# Add .NET Core SDK tools
export PATH="$PATH:${DOTNET_TOOLS_DIR}"
EOF


################################################################################
echo "Verify SMTP4Dev is installed"
dotnet tool list --tool-path ${DOTNET_TOOLS_DIR}


################################################################################

# Create an entrypoint/init file
# NOTE: It's inline here so we can use the variables/options
# That the feature can set to pass onto the smtp4dev .NET tool
echo "Creating entyrpoint launch script to autorun SMTP4Dev tool"

if [ "${AUTORUN}" = "true" ]; then

# Create entrypoint file to auto-run SMTP4Dev with the desired ports
cat <<-EOF > /usr/local/share/smtp4dev-entrypoint.sh
export WEBPORT="${WEBPORT:-5000}"
export SMTPPORT="${SMTPPORT:-25}"
export IMAPPORT="${IMAPPORT:-143}"

echo "SMTP4Dev Web Port ${WEBPORT}"
echo "SMTP4Dev SMTP Port: ${SMTPPORT}"
echo "SMTP4Dev IMAP Port: ${IMAPPORT}"

echo "Run SMTP4Dev global tool"
smtp4dev --smtpport ${SMTPPORT} --imapport ${IMAPPORT} --urls http://localhost:${WEBPORT}
EOF

else

# Create entrypoint file that contains a simple message to run themselves
cat <<-EOF > /usr/local/share/smtp4dev-entrypoint.sh
#!/bin/bash
# Print out friendly message that SMTP4Dev is in the path
echo "SMTP4Dev is available in the path and you can run it with your desired configuration"
echo "smtp4dev --help"
EOF

fi

