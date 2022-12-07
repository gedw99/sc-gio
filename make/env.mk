# ENV 

## Place a .env file anywhere in your path and the variables in this path will be used by the other makefile and Golang.
## Just use the Prefix ENV_BLAH in your make files ot get them used. For example git.mk uses it.


## NEEDS:
# 1. Model .env. 
# 2. makes all envs available to make and golang runtime env
# 3. also need secrets for cloud env ?

# TODO: https://github.com/sethvargo/go-envconfig allows use to use env varaibales in golang code too.

# https://github.com/joho/godotenv
ENV_BIN=godotenv
ENV_BIN_VERSION=latest

# https://github.com/a8m/tree
ENV_TREE_BIN=tree
ENV_TREE_BIN_VERSION=latest


# Override variables
# where to put the standard templates
ENV_SRC_TEMPLATES_FSPATH=$(PWD)/.templates/env
# where to look for .env files to use at runtime 
ENV_SRC_FSPATH=$(PWD)/


# Computed variables
# PERFECT :) https://www.systutorials.com/how-to-get-a-makefiles-directory-for-including-other-makefiles/
_ENV_SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
_ENV_TEMPLATES_SOURCE=$(_ENV_SELF_DIR)templates/env
_ENV_TEMPLATES_TARGET=$(ENV_SRC_TEMPLATES_FSPATH)


## env print, outputs all variables needed to run env
env-print:
	@echo
	@echo --- ENV ---
	@echo Deps:
	@echo 'ENV_BIN:                      $(ENV_BIN) installed at : $(shell which $(ENV_BIN))'
	@echo 'ENV_TREE_BIN:                 $(ENV_TREE_BIN) installed at : $(shell which $(ENV_TREE_BIN))'
	@echo
	@echo Override variables:
	@echo 'ENV_SRC_TEMPLATES_FSPATH:     $(ENV_SRC_TEMPLATES_FSPATH)'
	@echo 'ENV_SRC_FSPATH:               $(ENV_SRC_FSPATH)'
	@echo
	@echo Computed variables:
	@echo '_ENV_SELF_DIR:                $(_ENV_SELF_DIR)'
	@echo '_ENV_TEMPLATES_SOURCE:        $(_ENV_TEMPLATES_SOURCE)'
	@echo '_ENV_TEMPLATES_TARGET:        $(_ENV_TEMPLATES_TARGET)'
	@echo

## prints the templates
env-templates-print:
	@echo
	@echo listing templates ...
	cd $(_ENV_TEMPLATES_SOURCE) && $(ENV_TREE_BIN) -a -C

## env dep installs the godotenv and tree binary to the go bin
## and copies the templates up into your templates working directory.
# Useful where you want to grab them and customise.
env-dep:
	@echo
	@echo installing godotenv tool
	go install github.com/joho/godotenv/cmd/godotenv@$(ENV_BIN_VERSION)
	@echo installed godotenv [ $(ENV_BIN_VERSION) ] at : $(shell which $(ENV_BIN))

	@echo
	@echo installing tree tool
	go install github.com/a8m/tree/cmd/tree@$(ENV_TREE_BIN_VERSION)
	@echo installed tree [ $(ENV_TREE_BIN_VERSION) ] at : $(shell which $(ENV_TREE_BIN))

	$(MAKE) env-templates-dep
	
env-templates-dep:
	@echo
	@echo installing env templates to your project....
	mkdir -p $(_ENV_TEMPLATES_TARGET)
	cp -r $(_ENV_TEMPLATES_SOURCE)/* $(_ENV_TEMPLATES_TARGET)/
	@echo installed env templates  at : $(_ENV_TEMPLATES_TARGET)


env-test:
	# unit test that tests the standard templates
	
	@echo tree listing:
	$(ENV_TREE_BIN) -a $(_ENV_TEMPLATES_SOURCE)/git

	@echo parsing: 
	$(ENV_BIN) -f $(_ENV_TEMPLATES_SOURCE)/git/.env
	@echo 
	@echo found variables in .env files:
	@echo $(GIT_ORIGIN_USER)


## env run outputs found env files and their values
env-run:
	$(ENV_BIN) -f $(ENV_SRC_FSPATH)
	



