
# SMTP4Dev: A dotnet test email SMTP server (smtp4dev)

Installs SMTP4Dev using 'dotnet tool install' into the devcontainer and maps the port

## Example Usage

```json
"features": {
    "ghcr.io/warrenbuckley/codespace-features/smtp4dev:0": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| webport | Port number for SMTP4Dev web UI | string | 5000 |
| smtpport | Port number for SMTP4Dev SMTP port to listen on | string | 2525 |
| imapport | Port number for SMTP4Dev IMAP port to listen on | string | 1443 |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/warrenbuckley/codespace-features/blob/main/src/smtp4dev/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
