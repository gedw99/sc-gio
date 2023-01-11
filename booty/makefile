# https://github.com/amplify-edge/booty

REPO_NAME=booty

BIN_NAME=booty
BIN_WHICH=$(shell which $(BIN_NAME))

print:
	@echo 
	@echo "BIN_WHICH:     $(BIN_WHICH)"

dep-git:
	git clone git@github.com:amplify-edge/booty.git
	@echo $(REPO_NAME) > .gitignore

build:
	cd $(REPO_NAME) && $(MAKE) build

CMD_RUN=$(BIN_NAME)
run:
	$(CMD_RUN) -h

