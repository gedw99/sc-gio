### VSCODE make file

# Debugger notes: https://vscode-debug-specs.github.io/go/

VSCODE_BIN=code

# Override variables
# where to put the standard templates
VSCODE_SRC_TEMPLATES_FSPATH=$(PWD)/.templates/vscode
# where to look for .vscode ( and other ) files to use at runtime 
VSCODE_SRC_FSPATH=$(PWD)/


# Computed variables
# PERFECT :) https://www.systutorials.com/how-to-get-a-makefiles-directory-for-including-other-makefiles/
_VSCODE_SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
_VSCODE_TEMPLATES_SOURCE=$(_VSCODE_SELF_DIR)/templates/vscode
_VSCODE_TEMPLATES_TARGET=$(VSCODE_SRC_TEMPLATES_FSPATH)

## vscode print, outputs all variables needed to run vscode
vscode-print:
	@echo
	@echo --- VSCODE ---
	@echo Deps:
	@echo VSCODE_BIN: 						$(VSCODE_BIN) installed at : $(shell which $(VSCODE_BIN))
	@echo VSCODE_BIN_VERSION: 				$(VSCODE_BIN) version at : $(shell $(VSCODE_BIN) --version)
	@echo
	@echo Override variables:
	@echo VSCODE_SRC_TEMPLATES_FSPATH: 		$(VSCODE_SRC_TEMPLATES_FSPATH)
	@echo VSCODE_SRC_FSPATH: 				$(VSCODE_SRC_FSPATH)
	@echo
	@echo Computed variables:
	@echo _VSCODE_SELF_DIR:					$(_VSCODE_SELF_DIR)
	@echo _VSCODE_TEMPLATES_SOURCE: 		$(_VSCODE_TEMPLATES_SOURCE)
	@echo _VSCODE_TEMPLATES_TARGET: 		$(_VSCODE_TEMPLATES_TARGET)
	@echo


## prints the templates
vscode-templates-print:
	@echo
	@echo listing templates ...
	cd $(_VSCODE_TEMPLATES_SOURCE) && $(ENV_TREE_BIN) -a -C

## vscode dep installs vscode and standard templates
vscode-dep:
	@echo
	@echo installing vscode
	#brew install brew install --cask visual-studio-code
	@echo installed gio at : $(shell which $(VSCODE_BIN))

	$(MAKE) vscode-templates-dep

## Installs the standard templates
vscode-templates-dep:
	@echo
	@echo installing vscode templates 
	# copy templates up to working dir/templates
	mkdir -p $(_VSCODE_TEMPLATES_TARGET)
	cp -r $(_VSCODE_TEMPLATES_SOURCE)/* $(_VSCODE_TEMPLATES_TARGET)/
	@echo installed vscode templates  at : $(_VSCODE_TEMPLATES_TARGET)


## vscode run, runs vscode using your vscode launch.json file
vscode-run:
	# opens the project, so you can debug it, etc
	code $(VSCODE_SRC_FSPATH)
	