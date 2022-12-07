# https://github.com/nektos/act

# Runs github actions locally. 

# Needs docker.

GITHUB_ACT_BIN=act
GITHUB_ACT_BIN_VERSION=v0.2.24


# Override variables
# where to put the standard templates
GITHUB_SRC_TEMPLATES_FSPATH=$(PWD)/.templates/github
# where to look for CaddyFile to use at runtime 
GITHUB_SRC_FSPATH=$(PWD)/


# Computed variables
# PERFECT :) https://www.systutorials.com/how-to-get-a-makefiles-directory-for-including-other-makefiles/
_GITHUB_SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
_GITHUB_TEMPLATES_SOURCE=$(_GITHUB_SELF_DIR)/templates/github
_GITHUB_TEMPLATES_TARGET=$(GITHUB_SRC_TEMPLATES_FSPATH)


# PERFECT :) https://www.systutorials.com/how-to-get-a-makefiles-directory-for-including-other-makefiles/
SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

## act print, outputs all variables needed to run caddy
github-print:
	@echo
	@echo --- GITHUB ---

	@echo Deps:
	@echo GITHUB_ACT_BIN installed at : $(shell which $(GITHUB_ACT_BIN))
	@echo GITHUB_ACT_BIN_VERSION : 		$(GITHUB_ACT_BIN_VERSION)

	@echo
	@echo Override variables:
	@echo GITHUB_SRC_FSPATH: 			$(GITHUB_SRC_FSPATH)
	
	@echo
	@echo Computed variables:
	@echo _GITHUB_SELF_DIR:				$(_GITHUB_SELF_DIR)
	@echo _GITHUB_TEMPLATES_SOURCE: 	$(_GITHUB_TEMPLATES_SOURCE)
	@echo _GITHUB_TEMPLATES_TARGET: 	$(_GITHUB_TEMPLATES_TARGET)
	@echo
	

## prints the templates 
github-templates-print:
	@echo
	@echo listing templates ...
	cd $(_GITHUB_TEMPLATES_SOURCE) && $(ENV_TREE_BIN) -a -C
	
## Installs act
github-dep:
	@echo
	@echo installing ACT tool
	@echo installed ACT at : $(shell which $(GITHUB_ACT_BIN))
	go install -ldflags="-s -w" github.com/nektos/act@$(GITHUB_ACT_BIN_VERSION)


github-templates-dep:
	@echo
	@echo installing github templates to your project....
	mkdir -p $(_GITHUB_TEMPLATES_TARGET)
	cp -r $(_GITHUB_TEMPLATES_SOURCE)/* $(_GITHUB_TEMPLATES_TARGET)/
	@echo installed github templates  at : $(_GITHUB_TEMPLATES_TARGET)