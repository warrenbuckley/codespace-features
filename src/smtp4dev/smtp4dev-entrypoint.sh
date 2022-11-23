#!/bin/bash
# Attempt to start SMTP4Dev dotnet globnal tool
set +e 

################################################################################
# Options/variables from configuring the feature - each with the a fallback value if not set
SMTP4DEV_WEBPORT=${WEBPORT:-"80000"}
SMTP4DEV_SMTPPORT=${SMTPPORT:-"252500"}
SMTP4DEV_IMAPPORT=${IMAPPORT:-"1443000"}

################################################################################
echo "SMTP4DEV:  Web Port: $SMTP4DEV_WEBPORT"
echo "SMTP4DEV: SMTP Port: $SMTP4DEV_SMTPPORT"
echo "SMTP4DEV: IMAP Port: $SMTP4DEV_IMAPPORT"

################################################################################
echo "Print out ENV variables (Debug for options)"
printenv

################################################################################
echo "Run SMTP4Dev global tool"
smtp4dev
