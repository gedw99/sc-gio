# NATS BOX ( https://github.com/nats-io/nats-box) 
# has many of these tools with correct version matrix


# NATS-SERVER
# https://github.com/nats-io/nats-server
NATS_SERVER_BIN_NAME=nats-server
#NATS_SERVER_BIN_VERSION=v2.4.5
NATS_SERVER_BIN_VERSION=v2.9.9

# NSC
# https://github.com/nats-io/nsc
NATS_NSC_BIN_NAME=nsc
NATS_NSC_BIN_VERSION=2.7.5

# NATS_TOP
# https://github.com/nats-io/nats-top
NATS_TOP_BIN_NAME=nats-top
NATS_TOP_BIN_VERSION=v0.5.3

# NATS
# https://github.com/nats-io/natscli
NATS_CLI_BIN_NAME=nats
NATS_CLI_BIN_VERSION=v0.0.35


# Override variables
# where to put the standard templates
NATS_SRC_TEMPLATES_FSPATH=$(PWD)/.templates/nats
# where to look for CaddyFile to use at runtime 
NATS_SRC_FSPATH=$(PWD)/


# Computed variables
# PERFECT :) https://www.systutorials.com/how-to-get-a-makefiles-directory-for-including-other-makefiles/
_NATS_SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
_NATS_TEMPLATES_SOURCE=$(_NATS_SELF_DIR)/templates/nats
_NATS_TEMPLATES_TARGET=$(NATS_SRC_TEMPLATES_FSPATH)



## nats print, outputs all variables needed to run nats
nats-print:
	@echo ""
	@echo "--- NATS ---"

	@echo "Deps:"
	@echo "NATS_SERVER_BIN_NAME:     $(NATS_SERVER_BIN_NAME) installed at:    $(shell which $(NATS_SERVER_BIN_NAME))"
	@echo "NATS_SERVER_BIN_VERSION:  $(NATS_SERVER_BIN_VERSION) installed as: $(shell $(NATS_SERVER_BIN_NAME) -v)"
	
	@echo ""
	@echo "NATS_NSC_BIN_NAME:        $(NATS_NSC_BIN_NAME) installed at:       $(shell which $(NATS_NSC_BIN_NAME))"
	@echo "NATS_NSC_BIN_VERSION:     $(NATS_NSC_BIN_VERSION) installed as:    $(shell $(NATS_NSC_BIN_NAME) -v)"

	@echo ""
	@echo "NATS_TOP_BIN_NAME:        $(NATS_TOP_BIN_NAME) installed at:       $(shell which $(NATS_TOP_BIN_NAME))"
	@echo "NATS_TOP_BIN_VERSION:     $(NATS_TOP_BIN_VERSION) installed as:    $(shell $(NATS_TOP_BIN_NAME) --version)"

	@echo ""
	@echo "NATS_CLI_BIN_NAME:        $(NATS_CLI_BIN_NAME) installed at:       $(shell which $(NATS_CLI_BIN_NAME))"
	@echo "NATS_CLI_BIN_VERSION:     $(NATS_CLI_BIN_VERSION) installed as:    $(shell $(NATS_CLI_BIN_NAME) --version)"

	@echo ""
	@echo "Override variables:"
	@echo "NATS_SRC_FSPATH:          $(NATS_SRC_FSPATH)"
	
	@echo
	@echo "Computed variables:"
	@echo "_NATS_SELF_DIR:           $(_NATS_SELF_DIR)"
	@echo "_NATS_TEMPLATES_SOURCE:   $(_NATS_TEMPLATES_SOURCE)"
	@echo "_NATS_TEMPLATES_TARGET:   $(_NATS_TEMPLATES_TARGET)"
	@echo ""

## prints the templates 
nats-templates-print:
	@echo
	@echo listing templates ...
	cd $(_NATS_TEMPLATES_SOURCE) && $(ENV_TREE_BIN) -a -C

## nats dep installs the nats and mkcert binary to the go bin
## cand copies the templates up into your templates working directory
# Useful where you want to grab them and customise.

## installs nats
nats-dep:
	@echo
	@echo installing nats server
	go install -ldflags="-X main.version=$(NATS_TOP_BIN_VERSION)" github.com/nats-io/nats-server/v2@$(NATS_SERVER_BIN_VERSION)
	#go install github.com/nats-io/nats-server/v2@$(NATS_SERVER_BIN_VERSION)
	@echo installed [ $(NATS_SERVER_BIN_VERSION)   at : $(shell which $(NATS_SERVER_BIN_NAME))

	@echo
	@echo installing nats nsc tool
	go install -ldflags="-X main.version=$(NATS_NSC_BIN_VERSION)" github.com/nats-io/nsc@$(NATS_NSC_BIN_VERSION)
	#go install github.com/nats-io/nsc@$(NATS_NSC_BIN_VERSION)
	@echo installed [ $(NATS_NSC_BIN_VERSION) ] at : $(shell which $(NATS_NSC_BIN_NAME))

	@echo
	@echo installing nats top tool
	go install -ldflags="-X main.version=$(NATS_TOP_BIN_VERSION)" github.com/nats-io/nats-top@$(NATS_TOP_BIN_VERSION)
	#go install github.com/nats-io/nsc@$(NATS_TOP_BIN_VERSION)
	@echo installed [ $(NATS_TOP_BIN_VERSION) ] at : $(shell which $(NATS_TOP_BIN_NAME))

	@echo
	@echo installing nats cli tool
	go install -ldflags="-X main.version=$(NATS_CLI_BIN_VERSION)" github.com/nats-io/natscli/nats@$(NATS_CLI_BIN_VERSION)
	#go install github.com/nats-io/natscli/nats@v0.0.34
	@echo installed [ $(NATS_CLI_BIN_VERSION) ] at : $(shell which $(NATS_CLI_BIN_NAME))


	$(MAKE) nats-nsc-run

	$(MAKE) nats-templates-dep

## installs the nats templates into your project
nats-templates-dep:
	@echo
	@echo installing nats templates to your project....
	mkdir -p $(_NATS_TEMPLATES_TARGET)
	cp -r $(_NATS_TEMPLATES_SOURCE)/* $(_NATS_TEMPLATES_TARGET)/
	@echo installed nats templates  at : $(_NATS_TEMPLATES_TARGET)


## nats mkcert installs the certs for browsers to run localhost
nats-nsc-run:
	@echo
	@echo running $(NATS_NSC_BIN_NAME_NAME)

	#cd $(NATS_SRC_FSPATH) && $(NATS_NSC_BIN_NAME) -install
	#cd $(NATS_SRC_FSPATH) && $(NATS_NSC_BIN_NAME) localhost
	#@echo installed mkcert certs at : $(NATS_SRC_FSPATH)

## nats run runs nats using your nats Config
nats-server-run:
	# https://docs.nats.io/running-a-nats-service/introduction/running#jetstream
	# We defaut to a .conf approach.
	#cd $(NATS_SRC_FSPATH) && $(NATS_SERVER_BIN_NAME) -js 
	# Or with conf
	cd $(NATS_SRC_FSPATH) && $(NATS_SERVER_BIN_NAME) -c js.conf


