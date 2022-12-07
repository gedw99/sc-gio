# fly

# they give global NATS and POST
# NATS: 
# - https://fly.io/docs/app-guides/nats-cluster/
# - https://fly.io/docs/app-guides/6pndemochat/
# POST: 
# - https://fly.io/docs/reference/postgres/
# - https://fly.io/docs/app-guides/postgres/

# Pgrok can be run there: https://inlets.dev/blog/2021/07/07/inlets-fly-tutorial.html

# TODO: add the ssh and file operations !!!
# https://mail.google.com/mail/u/0/?ui=2&view=btop&ver=1je30dsc0178v&search=inbox&th=%23thread-f:1744419013211344129&cvid=7
# can then easily move files in and out of it.

# FLY

# https://github.com/superfly/flyctl
FLY_BIN_NAME=flyctl
FLY_BIN_VERSION=v0.0.413
FLY_BIN=$(HOME)/.fly/bin/$(FLY_BIN_NAME)
FLY_CONFIG=$(HOME)/.fly/

# https://fly.io/docs/flyctl/integrating/



#FLY_APP=?

# Override variables
FLY_SRC_NAME=?
FLY_SRC_FSPATH=?FILEPATH?/$(FLY_SRC_NAME)



## fly print, outputs all variables for the fly compiler
fly-print:
	@echo ""
	@echo "--- FLY ---"
	@echo "Binaries:"
	@echo 'FLY_BIN_NAME:                  $(FLY_BIN_NAME)'
	@echo 'FLY_BIN_VERSION:               $(FLY_BIN_VERSION)'
	@echo 'FLY_BIN installed at:          $(FLY_BIN)'
	@echo 'FLY_BIN installed as:          $(shell $(FLY_BIN) version)'
	@echo 'FLY_CONFIG installed at:       $(FLY_CONFIG)'
	@echo
	@echo Env variables:
	# The one below is named "dev" in their console at: # https://web.fly.io/user/personal_access_tokens
	# place in .env file...
	@echo 'FLY_ACCESS_TOKEN:              $(FLY_ACCESS_TOKEN)'  

	@echo
	@echo Override variables:
	@echo 'FLY_APP:                       $(FLY_APP)'
	@echo 'FLY_SRC_FSPATH:                $(FLY_SRC_FSPATH)'
	@echo 'FLY_SRC_NAME:                  $(FLY_SRC_NAME)'
	@echo
	

## fly dep gets the fly cli and installs it.
fly-dep:
	@echo
	@echo installing FLY tool
	#brew install superfly/tap/flyctl
	@echo installed fly at : $(shell which $(FLY_BIN_NAME))
	# does not work: https://github.com/superfly/flyctl/issues/538
	#go install github.com/superfly/flyctl@$(FLY_BIN_VERSION)
	# requires adding to path and i am lazy
	curl -L https://fly.io/install.sh | sh
	

	
fly-dep-delete:
	#brew uninstall superfly/tap/flyctl
	#brew autoremove
	#brew cleanup
	rm -rf $(FLY_BIN)