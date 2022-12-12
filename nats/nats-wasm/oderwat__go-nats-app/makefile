# https://github.com/oderwat/go-nats-app

REPO_NAME=go-nats-app
REPO_VERSION=master

APP_NAME=goapp

print:

dep-git:
	git clone git@github.com:oderwat/go-nats-app.git -b $(REPO_VERSION)
	@echo $(REPO_NAME) >> .gitignore
dep-git-del:
	rm -rf $(REPO_NAME)
dep-git-pull:
	cd $(REPO_NAME) && git pull

mod-tidy:
	cd $(REPO_NAME) && go mod tidy
mod-upgrade:
	cd $(REPO_NAME) && go-mod-upgrade

run:
	cd $(REPO_NAME) && go run mage.go run
	# http://127.0.0.1:8500
	# ws://localhost:8502

CLIENT_ID=aged-forest
nats-echo:
	# can see it in web gui
	# works :)
	nats -s 127.0.0.1:8501 req echo.$(CLIENT_ID) '{{ Random 10 100 }}'