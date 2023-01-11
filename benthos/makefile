
REPO_NAME=benthos
REPO_VERSION=v4.11.0 # https://github.com/benthosdev/benthos/tags

BIN_NAME=benthos 
BIN_FSPATH=$(REPO_NAME)/target/bin
BIN=$(BIN_FSPATH)/$(BIN_NAME)

BIN_WHICH=$(shell which $(BIN_NAME)) # if installed

print:
	@echo ""
	@echo "REPO_NAME:         $(REPO_NAME)"
	@echo "REPO_VERSION:      $(REPO_VERSION)"
	@echo ""
	@echo "BIN_NAME:          $(BIN_NAME)"
	@echo "BIN_FSPATH:        $(BIN_FSPATH)"
	@echo "BIN:               $(BIN)"
	@echo "BIN_WHICH:         $(BIN_WHICH)"

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

# for self compiled
RUN_DEV_CMD=$(BIN)
# for installed to compauter
RUN_TAG_CMD=$(BIN_NAME)

run:
	$(RUN_DEV_CMD) -v


### WASM

# assumes you hae tinygo installed... its easy.

WASM_EXAMLES_TEMPLATE=$(REPO_NAME)/public/wasm/examples/tinygo
WASM_TEST_TEMPLATE=$(PWD)/tests/wasm
wasm-build:
	cd $(WASM_EXAMLES_TEMPLATE) && tinygo build -scheduler=none -target=wasi -o uppercase.wasm .
	cd $(WASM_EXAMLES_TEMPLATE) && cp uppercase.wasm $(WASM_TEST_TEMPLATE)
wasm-run:
	$(RUN_DEV_CMD) -c $(WASM_TEST_TEMPLATE)/config.yaml