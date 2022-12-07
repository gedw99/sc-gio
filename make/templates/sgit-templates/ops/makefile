# upstream: https://github.com/audrenbdb/goinstall
# origin fork: https://github.com/gedw99/goinstall

MAKE_FSPATH=./../../_make
include $(MAKE_FSPATH)/help.mk
include $(MAKE_FSPATH)/caddy.mk
include $(MAKE_FSPATH)/env.mk		# Last so that other dont override it

GIT_NAME=goinstall
GIT_ORG=audrenbdb
GIT_SERVER=github.com/$(GIT_ORG)/$(GIT_NAME)
GIT_BRANCH=main

# !! toggle to work with the 2 different git remotes available.
GIT_WORK_FSPATH=$(PWD)/$(GIT_REPO_ORIGIN_NAME)
#GIT_WORK_FSPATH=$(PWD)/$(GIT_REPO_UPSTREAM_NAME)

GO_SRC_NAME=goinstall
GO_SRC_FSPATH=$(GIT_WORK_FSPATH)/$(GIT_NAME)/$(GIO_SRC_NAME)

GIO_SRC_NAME=genial
GIO_SRC_PATH=$(GIT_WORK_FSPATH)/$(GIT_NAME)/examples/$(GIO_SRC_NAME)

CADDY_SRC_PATH=$(PWD)

this-print: 
	$(MAKE) git-print
	$(MAKE) go-print
	$(MAKE) gio-print
	$(MAKE) caddy-print

this-dep-origin:
	$(MAKE) git-repo-clone-origin
this-dep-upstream:
	$(MAKE) git-repo-clone-upstream
this-dep-os:
	$(MAKE) caddy-dep

this-run:
	$(MAKE) gio-run

this-build: this-build-delete
	$(MAKE) gio-build
this-build-delete:
	$(MAKE) gio-build-delete
	
this-serve:
	$(MAKE) caddy-run 
	# https://localhost:8443/upstream/goinstall/examples/genial/giobuild/web/genial.web/