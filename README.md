# swissknife (jsk)

[![ShellCheck](https://github.com/mirageglobe/swissknife/actions/workflows/check.yml/badge.svg)](https://github.com/mirageglobe/swissknife/actions/workflows/check.yml)

An opinionated collection of scripts and tools to standardize common tasks like media conversion, system configuration, and CLI utilities.

## 🚀 Quick Start

To run any tool and see options:

```bash
bash ./jsk-<tool-name>.sh
```

Example:
```bash
./jsk-swapfile.sh deploy    # Set up a 2GB swapfile
```

---

## 🛠️ Tool Categories

### 🐚 Utility & DevOps
- **[jsk-bash-lib.sh](jsk-bash-lib.sh)**: Core shell library with utility functions for system, files, and UI.
- **[jsk-configuration-manager.sh](jsk-configuration-manager.sh)**: Manages project-specific configurations and dotfile environments.
- **[jsk-swapfile.sh](jsk-swapfile.sh)**: Utility to create and manage Linux swap files for memory management.
- **[jsk-filename-fixer.sh](jsk-filename-fixer.sh)**: Normalizes filenames for URL-safe and cross-platform compatibility.
- **[jsk-watch.sh](jsk-watch.sh)**: Runs a specified command at regular intervals with output monitoring.
- **[jsk-ensure.sh](jsk-ensure.sh)**: Basic dependency checker for local environment requirements.
- **[jsk-check-sftp.sh](jsk-check-sftp.sh)**: Validates SFTP availability and connectivity for remote transfers.
- **[jsk-check-socket.sh](jsk-check-socket.sh)**: Checks if a Unix socket exists and is responsive with retries.

### 📼 Media Conversion
- **[jsk-mp3.sh](jsk-mp3.sh)**: Media conversion utility focused on creating high-quality MP3 audio.
- **[jsk-mp4.sh](jsk-mp4.sh)**: Media conversion utility focused on creating optimized MP4 video.
- **[jsk-png.sh](jsk-png.sh)**: Image conversion and optimization utility with a focus on PNG.
- **[jsk-pdf.sh](jsk-pdf.sh)**: Utility for manipulating, joining, and processing PDF documents.

### 💾 Data & Security
- **[jsk-kvdb.sh](jsk-kvdb.sh)**: Minimal key-value database management using JSON-based storage.
- **[jsk-sqldb.sh](jsk-sqldb.sh)**: Database management and backup utility for MySQL, MariaDB, and others.
- **[jsk-skv.sh](jsk-skv.sh)**: Simple shell-based key-value store for lightweight data tracking.
- **[jsk-git-cache-meta.sh](jsk-git-cache-meta.sh)**: Simple file metadata caching (permissions/owners) for Git repositories.

---

## 📖 Shell Reference

### Common Exit Codes
| Code | Description |
| :--- | :--- |
| `1` | Catchall for general errors |
| `2` | Misuse of shell builtins |
| `126` | Command invoked cannot execute |
| `127` | Command not found |
| `128` | Invalid argument to exit |
| `130` | Script terminated by Control-C |
| `255` | Exit status out of range |

### Chaining Commands
- `;` : Run regardless of previous result.
- `&&` : Run only if previous command succeeded.
- `||` : Run only if previous command failed.
- `&` : Run in the background.

---

## 🤝 Contributing & Security

We welcome contributions! Please see our guides before getting started:

- 📖 **[CONTRIBUTING.md](CONTRIBUTING.md)**: Development standards and Vagrant setup.
- 🛡️ **[SECURITY.md](SECURITY.md)**: How to report vulnerabilities.
- 📋 **[Issue Templates](.github/ISSUE_TEMPLATE/report.md)**: For bug reports and feature requests.

---

## 📅 TODO
- [ ] Refactor samurai script.
- [ ] Update system check utility.
- [ ] Add comprehensive tests.

---

## ⚖️ License

Copyright 2012-2025 Jimmy MG Lim (mirageglobe@gmail.com)

Licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for full details.
