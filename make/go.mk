

# TODO
# - GOENV like here: https://github.com/shanna/entxid-test/blob/master/Makefile, so make things cleaner 
# - Docker like here: https://github.com/shanna/entxid-test/blob/master/Makefile,


GO_PATH ?= $(shell go env GOPATH)

ifndef GOPATH
override GOPATH = $(HOME)/go
endif

# Deps
GO_BIN=go
# You can add this to the .env file and it will overload the base setting
#GO_BIN=go1.18beta1

GO_MOD_UPGRADE=go-mod-upgrade

# Override variables
GO_SRC_NAME=?
GO_SRC_FSPATH=?FILEPATH?/$(GO_SRC_NAME)

# Constant variables


# Computed variables
GO_ARCH=$(shell $(GO_BIN) env GOARCH)
GO_OS=$(shell $(GO_BIN) env GOOS)



# Computed variables
GO_BUILD_FSPATH=$(GO_SRC_FSPATH)/.bin/gobuild

GO_BUILD_WINDOWS_PATH=$(GO_BUILD_FSPATH)/windows/$(GO_SRC_NAME).exe
GO_BUILD_DARWIN_PATH=$(GO_BUILD_FSPATH)/darwin/$(GO_SRC_NAME)
GO_BUILD_LINUX_PATH=$(GO_BUILD_FSPATH)/linux/$(GO_SRC_NAME)



## Prints the variables used.
go-print:
	@echo 
	@echo --- GO ---

	@echo Deps:
	@echo 'GO_PATH installed at:            $(GO_PATH)'
	@echo 'GO_BIN installed at:             $(shell which $(GO_BIN))'
	@echo 'GO_MOD_UPGRADE installed at:     $(shell which $(GO_MOD_UPGRADE))'
	@echo
	@echo Override variables:
	@echo 'GO_SRC_NAME:                     $(GO_SRC_NAME)'
	@echo 'GO_SRC_FSPATH:                   $(GO_SRC_FSPATH)'
	@echo
	@echo Computed variables:
	@echo 'GO_ARCH:                         $(GO_ARCH)'
	@echo 'GO_OS:                           $(GO_OS)'
	@echo 'GO_BUILD_FSPATH:                 $(GO_BUILD_FSPATH)'
	@echo 'GO_BUILD_WINDOWS_PATH:           $(GO_BUILD_WINDOWS_PATH)'
	@echo 'GO_BUILD_DARWIN_PATH:            $(GO_BUILD_DARWIN_PATH)'
	@echo 'GO_BUILD_LINUX_PATH:             $(GO_BUILD_LINUX_PATH)'
	@echo 
	
## Installs all tools
go-dep:
	@echo
	@echo -- Installing go
	# Not needed for development or CI.
	#brew install go
	@echo installed go at : $(shell which $(GO_BIN))

	@echo
	@echo -- Installing go-mod-upgrade
	go install github.com/oligot/go-mod-upgrade@latest
	@echo go-mod-upgrade installed at : $(shell which $(GO_MOD_UPGRADE))

go-dep-beta: go-dep
	@echo
	@echo -- Installing go beta 
	go install golang.org/dl/go1.18beta1@latest
	go1.18beta1 download 

## Reconciles golang packages
go-mod-tidy:
	@echo
	@echo -- Visiting: 		$(GO_SRC_FSPATH)
	cd $(GO_SRC_FSPATH) && go mod tidy
	
## Upgrades golang packages interactively
go-mod-upgrade:
	# See: https://github.com/shanna/entxid-test/blob/master/Makefile#L19
	@echo
	@echo -- Visiting:		$(GO_SRC_FSPATH)
	cd $(GO_SRC_FSPATH) && go-mod-upgrade
	cd $(GO_SRC_FSPATH) && $(GO_BIN) mod tidy
	cd $(GO_SRC_FSPATH) && $(GO_BIN) mod verify

## Runs the code
go-run:
	cd $(GO_SRC_FSPATH) && $(GO_BIN) run .

## Generates and builds the code
go-build:
	cd $(GO_SRC_FSPATH) && $(GO_BIN) generate ./...

	# switch for OS
	@echo
	@echo check OS your building on:
	@echo GO_OS: $(GO_OS)

ifeq ($(GO_OS),windows)
	cd $(GO_SRC_FSPATH) && $(GO_BIN) build -o $(GO_BUILD_WINDOWS_PATH) .
endif

ifeq ($(GO_OS),darwin)
	cd $(GO_SRC_FSPATH) && $(GO_BIN) build -o $(GO_BUILD_DARWIN_PATH) .
endif

ifeq ($(GO_OS),linux)
	cd $(GO_SRC_FSPATH) && $(GO_BIN) build -o $(GO_BUILD_LINUX_PATH) .
endif

## Builds and immediately runs the binary
go-buildrun: go-build
	# switch for OS
	@echo
	@echo check OS your running on:
	@echo GO_OS: $(GO_OS)

	# open in a new terminal, so we can run many programs.
ifeq ($(GO_OS),windows)
	start $(GO_BUILD_WINDOWS_PATH)
endif

ifeq ($(GO_OS),darwin)
	open $(GO_BUILD_DARWIN_PATH)
endif

ifeq ($(GO_OS),linux)
	xdg-open $(GO_BUILD_LINUX_PATH)
endif

## Deletes all builds
go-build-clean:
	cd $(GO_SRC_FSPATH) && rm -rf $(GO_BUILD_FSPATH)

