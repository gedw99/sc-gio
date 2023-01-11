# https://github.com/ripienaar/nmfw

REPO_NAME=nmfw
REPO_VERSION=main

print:

dep-git:
	git clone git@github.com:ripienaar/nmfw.git -b main
	@echo $(REPO_NAME) > .gitignore

build:
	cd $(REPO_NAME)/protoc-gen-go-nmfw && go build .

### nats

nats-setup:
	# we need oen called "MICRO" because the example code expects it.
	nats context ls
	nats context save MICRO
	nats context select MICRO
	nats context ls

nats-server:
	# start a nats server locally.
	nats-server -h
	nats-server --jetstream --store_dir $(PWD)

### example
ex-gen:
	cd $(REPO_NAME)/example && ??
ex-build:
	cd $(REPO_NAME)/example && go build.



ex-run-server:
	# works !!!
	#cd $(REPO_NAME)/example/service/calc && go run . --version
	cd $(REPO_NAME)/example/service/calc && go run . run

ex-run-client:
	# works !!!
	#cd $(REPO_NAME)/example/client/calc && go run . expr -h
	cd $(REPO_NAME)/example/client/calc && go run . expr 1+2