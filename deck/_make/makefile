include ./dep-bin.mk
include ./dep-src.mk

### src root
SRC_FSPATH=$(PWD)/..

### fonts
FONTS_FSPATH=$(SRC_FSPATH)/fonts
export DECKFONTS=$(FONTS_FSPATH)

### bins
GO_BIN_FSPATH=$(GOPATH)/bin


### example root
EX_FSPATH=$(SRC_FSPATH)/deckviz

### examples specifc
EX_DECKSH_FSPATH=$(SRC_FSPATH)/dechsh
EX_ELECTION_FSPATH=$(EX_FSPATH)/2020election
EX_ASTRO_FSPATH=$(EX_FSPATH)/astrobang

### test ex
TEST_FSPATH=$(SRC_FSPATH)/decksh


print:
	@echo
	@echo -- Globals
	@echo "SRC_FSPATH:             $(SRC_FSPATH)"
	@echo "FONTS_FSPATH:           $(FONTS_FSPATH)"
	@echo "GO_BIN_FSPATH:          $(GO_BIN_FSPATH)"

	@echo
	@echo -- test
	@echo "TEST_FSPATH:           $(TEST_FSPATH)"
	
	@echo
	@echo -- EX
	@echo "EX_FSPATH:                  $(EX_FSPATH)"
	@echo "EX_OUT_FSPATH:              $(EX_OUT_FSPATH)"
	@echo "EX_ELECTION_FSPATH:         $(EX_ELECTION_FSPATH)"
	@echo "EX_ASTRO_FSPATH:            $(EX_ASTRO_FSPATH)"
	

	@echo

print-src:
	$(MAKE) dep-bin-print
	$(MAKE) dep-src-print

### fonts

# https://github.com/go-pdf/fpdf/blob/main/makefont/makefont.go
# Might be important later i suspect..
font-merge:
	mkdir -p $(FONTS_FSPATH)
	cp -r $(SRC_FSPATH)/deckfonts/*.ttf $(FONTS_FSPATH)
	cp -r $(SRC_FSPATH)/deckfonts/*.json $(FONTS_FSPATH)
	cp -r $(SRC_FSPATH)/babylonica/fonts/ttf/Babylonica-Regular.ttf $(FONTS_FSPATH)
font-merge-delete:
	rm -rf $(FONTS_FSPATH)
font-list:
	ls -al $(FONTS_FSPATH)
font-test:
	# https://github.com/googlefonts/babylonica/blob/main/fonts/ttf/Babylonica-Regular.ttf
	# manually put in deckfonts
	# it works !!
	cd $(TEST_FSPATH) && $(PDF_DECK_BIN_NAME) -sans Charter-Italic test.xml && open test.pdf
	#cd $(TEST_FSPATH) && $(PDF_DECK_BIN_NAME) -sans Babylonica-Regular test.xml && open test.pdf
	
###

test-bins: test-bins-delete
	# runs the main test example through all the bins and opens them.

	# good smoke test
	cd $(TEST_FSPATH) && $(DECKSH_BIN_NAME) test.dsh > test.xml 
	
	# fc and gc deck
	cd $(TEST_FSPATH) && $(GC_DECK_BIN_NAME) test.xml 
	cd $(TEST_FSPATH) && $(FC_DECK_BIN_NAME) test.xml

	# pdf
	cd $(TEST_FSPATH) && $(PDF_DECK_BIN_NAME) -sans NotoSans-Regular test.xml && open test.pdf
	# png
	cd $(TEST_FSPATH) && $(PNG_DECK_BIN_NAME) -sans NotoSans-Regular test.xml && open test-00001.png
	# svg
	cd $(TEST_FSPATH) && $(SVG_DECK_BIN_NAME) test.xml && open test-00001.svg
test-bins-delete:
	# clean
	cd $(TEST_FSPATH) && rm -f test.xml
	cd $(TEST_FSPATH) && rm -f test.pdf
	cd $(TEST_FSPATH) && rm -f test-*.png
	cd $(TEST_FSPATH) && rm -f test-*.svg




decksh-help:
	$(DECKSH_BIN) -h
decksh-run:
	# works
	rm -rf $(EX_OUT_FSPATH)
	mkdir -p $(EX_OUT_FSPATH)
	$(DECKSH_BIN) $(EX_ELECTION_FSPATH)/usmap.dsh > $(EX_OUT_FSPATH)/2020election.xml
	$(DECKSH_BIN) $(EX_ELECTION_FSPATH)/usmap.dsh | pdfdeck -symbol stateface -pagesize 1600,900 $(EX_OUT_FSPATH)/2020election.xml - > $(EX_OUT_FSPATH)/2020election.pdf
	$(DECKSH_BIN) $(EX_ELECTION_FSPATH)/usmap.dsh | pngdeck -symbol stateface -pagesize 1600,900 $(EX_OUT_FSPATH)/2020election.xml - > $(EX_OUT_FSPATH)/2020election.png 

	

### Web server for describing decks.
# https://github.com/ajstarks/deck/tree/master/cmd/deckd#api
deckd-help:
	$(DECKD_BIN) -h
deckd-serve:
	# runs, but cant get it to load a Deck.
	$(DECKD_BIN) -dir ./deckviz/2020election
	#  http://localhost:1958/
deckd-serve-test:
	# GET / lists the API
	curl http://localhost:1958/

	# GET /deck lists information on content, (filename, file size, modification time) in JSON
	curl http://localhost:1958/deck/

	# GET /deck?filter=[type] filter content list by type (std, deck, image, video)
	curl http://localhost:1958/deck/?filter=std
	curl http://localhost:1958/deck/?filter=deck
	# http://localhost:1958/deck/?filter=image
	# http://localhost:1958/deck/?filter=video

	# POST /deck/file.xml?cmd=[duration] starts up a deck; the deck, duration, and process id are returned in JSON
	# curl -X POST http://localhost:1958/deck/2020election.xml?cmd=start

	# POST /deck?cmd=stop stops the running deck
	# curl -X POST http://localhost:1958/deck/2020election.xml?cmd=stop


svg-help:
	$(SVG_DECK_BIN) -h
svg-run:
	# works
	$(SVG_DECK_BIN) -pagesize A4 $(SRC_FSPATH)/deckviz/2020election/2020election.xml
	open 2020election-00001.svg
	$(SVG_DECK_BIN) -pagesize A3 $(SRC_FSPATH)/deckviz/2020election/2020election.xml
	open 2020election-00001.svg
	$(SVG_DECK_BIN) -pagesize Legal $(SRC_FSPATH)/deckviz/2020election/2020election.xml 
	open 2020election-00001.svg

fcdeck-help:
	$(FC_DECK_BIN) -h
fcdeck-run:
	# works - opens it in a Fyne GUI.
	$(FC_DECK_BIN) $(SRC_FSPATH)/deckviz/2020election/2020election.xml 

gcdeck-help:
	$(GC_DECK_BIN) -h
gcdeck-run:
	# works - opens it in a GIO GUI.
	$(GC_DECK_BIN) $(SRC_FSPATH)/deckviz/2020election/2020election.xml 


infodeck-help:
	$(INFO_DECK_BIN) -h
infodeck-run:
	# works - basic though
	$(INFO_DECK_BIN) $(SRC_FSPATH)/deckviz/2020election/2020election.xml 
