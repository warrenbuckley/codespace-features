
# SMTP4Dev: A dotnet test email SMTP server (smtp4dev)

Installs SMTP4Dev using 'dotnet tool install' into the devcontainer and maps the port

## Example Usage

```json
"features": {
    "ghcr.io/warrenbuckley/codespace-features/smtp4dev:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| autorun | Will autorun the SMTP4Dev server on startup | boolean | true |
| webport | Port number for SMTP4Dev web UI | string | 5000 |
| smtpport | Port number for SMTP4Dev SMTP port to listen on | string | 25 |
| imapport | Port number for SMTP4Dev IMAP port to listen on | string | 143 |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/warrenbuckley/codespace-features/blob/main/src/smtp4dev/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
