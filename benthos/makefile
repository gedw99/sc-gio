
REPO_NAME=benthos
REPO_VERSION=v4.11.0 # https://github.com/benthosdev/benthos/tags

BIN_NAME=benthos 
BIN_WHICH=$(shell which $(BIN_NAME))
BIN_FSPATH=$(REPO_NAME)/target/bin
BIN=$(BIN_FSPATH)/$(BIN_NAME)
print:
	@echo ""
	@echo "REPO_NAME:         $(REPO_NAME)"
	@echo "REPO_VERSION:      $(REPO_VERSION)"
	@echo ""
	@echo "BIN_NAME:          $(BIN_NAME)"
	@echo "BIN_WHICH:         $(BIN_WHICH)"
	@echo "BIN:               $(BIN)"

dep-git:
	git clone git@github.com:benthosdev/benthos -b $(REPO_VERSION)
	@echo $(REPO_NAME) > .gitignore
dep-git-del:
	rm -rf $(REPO_NAME)

dep-binary:
	# all OS installer

	curl -Lsf https://sh.benthos.dev | bash
dep-binary-del:
	rm -f $(BIN_WHICH)
build:
	cd $(REPO_NAME) && make

run:
	$(BIN) -v