# https://fly.io/docs/reference/postgres/


# All these vars should be overriden by the user.

FLY_DB_APP_NAME=gedw99-db-test
FLY_DB_CONSOLE_URL=https://fly.io/apps/$(FLY_DB_APP_NAME)

FLY_DB_ORG_NAME=personal
FLY_DB_REGION_NAME=fra

FLY_DB_CLUSTER_INIT_SIZE=1
FLY_DB_VM_SIZE=shared-cpu-1x
FLY_DB_VOLUME_SIZE=1

FLY_DB_PASSWORD=3eef4766d963b85863fe36535014be1fb708c810d3e06892

# returned
FLY_DB_HOST_NAME=$(FLY_DB_APP_NAME).internal.
FLY_DB_HOST_URL=postgres://postgres:$(FLY_DB_PASSWORD)@$(FLY_DB_HOST_NAME)


# Computed variables
# PERFECT :) https://www.systutorials.com/how-to-get-a-makefiles-directory-for-including-other-makefiles/
_ENV_SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
_ENV_TEMPLATES_SOURCE=$(_ENV_SELF_DIR)templates/env
_ENV_TEMPLATES_TARGET=$(ENV_SRC_TEMPLATES_FSPATH)

fly-db-print:
	@echo
	@echo -- fly db --
	@echo
	@echo Override variables:
	@echo 'FLY_DB_APP_NAME:             $(FLY_DB_APP_NAME)'
	@echo 'FLY_DB_CONSOLE_URL:          $(FLY_DB_CONSOLE_URL)'

	@echo 'FLY_DB_ORG_NAME:             $(FLY_DB_ORG_NAME)'
	@echo 'FLY_DB_REGION_NAME:          $(FLY_DB_REGION_NAME)'

	@echo Override variables for size:
	@echo 'FLY_DB_CLUSTER_INIT_SIZE:    $(FLY_DB_CLUSTER_INIT_SIZE)'
	@echo 'FLY_DB_VM_SIZE:              $(FLY_DB_VM_SIZE)'
	@echo 'FLY_DB_VOLUME_SIZE:          $(FLY_DB_VOLUME_SIZE)'

	@echo FLY_DB_PASSWORD:              $(FLY_DB_PASSWORD)'
	@echo FLY_DB_HOST_NAME:             $(FLY_DB_HOST_NAME)'
	@echo FLY_DB_HOST_URL:              $(FLY_DB_HOST_URL)'

	@echo Computed variables:
	@echo '_ENV_SELF_DIR:                $(_ENV_SELF_DIR)'
	@echo '_ENV_TEMPLATES_SOURCE:        $(_ENV_TEMPLATES_SOURCE)'
	@echo '_ENV_TEMPLATES_TARGET:        $(_ENV_TEMPLATES_TARGET)'
	

fly-db-create:
	# works :)
	# feed it the vars i want ( using everything but snapshot size)
	flyctl postgres create --name $(FLY_DB_APP_NAME) \
		--organization $(FLY_DB_ORG_NAME) \
		--password $(FLY_DB_PASSWORD) \
		--region $(FLY_DB_REGION_NAME) \
		--initial-cluster-size $(FLY_DB_CLUSTER_INIT_SIZE) \
		--vm-size $(FLY_DB_VM_SIZE) \
		--volume-size $(FLY_DB_VOLUME_SIZE) \

fly-db-create-rpl:
	# works :)
	# walk through.. 
	flyctl postgres create
	# then save in the makefile vars or .env

fly-db-enums:
	# works :)
	# list of regions
	flyctl platform regions

	# list of vm sizes
	flyctl platform vm-sizes

fly-db-status-enums:
	# works :)
	# just opens the web url for global status
	flyctl platform status

	

fly-db-create-delete:
	# works :)
	# its itself an app. will ask for confirm 
	flyctl apps destroy $(FLY_DB_APP_NAME)



fly-db-status:
	# works :)
	flyctl status -a $(FLY_DB_APP_NAME)
fly-db-users:
	flyctl postgres users list $(FLY_DB_HOST_NAME) --app $(FLY_DB_APP_NAME)

fly-db-rpl:
	# from a wireguard tunnel
	psql postgres://postgres:secret123@appname.internal:**5432**

fly-db-attach:
	flyctl postgres attach --postgres-app mypostgres
fly-db-deattach:
	flyctl postgres detach -a $(FLY_DB_APP_NAME) --postgres-app postgres-app-name



fly-db-databases-list:
	flyctl postgres db list $(FLY_DB_HOST_NAME) -a $(FLY_DB_APP_NAME)


