# https://stackoverflow.com/questions/68921825/how-to-determine-which-module-s-use-an-indirect-dependency
# github.com/loov/goda is a mod tool.

BIN_GODA_NAME=goda

print:
	clear
	@echo 
	@echo "BIN_GODA_NAME:     $(BIN_GODA_NAME)"

dep:
	#brew install graphviz
	go install github.com/loov/goda@latest

goda-help:

GOPATH=./../deck/deck
goda-run:
	# find the best combo... 

	cd $(GOPATH) && $(BIN_GODA_NAME) graph | dot -Tsvg -o graph.svg

	cd $(GOPATH) && goda tree ./...:all
