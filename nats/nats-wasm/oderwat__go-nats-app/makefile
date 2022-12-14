# https://github.com/oderwat/go-nats-app

REPO_NAME=go-nats-app
REPO_VERSION=master

APP_NAME=goapp

print:
	clear
	@echo 'WORKING_REPO_PATH:   $(WORKING_REPO_PATH)'

dep-git:
	mkdir -p ./remote
	cd ./remote && git clone git@github.com:oderwat/go-nats-app.git -b $(REPO_VERSION) && echo $(REPO_NAME) >> .gitignore

	# Fork
	mkdir -p ./local
	cd ./local && git clone git@github.com:gedw99/go-nats-app.git -b master && echo $(REPO_NAME) >> .gitignore

	cd ./local/$(REPO_NAME) && git config --local user.name "Gerard Webb"
	cd ./local/$(REPO_NAME) && git config --local user.email "gedw99@gmail.com"
    
dep-git-del:
	rm -rf ./remote/$(REPO_NAME)
	rm -rf ./local/$(REPO_NAME)

WORKING_REPO_PATH=./local/$(REPO_NAME)

dep-git-pull:
	cd $(WORKING_REPO_PATH) && git pull

dep-tools:
	go install github.com/itchyny/gojq/cmd/gojq@latest
	which gojq

mod-tidy:
	cd $(WORKING_REPO_PATH) && go mod tidy
mod-upgrade:
	cd $(WORKING_REPO_PATH) && go-mod-upgrade

run:
	cd $(WORKING_REPO_PATH) && go run mage.go run
	# http://127.0.0.1:8500
	# ws://localhost:8502
	# nats:   localhost:8501

nats-server-run:
	# run seperate NATS server, and bypass embedded one.
	nats-server --config .templates/nats/nats.conf

CLIENT_ID=aged-forest
nats-echo:
	# can see it in web gui
	# works :)
	nats -s 127.0.0.1:8501 req echo.$(CLIENT_ID) '{{ Random 10 100 }}'

nats-jq:
	# https://github.com/oderwat/go-nats-app/issues/2
	nats schema search
	nats schema info io.nats.jetstream.api.v1.account_info_response | gojq .