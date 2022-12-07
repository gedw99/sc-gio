### GIT

## Designed to allow you to work with many forks of forks of a git repo at once.

# DEPS
GIT_BIN=git
GITTY_BIN=gitty

# Override variables
GIT_NAME:=?
GIT_ORG:=?
GIT_SERVER:=?
GIT_BRANCH:=?

# File Paths overridable
# 
# the path above the git repo. Override this to checkout different branches to different folders
GIT_WORK_FSPATH=$(PWD)

# the path of the final git repo.
GIT_REPO_FSPATH=$(GIT_WORK_FSPATH)/$(GIT_NAME)

# Auth details overridable ( used for origin only )
GIT_ORIGIN_USER:=?
GIT_ORIGIN_EMAIL:=?
GIT_SSH_USER:=?

# Constant variables ( needed so we can auotmate finds, searching & deleting )
GIT_REPO_PREFIX=gitty
GIT_REPO_ORIGIN_NAME=$(GIT_REPO_PREFIX)-origin
GIT_REPO_UPSTREAM_NAME=$(GIT_REPO_PREFIX)-upstream


# Computed variables
GIT_SHA    ?= $(shell cd $(GIT_REPO_FSPATH) && $(GIT_BIN) rev-parse --short HEAD)
GIT_TAG    ?= $(shell cd $(GIT_REPO_FSPATH) && $(GIT_BIN) describe --tags --abbrev=0 --exact-match 2>/dev/null)
GIT_DIRTY  ?= $(shell cd $(GIT_REPO_FSPATH) && test -n "`$(GIT_BIN) status --porcelain`" && echo "dirty" || echo "clean")


GIT_BUILD         ?= $(shell cd $(GIT_REPO_FSPATH) && $(GIT_BIN) rev-parse --short HEAD)
GIT_BUILD_DATE    ?= $(shell cd $(GIT_REPO_FSPATH) && $(GIT_BIN) log -1 --format=%ci)
GIT_BUILD_BRANCH  ?= $(shell cd $(GIT_REPO_FSPATH) && $(GIT_BIN) rev-parse --abbrev-ref HEAD)
GIT_BUILD_VERSION ?= $(shell cd $(GIT_REPO_FSPATH) && $(GIT_BIN) describe --always --tags)

## git print
git-print:
	@echo
	@echo --- GIT ---
	@echo Deps:
	@echo GIT_BIN: 				Found $(GIT_BIN) at : $(shell which $(GIT_BIN))
	@echo GITTY_BIN: 			Found $(GITTY_BIN) at : $(shell which $(GITTY_BIN))
	
	@echo
	@echo Constant variables:
	@echo 'GIT_REPO_PREFIX:             $(GIT_REPO_PREFIX)'
	@echo 'GIT_REPO_ORIGIN_NAME:        $(GIT_REPO_ORIGIN_NAME)'
	@echo 'GIT_REPO_UPSTREAM_NAME:      $(GIT_REPO_UPSTREAM_NAME)'

	@echo
	@echo Override variables:
	@echo 'GIT_NAME:                    $(GIT_NAME)'
	@echo 'GIT_ORG:                     $(GIT_ORG)'
	@echo 'GIT_SERVER:                  $(GIT_SERVER)'
	@echo 'GIT_BRANCH:                  $(GIT_BRANCH)'

	@echo 'GIT_WORK_FSPATH:             $(GIT_WORK_FSPATH)'
	@echo 'GIT_REPO_FSPATH:             $(GIT_REPO_FSPATH)'

	@echo 'GIT_ORIGIN_USER:             $(GIT_ORIGIN_USER)'
	@echo 'GIT_ORIGIN_EMAIL:            $(GIT_ORIGIN_EMAIL)'
	@echo 'GIT_SSH_USER:                $(GIT_SSH_USER)'


	@echo Computed variables:
	@echo 'GIT-BUILD:                   $(GIT_BUILD)'
	@echo 'GIT-BUILD_DATE:              $(GIT_BUILD_DATE)'
	@echo 'GIT-BUILD_BRANCH:            $(GIT_BUILD_BRANCH)'
	@echo 'GIT-BUILD_VERSION:           $(GIT_BUILD_VERSION)'
	
