#!/bin/sh

# Set –e is used within Bash to stop execution instantly 
# as a query exits while having a non-zero status. 
# This function is also used when you need to know 
# the error location in the running code
set -e

echo "Activating SQLite feature"

echo "Running apt-get update..."
apt-get update -y

echo "Installing SQLite..."
apt-get install -y sqlite3