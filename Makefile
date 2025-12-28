# swissknife (jsk) Makefile
# Simplify automation for testing, linting, and environment setup.

# --- Configuration ---
.DEFAULT_GOAL := help
.ONESHELL:
SHELL := /bin/bash

# --- Targets ---

##@ General
help: ## Display this help menu
	@awk 'BEGIN { FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"; } \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2; } \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5); }' $(MAKEFILE_LIST)

all: lint test ## Run all checks (lint and test)

##@ Development & CI
lint: ## Run ShellCheck on all jsk-*.sh scripts
	@echo "==> Running ShellCheck..."
	@shellcheck jsk-*.sh

test: ## Run all Bats and Python tests
	@echo "==> Running Bats tests..."
	@bats *.bats
	@echo "==> Running Python tests..."
	@python3 jsk-system-check-test.py

scan: ## Run vulnerability scan using trivy
	@echo "==> Running trivy scan..."
	@trivy filesystem --scanners vuln,secret,config .

##@ Setup
ensure: ## Setup local development environment and paths
	@echo "==> Setting up ~/.swissknife environment..."
	@mkdir -pv $$HOME/.swissknife/bin $$HOME/.swissknife/completion
	@# Add bin to path if not present
	@grep -qxF 'export PATH="$$HOME/.swissknife/bin:$$PATH"' $$HOME/.bash_profile || \
		echo 'export PATH="$$HOME/.swissknife/bin:$$PATH"' >> $$HOME/.bash_profile
	@# Install semver tool
	@curl -sLS https://raw.githubusercontent.com/fsaintjacques/semver-tool/master/src/semver > $$HOME/.swissknife/bin/semver
	@chmod u+x $$HOME/.swissknife/bin/semver
	@# Install git-completion
	@curl -sLS https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > $$HOME/.swissknife/completion/git-completion.bash
	@echo "==> Setup complete. Please restart your shell or source ~/.bash_profile"

.PHONY: help all lint test scan ensure
