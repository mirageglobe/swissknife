
# ================================================================ info ===== #

# sensible dotfiles and bootstrap using makefile menu script
# by mirageglobe ::  www.mirageglobe.com :: github.com/mirageglobe

# ======================================================= configuration ===== #

# ------------------------------------------------------------- targets ----- #

# defaults
MENU := all clean test

# helpers
MENU += help readme scan

# load phony
.PHONY: $(MENU)

# set default target
.DEFAULT_GOAL := help

# ------------------------------------------------------- check version ----- #

# enforce make 4+
# ifeq ($(origin .RECIPEPREFIX), undefined)
#   $(error this make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later. use `brew install make` and run `gmake`)
# endif

# ------------------------------------------------------------ settings ----- #

# set fast fail so targets fail on error
# .SHELLFLAGS := -eu -o pipefail -c

# set default shell to run makefile (homebrew default is /usr/local/bin/bash)
# SHELL := /bin/bash
# SHELL := /usr/local/bin/bash

# sets all lines in the recipe to be passed in a single shell invocation
# needs make version 4+
# useful for pushd and popd
.ONESHELL:

# ----------------------------------------------- environment variables ----- #

# load dot.env file into environment (prepend hypen to skip if not found)
-include dot.env

# load current shell env vars into makefile shell env
export

# ================================================== makefile functions ===== #

# note that define can only take single line or rule

define func_print_arrow
	# ==> $(1)
endef

define func_print_header
	# =================================================== $(1) ===== #
endef

define func_check_file_regex
	cat $(1) || grep "$(2)"
endef

define func_check_command
	command -V $(1) || printf "$(2)"
endef

define func_print_tab
	printf "%s\t\t%s\t\t%s\n" $(1) $(2) $(3)
endef

# ================================================================ main ===== #

##@ Helpers

help:														## display this help
	@awk 'BEGIN { FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"; } \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2; } \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5); } \
		END { printf ""; }' $(MAKEFILE_LIST)

readme:													## show information and notes
	$(call func_print_header,show readme)
	@touch README.md
	@cat README.md

scan:														## show vulnerability scan examples
	$(call func_print_header,trivy scan)
	@echo '# for vuln use https://github.com/aquasecurity/trivy'
	@echo 'trivy filesystem --scanners vuln,secret,config .'

##@ Menu (example)

ensure-swissknife:							## install swissknife tool via ~/.swissknife folder
	$(call func_print_arrow,swissknife - skip)
	@echo "proceed? [enter to continue / ctrl-c to quit]"; read nirvana;
	# bootstrap ~/.swissknife/bin binary folder
	-mkdir -pv $$HOME/.swissknife/bin
	echo ""
	# setup swissknife path
	-grep -qxF 'export PATH="$$HOME/.swissknife/bin:$$PATH"' $$HOME/.bash_profile || echo '\nexport PATH="$$HOME/.swissknife/bin:$$PATH"' >> $$HOME/.bash_profile
	echo ""
	# ensure all tools in tools folder are installed to swissknife
	# -cp -p tools/* $$HOME/.swissknife/bin
	echo ""
	# add semver tool
	-curl https://raw.githubusercontent.com/fsaintjacques/semver-tool/master/src/semver > $$HOME/.swissknife/bin/semver && chmod u+x $$HOME/.swissknife/bin/semver
	echo ""
	# bootstrap ~/.swissknife/completion completion folder
	-mkdir -pv $$HOME/.swissknife/completion
	-grep -qxF 'export PATH="$$HOME/.swissknife/completion:$$PATH"' $$HOME/.bash_profile || echo '\nexport PATH="$$HOME/.swissknife/completion:$$PATH"' >> $$HOME/.bash_profile
	echo ""
	# add git-completion
	-curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > $$HOME/.swissknife/completion/dot.bash-completion.git.bash
	echo ""
	# summary
	ls ~/.swissknife/bin
	ls ~/.swissknife/completion

