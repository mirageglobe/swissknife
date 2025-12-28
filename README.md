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
- **[jsk-bash-lib.sh](jsk-bash-lib.sh)**: Core library functions for bash scripting.
- **[jsk-configuration-manager.sh](jsk-configuration-manager.sh)**: Minimalist configuration management.
- **[jsk-swapfile.sh](jsk-swapfile.sh)**: Effortless swapfile setup for Linux.
- **[jsk-filename-fixer.sh](jsk-filename-fixer.sh)**: Standardize filenames (lowercase, hyphens).
- **[jsk-watch.sh](jsk-watch.sh)**: Simple command ticker/refresher.
- **[jsk-ensure.sh](jsk-ensure.sh)**: Dependency checker for scripts.

### 📼 Media Conversion
- **[jsk-mp3.sh](jsk-mp3.sh)**: Optimize music files to MP3.
- **[jsk-mp4.sh](jsk-mp4.sh)**: Batch convert video to MP4.
- **[jsk-png.sh](jsk-png.sh)**: Web-optimized PNG conversion.
- **[jsk-pdf.sh](jsk-pdf.sh)**: Compact PDF compression using Ghostscript.

### 💾 Data & Security
- **[jsk-kvdb.sh](jsk-kvdb.sh)**: Extremely simple JSON key-value store.
- **[jsk-sqldb.sh](jsk-sqldb.sh)**: SQL database backup and restore helper.
- **[jsk-check-socket.sh](jsk-check-socket.sh)**: Audit running service sockets.

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

## ⚖️ License

Copyright 2012-2025 Jimmy MG Lim (mirageglobe@gmail.com)

Licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for full details.
