# bianries

### Installs from remote.

DECKSH_BIN_NAME=decksh
DECKSH_BIN=$(shell which $(DECKSH_BIN_NAME))

CHART_DECK_BIN_NAME=dchart
CHART_DECK_BIN=$(shell which $(CHART_DECK_BIN_NAME))

DECKD_BIN_NAME=deckd
DECKD_BIN=$(shell which $(DECKD_BIN_NAME))

PDF_DECK_BIN_NAME=pdfdeck
PDF_DECK_BIN=$(shell which $(PDF_DECK_BIN_NAME))

PNG_DECK_BIN_NAME=pngdeck
PNG_DECK_BIN= $(shell which $(PNG_DECK_BIN_NAME))

SVG_DECK_BIN_NAME=svgdeck
SVG_DECK_BIN= $(shell which $(SVG_DECK_BIN_NAME))

FC_DECK_BIN_NAME=fcdeck
FC_DECK_BIN=$(shell which $(FC_DECK_BIN_NAME))

GC_DECK_BIN_NAME=gcdeck
GC_DECK_BIN=$(shell which $(GC_DECK_BIN_NAME))

INFO_DECK_BIN_NAME=deckinfo
INFO_DECK_BIN=$(shell which $(INFO_DECK_BIN_NAME))

dep-bin-print:
	@echo
	@echo -- Binaries --

	@echo "$(DECKSH_BIN_NAME):                $(DECKSH_BIN)"
	
	@echo "$(CHART_DECK_BIN_NAME):            $(CHART_DECK_BIN)"

	@echo "$(DECKD_BIN_NAME):                 $(DECKD_BIN)"
	@echo "$(PDF_DECK_BIN_NAME):              $(PDF_DECK_BIN)"
	@echo "$(PNG_DECK_BIN_NAME):              $(PNG_DECK_BIN)"
	@echo "$(SVG_DECK_BIN_NAME):              $(SVG_DECK_BIN)"
	@echo "$(FC_DECK_BIN_NAME):               $(FC_DECK_BIN)"
	@echo "$(GC_DECK_BIN_NAME):               $(GC_DECK_BIN)"
	@echo "$(INFO_DECK_BIN_NAME):             $(INFO_DECK_BIN)"
	@echo

dep-bin-all:
	# install Binaries

	# decksh
	go install github.com/ajstarks/decksh/cmd/decksh@latest	# get decksh

	# dchart
	go install github.com/ajstarks/dchart/cmd/dchart@latest  # get the dchart command

	# deck
	go install github.com/ajstarks/deck/cmd/deckd@latest	# get decksd
	go install github.com/ajstarks/deck/cmd/pdfdeck@latest  # get pdfdeck to render PDFs
	go install github.com/ajstarks/deck/cmd/pngdeck@latest	# get pngdeck to render PNGs
	go install github.com/ajstarks/deck/cmd/svgdeck@latest	# get svgdeck to render SVGs
	go install github.com/ajstarks/deck/cmd/fcdeck@latest  # get the fcdeck command for Fyne
	go install github.com/ajstarks/deck/cmd/gcdeck@latest  # get the gcdeck command for GIOUI
	go install github.com/ajstarks/deck/cmd/deckinfo@latest  # get the deckinfo command
	
dep-bin-delete:
	# delete Binaries
	
	rm -f $(DECKSH_BIN)

	rm -f $(CHART_DECK_BIN)

	rm -f $(DECKD_BIN)
	rm -f $(PDF_DECK_BIN)
	rm -f $(PNG_DECK_BIN)
	rm -f $(SVG_DECK_BIN)
	rm -f $(FC_DECK_BIN)
	rm -f $(GC_DECK_BIN)

