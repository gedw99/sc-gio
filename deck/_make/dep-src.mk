# source code

DEP_SRC_BIN_FSPATH=$(SRC_FSPATH)/.bin

## dep-src-print
dep-src-print:
	@echo
	@echo -- Soure --
	@echo
	@echo DEP_SRC_BIN_FSPATH: $(DEP_SRC_BIN_FSPATH)

## dep-src-all
dep-src-all: dep-src-all-delete
	# fonts
	cd $(SRC_FSPATH) && git clone git@github.com:googlefonts/babylonica.git
	cd $(SRC_FSPATH) && git clone git@github.com:ajstarks/deckfonts.git
	
	cd $(SRC_FSPATH) && git clone git@github.com:ajstarks/deck.git
	cd $(SRC_FSPATH) && git clone git@github.com:ajstarks/decksh.git
	cd $(SRC_FSPATH) && git clone git@github.com:ajstarks/deckviz.git
	cd $(SRC_FSPATH) && git clone git@github.com:ajstarks/dubois-data-portraits.git
	# ex-out ?
	# fonts ?
	cd $(SRC_FSPATH) && git clone git@github.com:ajstarks/giocanvas.git
	cd $(SRC_FSPATH) && git clone git@github.com:ajstarks/kml.git
	
	
## dep-src-all-delete
dep-src-all-delete:
	cd $(SRC_FSPATH) && rm -rf ./babylonica
	
	cd $(SRC_FSPATH) && rm -rf ./deck
	cd $(SRC_FSPATH) && rm -rf ./deckfonts
	cd $(SRC_FSPATH) && rm -rf ./decksh
	cd $(SRC_FSPATH) && rm -rf ./deckviz
	cd $(SRC_FSPATH) && rm -rf ./dubois-data-portraits
	# ex-out ?
	# fonts ?
	cd $(SRC_FSPATH) && rm -rf ./giocanvas
	cd $(SRC_FSPATH) && rm -rf ./kml
	

dep-src-build-go:
	mkdir -p $(DEP_SRC_BIN_FSPATH)
	cd $(SRC_FSPATH)/decksh/cmd/decksh && go build -o $(DEP_SRC_BIN_FSPATH)/go/decksh .
dep-src-build-gowasm:
	# strip debug stuff
	cd $(SRC_FSPATH)/decksh/cmd/decksh && GOOS=js GOARCH=wasm go build -o $(DEP_SRC_BIN_FSPATH)/gowasm/decksh.wasm -ldflags="-s -w" .
	cd $(DEP_SRC_BIN_FSPATH)/gowasm/ && ls -lh 

	# compress
	cd $(DEP_SRC_BIN_FSPATH)/gowasm && wasm-opt -O decksh.wasm -o decksh.wasm
	cd $(DEP_SRC_BIN_FSPATH)/gowasm/ && ls -lh 

	# gzip
	cd $(DEP_SRC_BIN_FSPATH)/gowasm && gzip -9 -v -c decksh.wasm > decksh.wasm.gz
	cd $(DEP_SRC_BIN_FSPATH)/gowasm/ && ls -lh 
	
dep-src-build-tinywasm:
	# strip deug symbols
	cd $(SRC_FSPATH)/decksh/cmd/decksh && tinygo build -o $(DEP_SRC_BIN_FSPATH)/tinywasm/decksh.wasm -target wasm -no-debug .
	cd $(DEP_SRC_BIN_FSPATH)/tinywasm/ && ls -lh 
	# compress
	cd $(DEP_SRC_BIN_FSPATH)/tinywasm && wasm-opt -O decksh.wasm -o decksh.wasm
	cd $(DEP_SRC_BIN_FSPATH)/tinywasm/ && ls -lh 
dep-src-build-tinywasi:
	# flags to make small binary: https://www.fermyon.com/blog/optimizing-tinygo-wasm
	cd $(SRC_FSPATH)/decksh/cmd/decksh && tinygo build -o $(DEP_SRC_BIN_FSPATH)/tinywasi/decksh.wasm -target=wasi -wasm-abi=generic -gc=leaking -no-debug .
	cd $(DEP_SRC_BIN_FSPATH)/tinywasi && wasm-opt -O decksh.wasm -o decksh.wasm
dep-src-build-delete:
	rm -rf $(DEP_SRC_BIN_FSPATH)

