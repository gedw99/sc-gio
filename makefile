# 

MAKE_FSPATH=$(PWD)/make
include $(MAKE_FSPATH)/help.mk


print:
	@echo 
	@echo --- GIO-MAKE ---
	@echo 'GIT_REPO_URL:            $(GIT_REPO_URL)'
	@echo 'GIO_MAKE_BIN_NAME:       $(GIO_MAKE_BIN_NAME)'
	@echo 'GIO_MAKE_BIN_FSPATH:     $(GIO_MAKE_BIN_FSPATH)'
	@echo 'GIO_MAKE_BIN:            $(GIO_MAKE_BIN_NAME) installed at : $(shell which $(GIO_MAKE_BIN))'


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


	


	