## Installs all tools
git-dep:
	@echo
	@echo -- Installing gitty
	go install github.com/muesli/gitty@latest
	@echo installed gitty at : $(shell which $(GITTY_BIN))

	@echo
	@echo -- Installing go-mod-upgrade
	go install github.com/oligot/go-mod-upgrade@latest
	@echo installed go-mod-upgrade at : $(shell which $(GO_MOD_UPGRADE))

### REPO ###


## git clone origin
git-repo-clone-origin:
	# works :)
	# assuming you have forked upstream
	mkdir -p $(GIT_WORK_FSPATH)
	cd $(GIT_WORK_FSPATH) && $(GIT_BIN) clone --recursive git@$(GIT_SSH_USER):$(GIT_ORIGIN_USER)/$(GIT_NAME) -b $(GIT_BRANCH)

	$(MAKE) git-repo-clone-origin-post

	$(MAKE) _git-open-config

## git clone upstream
git-repo-clone-upstream:
	mkdir -p $(GIT_WORK_FSPATH)
	cd $(GIT_WORK_FSPATH) && $(GIT_BIN) clone --recursive ssh://git@$(GIT_SERVER) -b $(GIT_BRANCH)

	$(MAKE) _git-open-config

## git delete the repro
git-repo-delete:
	rm -rf $(GIT_WORK_FSPATH)

# modifies the git config to include the upstream remote and your credentials. Typically used after you have clone your origin.
git-repo-clone-origin-post:
	# update the .git/config with upstream info so you can easily sync upstream
	#cd $(PWD)/$(GIT_NAME) && $(GIT_BIN) remote add upstream ssh://git@github.com:$(GIT_ORG)/$(GIT_NAME).git 
	cd $(GIT_REPO_FSPATH) && $(GIT_BIN) remote add upstream git@github.com:$(GIT_ORG)/$(GIT_NAME).git 
	# update user and user email
	cd $(GIT_REPO_FSPATH) && $(GIT_BIN) config user.name $(GIT_ORIGIN_USER)
	cd $(GIT_REPO_FSPATH) && $(GIT_BIN) config user.email $(GIT_ORIGIN_EMAIL)

## git open config, so you can check the git config.
_git-open-config:
	code $(GIT_REPO_FSPATH)/.git/config


### WITHIN REPO

## git status, to see what has changed.
git-status-print:
	@echo
	@echo -- GIT BRANCH:
	@cd $(GIT_REPO_FSPATH) && $(GIT_BIN) branch --show-current
	@echo

	@echo
	@echo -- GIT REMOTES:
	@cd $(GIT_REPO_FSPATH) && $(GIT_BIN) remote -v
	@echo

	@echo
	@echo --- GIT STATUS:
	cd $(GIT_REPO_FSPATH) && git status
	@echo

	@echo
	@echo --- GITTY STATUS:
	@echo Tells you the remote status

	cd $(GIT_REPO_FSPATH) && $(GITTY_BIN) 
	@echo
	

## git version, so see version info.
git-version-print:
	@echo
	@echo --- GIT version ---
	@echo GIT_SHA: 				$(GIT_SHA)
	@echo GIT_TAG: 				$(GIT_TAG)
	@echo GIT_DIRTY: 			$(GIT_DIRTY)
	@echo

### OPERATIONS ###

## git pull from origin, to get changes I have made.
git-pull-origin:
	cd $(GIT_REPO_FSPATH) && $(GIT_BIN) fetch origin

	cd $(GIT_REPO_FSPATH) && $(GIT_BIN) merge origin/$(GIT_BRANCH)

## git pull from upstream, to get changes others have made.
git-pull-upstream:
	cd $(GIT_REPO_FSPATH) && $(GIT_BIN) fetch upstream

	cd $(GIT_REPO_FSPATH) && $(GIT_BIN) merge upstream/$(GIT_BRANCH)

## git add changes, to stage all changes.
git-add:
	cd $(GIT_REPO_FSPATH) && $(GIT_BIN) add -A 
	cd $(GIT_REPO_FSPATH) && $(GIT_BIN) status

## git commit changes, to commit all staged changes.
GIT_COMMENT=?
git-commit:
	cd $(GIT_REPO_FSPATH) && $(GIT_BIN) commit -m '$(GIT_COMMENT)'
	cd $(GIT_REPO_FSPATH) && $(GIT_BIN) status

## git push PR to origin, to push your committed changes.
git-push-origin:
	cd $(GIT_REPO_FSPATH) && $(GIT_BIN) push origin $(GIT_BRANCH)

