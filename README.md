# Codespace Features
A collection of devcontainer features to use in GitHub Codespaces.

## SQLite (sqlite)

Installs SQLite into the devcontainer using `apt install sqlite3` and adds the [SQLite VSCode extension](https://marketplace.visualstudio.com/items?itemName=alexcvzz.vscode-sqlite)

### Example Usage

```json
"features": {
    "ghcr.io/warrenbuckley/sqlite-codespace-feature/sqlite:1": {}
}
```
