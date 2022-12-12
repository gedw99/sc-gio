REPO_NAME=examples

BIN_RUNNER_NAME=wash

print:
	clear
	@echo '$(BIN_RUNNER_NAME):         $(shell which wash)'

dep-git:
	# https://github.com/wasmCloud/examples
	git clone git@github.com:wasmCloud/examples.git
	@echo $(REPO_NAME) >> .gitignore

dep-brew:
	# https://github.com/wasmcloud/wash
	brew tap wasmcloud/wasmcloud
	brew install wasmcloud wash

wash-up:
	# https://wasmcloud.dev/overview/installation/
	wash up
	# uses /Users/apple/.wash
	# starts nats server on  127.0.0.1:4222
	# starts dashboard at: http://localhost:4000

export WASMCLOUD_CLUSTER_SEED=SCACMULU34W5XBQCLELIWRUAATABTKOAHQJIXEBBMONZOQKF7W6R7WHOO4
build:
	@echo 'WASMCLOUD_CLUSTER_SEED:          $(WASMCLOUD_CLUSTER_SEED)'
	cd $(REPO_NAME)/actor/kvcounter-tinygo && $(MAKE) provider
	cd $(REPO_NAME)/actor/kvcounter-tinygo && $(MAKE) link

run:
	# push the signed wasm to your OCI registry
	cd $(REPO_NAME)/actor/kvcounter-tinygo && $(MAKE) push
	# start the actor
	cd $(REPO_NAME)/actor/kvcounter-tinygo && $(MAKE) start


	