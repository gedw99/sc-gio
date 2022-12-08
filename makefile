# 

MAKE_FSPATH=$(PWD)/make
include $(MAKE_FSPATH)/help.mk

# TODO make this relect based :) cant be bother right now to fix...
GIT_REPO_URL=https://github.com/gedw99/sc-gio

GIO_MAKE_BIN_FSPATH=$(GOPATH)/bin
GIO_MAKE_BIN_NAME=gio-make
GIO_MAKE_BIN=$(GIO_MAKE_BIN_FSPATH)/$(GIO_MAKE_BIN_NAME)


print:
	@echo 
	@echo --- GIO-MAKE ---
	@echo 'GIT_REPO_URL:            $(GIT_REPO_URL)'
	@echo 'GIO_MAKE_BIN_NAME:       $(GIO_MAKE_BIN_NAME)'
	@echo 'GIO_MAKE_BIN_FSPATH:     $(GIO_MAKE_BIN_FSPATH)'
	@echo 'GIO_MAKE_BIN:            $(GIO_MAKE_BIN_NAME) installed at : $(shell which $(GIO_MAKE_BIN))'


### GIO-MAKE

gio-make-create:
	# boot strap the repo....
	gio-make create

gio-make-del:
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


	


	