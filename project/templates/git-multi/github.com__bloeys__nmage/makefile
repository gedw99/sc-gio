
# NMG
# upstream: 	https://github.com/bloeys/nmage
# origin: 		https://github.com/gedw99/nmage

# Modify this to point to where ever you have it.
# 
MAKE_FSPATH=./../../../../make
#MAKE_FSPATH=/Users/apple/workspace/go/src/github.com/gedw99/gio-make/assets/make

include $(MAKE_FSPATH)/help.mk
include $(MAKE_FSPATH)/env.mk
include $(MAKE_FSPATH)/git.mk
include $(MAKE_FSPATH)/github.mk
include $(MAKE_FSPATH)/vscode.mk
include $(MAKE_FSPATH)/go.mk
include $(MAKE_FSPATH)/gio.mk
include $(MAKE_FSPATH)/caddy.mk
include $(MAKE_FSPATH)/fly.mk

# load -env used for git origin.
include $(PWD)/.env

GIT_NAME=nmage
GIT_ORG=bloeys
GIT_SERVER=github.com/$(GIT_ORG)/$(GIT_NAME)
GIT_BRANCH=dev

# !! toggle this so that you can pick which git remote you want to work on !!
# Origin
#GIT_WORK_FSPATH=$(PWD)/$(GIT_REPO_ORIGIN_NAME)
# Upstream
GIT_WORK_FSPATH=$(PWD)/$(GIT_REPO_UPSTREAM_NAME)

GO_SRC_NAME=nmage
GO_SRC_FSPATH=$(GIT_REPO_FSPATH)

GIO_SRC_NAME=example
GIO_SRC_FSPATH=$(GIT_REPO_FSPATH)/$(GIO_SRC_NAME)

CADDY_SRC_FSPATH=$(PWD)

this-print: 
	$(MAKE) env-print
	$(MAKE) git-print
	$(MAKE) go-print
	$(MAKE) gio-print
	$(MAKE) caddy-print


this-env-test:
	# gets the env values
	@echo 
	@echo GIT_ORIGIN_USER:$(GIT_ORIGIN_USER)
	@echo GIT_ORIGIN_EMAIL:$(GIT_ORIGIN_EMAIL)
	@echo GIT_SSH_USER:$(GIT_SSH_USER)

this-dep-origin:
	$(MAKE) git-repo-clone-origin
this-dep-upstream:
	$(MAKE) git-repo-clone-upstream
this-dep-delete:
	# based on GIT_WORK_FSPATH
	$(MAKE) git-repo-delete

this-dep-os:
	$(MAKE) env-dep
	$(MAKE) go-dep
	$(MAKE) gio-dep
	$(MAKE) caddy-dep
	$(MAKE) fly-dep

### MOD 	

this-mod-upgrade:
	$(MAKE) go-mod-upgrade
this-mod-tidy:
	cd $(GIT_REPO_FSPATH) && go mod tidy

### GO

this-go-build:
	$(MAKE) go-build

this-go-run:
	$(MAKE) go-run

### GIO

## GIO DESKTOP
this-desk-buildrun: this-desk-build this-desk-run
this-desk-build:
	$(MAKE) gio-desk-mac-build
this-desk-run: 
	#open $(GIO_BUILD_FSPATH)
	open $(GIO_BUILD_DARWIN_PATH)

# Must turn off profiling for web :)
# GIO WEB
this-web-buildrun: this-web-build this-web-run
this-web-build:
	$(MAKE) gio-web-build
this-web-run:
	$(MAKE) caddy-run

## GIO IOS
this-ios-sim-buildrun: this-ios-sim-build this-ios-sim-run
this-ios-sim-build:
	$(MAKE) gio-ios-sim-build
this-ios-sim-run:
	$(MAKE) gio-ios-sim-install

this-deploy:
	# TODO get fly working.
	

