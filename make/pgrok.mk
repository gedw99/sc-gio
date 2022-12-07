# https://github.com/jerson/pgrok
# https://www.proxy.jetzt/

# also https://github.com/fasmide/remotemoe

# PGROK



PGROK_BIN=pgrok
PGROK_BIN_VERSION=v2.4.5

PGROKD_BIN=pgrokd
PGROKD_BIN_VERSION=v2.4.5


# Override variables
# where to put the standard templates
PGROK_SRC_TEMPLATES_FSPATH=$(PWD)/.templates/pgrok
# where to look for Config file to use at runtime 
PGROK_SRC_PATH=$(PWD)


# Computed variables
# PERFECT :) https://www.systutorials.com/how-to-get-a-makefiles-directory-for-including-other-makefiles/
_PGROK_SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
_PGROK_TEMPLATES_SOURCE=$(_PGROK_SELF_DIR)/templates/pgrok
_PGROK_TEMPLATES_TARGET=$(PGROK_SRC_TEMPLATES_FSPATH)



## pgrok print, outputs all variables needed to run pgrok
pgrok-print:
	@echo
	@echo --- PGROK ---

	@echo Deps:
	@echo PGROK_BIN: 				$(PGROK_BIN) client installed  at : $(shell which $(PGROK_BIN))
	@echo PGROK_BIN_VERSION: 		$(PGROK_BIN_VERSION)

	@echo PGROKD_BIN: 				$(PGROKD_BIN) server installed at : $(shell which $(PGROKD_BIN))
	@echo PGROKD_BIN_VERSION: 		$(PGROKD_BIN_VERSION)
	
	@echo
	@echo Override variables:
	@echo PGROK_SRC_PATH: 			$(PGROK_SRC_PATH)
	
	@echo Computed variables:
	@echo _PGROK_SELF_DIR:			$(_PGROK_SELF_DIR)
	@echo _PGROK_TEMPLATES_SOURCE: 	$(_PGROK_TEMPLATES_SOURCE)
	@echo _PGROK_TEMPLATES_TARGET: 	$(_PGROK_TEMPLATES_TARGET)
	@echo


## prints the templates 
pgrok-templates-print:
	@echo
	@echo listing templates ...
	cd $(_PGROK_TEMPLATES_SOURCE) && $(ENV_TREE_BIN) -a -C

## pgrok dep installs the pgrok and mkcert binary to the go bin
## cand copies the templates up into your templates working directory
# Useful where you want to grab them and customise.
pgrok-dep:
	@echo
	@echo installing pgrok client binary
	#go install github.com/jerson/pgrok/cmd/pgrok@latest
	brew install jerson/tap/pgrok
	@echo installed pgrok at : $(shell which $(PGROK_BIN))

	@echo
	@echo installing pgrok serer binary
	brew install jerson/tap/pgrokd
	@echo installed pgrokd at : $(shell which $(PGROKD_BIN))

	$(MAKE) pgrok-templates-dep

pgrok-templates-dep:
	@echo
	@echo installing pgrok templates to your project....
	mkdir -p $(_PGROK_TEMPLATES_TARGET)
	cp -r $(_PGROK_TEMPLATES_SOURCE)/ $(_PGROK_TEMPLATES_TARGET)/
	@echo installed pgrok templates  at : $(_PGROK_TEMPLATES_TARGET)

## pgrok run starts the pgrok client using your pgrok.yml
pgrok-run:
	cd $(PGROK_SRC_PATH) && $(PGROK_BIN) start-all -config pgrok.yml

## pgrokd run starts the pgrokd server using your pgrok.yml
pgrokd-run:
	cd $(PGROK_SRC_PATH) && $(PGROKD_BIN) start-all -config pgrok.yml

	

