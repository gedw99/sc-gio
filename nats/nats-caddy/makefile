# https://github.com/codegangsta/caddy-nats/issues/1

# kv added ? https://github.com/codegangsta/caddy-nats/tree/JMS-KV

# Add mkcert so caddy can run over https.

REPO_NAME=caddy-nats

BIN_FSPATH_TEMPLATE=$(PWD)/.bin
BIN_NAME=caddy
BIN=$(BIN_FSPATH_TEMPLATE)/$(BIN_NAME)

print:
	@echo 
	@echo clear
	@echo "REPO_NAME:      $(REPO_NAME)"
	@echo "BIN_NAME:       $(BIN_NAME)"
	@echo "BIN:            $(BIN)"
	@echo 
	@echo -- DEPS --
	@echo "xcaddy:         $(shell which xcaddy)"
	@echo "nats-server:    $(shell which nats-server)"
	@echo "nats:           $(shell which nats)"
	

dep-git:
	git clone git@github.com:codegangsta/caddy-nats.git
	@echo $(REPO_NAME) >> .gitignore

dep-tools:
	go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest

build:
	#xcaddy build --with github.com/codegangsta/caddy-nats
	# will produce a local caddy binary.
	# whack it in .bin.
	mv ./caddy $(BIN)


### RUN

run-nats-server:
	nats-server --config .templates/nats.conf

run-caddy:
	# use template 
	./caddy run --config .templates/Caddyfile

### TEST

test-nats:
	# nows lets call in ...
	nats context list

	nats req hello "aa"
