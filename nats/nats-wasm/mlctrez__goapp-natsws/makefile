# https://github.com/mlctrez/goapp-natsws

# ex: https://github.com/mlctrez/goapp-audioplayer

# expects: wss://nats-0.localtest.me:4252

REPO_NAME=goapp-natsws
REPO_VERSION=v1.0.2

APP_NAME=goapp

print:

dep-git:
	git clone git@github.com:mlctrez/goapp-natsws.git -b $(REPO_VERSION)
	@echo $(REPO_NAME) >> .gitignore
dep-git-del:
	rm -rf $(REPO_NAME)
dep-git-pull:
	cd $(REPO_NAME) && git pull


run-nats-server:
	nats-server --config .templates/nats.conf

run:
	cd $(REPO_NAME)/internal && GIN_MODE=release $(MAKE)
	# http://localhost:9021

run-secure: 
	@DEV=1 GIN_MODE=release ADDRESS=:443 ./$(REPO_NAME)/temp/$(APP_NAME)
	# https://localhost:443

