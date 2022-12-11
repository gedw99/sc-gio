# 

MAKE_FSPATH=$(PWD)/make
include $(MAKE_FSPATH)/help.mk

# TODO make this relect based :) cant be bother right now to fix...
GIT_REPO_URL=https://github.com/gedw99/sc-gio

SC_MAKE_BIN_FSPATH=$(GOPATH)/bin
SC_MAKE_BIN_NAME=sc-make
SC_MAKE_BIN=$(SC_MAKE_BIN_FSPATH)/$(SC_MAKE_BIN_NAME)


print:
	@echo 
	@echo --- GIO-MAKE ---
	@echo 'GIT_REPO_URL:           $(GIT_REPO_URL)'
	@echo 'SC_MAKE_BIN_NAME:       $(SC_MAKE_BIN_NAME)'
	@echo 'SC_MAKE_BIN_FSPATH:     $(SC_MAKE_BIN_FSPATH)'
	@echo 'SC_MAKE_BIN:            $(SC_MAKE_BIN_NAME) installed at : $(shell which $(SC_MAKE_BIN))'


### SC-MAKE

## sc-make-create
sc-make-create:
	# boot strap the repo....
	$(SC_MAKE_BIN_NAME) create

## sc-make-delete
sc-make-del:
	# blow it away
	rm -rf make
	rm -rf project

### GIT

COMMIT_MESSAGE='added more ...'
## git-commit
git-commit:
	git add --all
	git commit -am $(COMMIT_MESSAGE)

## git-pull
git-pull:
	git pull 

## git-push
git-push:
	git push 
	open $(GIT_REPO_URL)


	


	