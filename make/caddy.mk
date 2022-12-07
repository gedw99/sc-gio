# CADDY
# github.com/caddyserver/caddy

# MKCERT
# https://github.com/FiloSottile/mkcert

CADDY_BIN_NAME=caddy
#CADDY_BIN_VERSION=v2.4.5
CADDY_BIN_VERSION=v2.6.2


CADDY_MKCERT_BIN_NAME=mkcert
CADDY_MKCERT_BIN_VERSION=v1.4.3


# Override variables
# where to put the standard templates
CADDY_SRC_TEMPLATES_FSPATH=$(PWD)/.templates/caddy
# where to look for CaddyFile to use at runtime 
CADDY_SRC_FSPATH=$(PWD)/


# Computed variables
# PERFECT :) https://www.systutorials.com/how-to-get-a-makefiles-directory-for-including-other-makefiles/
_CADDY_SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
_CADDY_TEMPLATES_SOURCE=$(_CADDY_SELF_DIR)/templates/caddy
_CADDY_TEMPLATES_TARGET=$(CADDY_SRC_TEMPLATES_FSPATH)



## caddy print, outputs all variables needed to run caddy
caddy-print:
	@echo ""
	@echo "--- CADDY ---"

	@echo "Deps:"
	@echo "CADDY_BIN_NAME:              $(CADDY_BIN_NAME) installed at : $(shell which $(CADDY_BIN_NAME))"
	@echo "CADDY_BIN_VERSION:           $(CADDY_BIN_VERSION) installed as: $(shell $(CADDY_BIN_NAME) version)"
	
	@echo "CADDY_MKCERT_BIN_NAME:       $(CADDY_MKCERT_BIN_NAME) installed at : $(shell which $(CADDY_MKCERT_BIN_NAME))"
	@echo "CADDY_MKCERT_BIN_VERSION:    $(CADDY_MKCERT_BIN_VERSION) installed as: $(shell $(CADDY_MKCERT_BIN_NAME) version)"

	@echo ""
	@echo "Override variables:"
	@echo "CADDY_SRC_FSPATH:            $(CADDY_SRC_FSPATH)"
	
	@echo ""
	@echo "Computed variables:"
	@echo "_CADDY_SELF_DIR:             $(_CADDY_SELF_DIR)"
	@echo "_CADDY_TEMPLATES_SOURCE:     $(_CADDY_TEMPLATES_SOURCE)"
	@echo "_CADDY_TEMPLATES_TARGET:     $(_CADDY_TEMPLATES_TARGET)"
	@echo ""

## prints the templates 
caddy-templates-print:
	@echo
	@echo listing templates ...
	cd $(_CADDY_TEMPLATES_SOURCE) && $(ENV_TREE_BIN) -a -C

## caddy dep installs the caddy and mkcert binary to the go bin
## cand copies the templates up into your templates working directory
# Useful where you want to grab them and customise.

## installs caddy
caddy-dep:
	@echo
	@echo installing caddy tool
	#go install -ldflags="-X main.version=$(CADDY_BIN_VERSION)" github.com/nats-io/natscli/nats@$(CADDY_BIN_VERSION)
	go install -ldflags="-X main.version=$(CADDY_BIN_VERSION)" github.com/caddyserver/caddy/v2/cmd/caddy@$(CADDY_BIN_VERSION)
	@echo installed gio [ $(CADDY_BIN_VERSION)   at : $(shell which $(CADDY_BIN_NAME))

	@echo
	@echo installing mkcert tool
	go install -ldflags="-X main.version=$(CADDY_MKCERT_BIN_VERSION)" filippo.io/mkcert@$(CADDY_MKCERT_BIN_VERSION)
	@echo installed mkcert [ $(CADDY_MKCERT_BIN_VERSION) ] at : $(shell which $(CADDY_MKCERT_BIN_NAME))

	$(MAKE) caddy-mkcert-run

	$(MAKE) caddy-templates-dep

## installs the caddy templates into your project
caddy-templates-dep:
	@echo
	@echo installing caddy templates to your project....
	mkdir -p $(_CADDY_TEMPLATES_TARGET)
	cp -r $(_CADDY_TEMPLATES_SOURCE)/* $(_CADDY_TEMPLATES_TARGET)/
	@echo installed caddy templates  at : $(_CADDY_TEMPLATES_TARGET)


## caddy mkcert installs the certs for browsers to run localhost
caddy-mkcert-run:
	@echo
	@echo installing mkcert certs
	cd $(CADDY_SRC_FSPATH) && $(CADDY_MKCERT_BIN_NAME) -install
	cd $(CADDY_SRC_FSPATH) && $(CADDY_MKCERT_BIN_NAME) localhost
	@echo installed mkcert certs at : $(CADDY_SRC_FSPATH)

## caddy run runs caddy using your Caddyfile
caddy-run:
	# cd $(CADDY_SRC_FSPATH) && $(CADDY_BIN_NAME) fmt -overwrite
	open https://localhost:8443
	#cd $(CADDY_SRC_FSPATH) && $(CADDY_BIN_NAME) run -watch
	cd $(CADDY_SRC_FSPATH) && $(CADDY_BIN_NAME) run


