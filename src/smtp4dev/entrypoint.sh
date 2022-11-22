#!/bin/bash
# Attempt to start SMTP4Dev dotnet globnal tool
set +e 

################################################################################
# Options/variables from configuring the feature - each with the a fallback value if not set
SMTP4DEV_WEBPORT=${WEBPORT:-"5000"}
SMTP4DEV_SMTPPORT=${SMTPPORT:-"2525"}
SMTP4DEV_IMAPPORT=${IMAPPORT:-"1443"}

################################################################################
echo "SMTP4DEV:  Web Port: $SMTP4DEV_WEBPORT"
echo "SMTP4DEV: SMTP Port: $SMTP4DEV_SMTPPORT"
echo "SMTP4DEV: IMAP Port: $SMTP4DEV_IMAPPORT"

################################################################################
echo "Run SMTP4Dev global tool"
smtp4dev --smtpport=2525 --imapport=1444
