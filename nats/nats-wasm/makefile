# https://github.com/mlctrez/goapp-natsws

REPO_NAME=goapp-natsws

APP_NAME=goapp

print:

dep-git:
	git clone git@github.com:mlctrez/goapp-natsws.git
	@echo $(REPO_NAME) >> .gitignore

run:
	cd $(REPO_NAME) && GIN_MODE=release $(MAKE)
	# http://localhost:9021

run-secure: 
	@DEV=1 GIN_MODE=release ADDRESS=:443 ./$(REPO_NAME)/temp/$(APP_NAME)
	# https://localhost:443