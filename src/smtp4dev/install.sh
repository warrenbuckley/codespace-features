#!/bin/sh

# Set –e is used within Bash to stop execution instantly 
# as a query exits while having a non-zero status. 
# This function is also used when you need to know 
# the error location in the running code
set -e

echo "Activating SMTP4Dev feature"

echo "Verifying dotnet is available"
dotnet --version

echo "Installing SMTP4Dev as a dotnet global tool"
dotnet tool install -g Rnwood.Smtp4dev

echo "Run SMTP4Dev global tool"
smtp4dev
#cd $HOME/.dotnet/tools && ./smtp4dev