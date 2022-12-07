
### GCLOUD


# Try to make it idempotent !!

# Configuration ID
GCLOUD_CONFIG_ID=??
GCLOUD_CONFIG_DUMMY_ID=dummy

CLOUDSDK_COMPUTE_REGION=?
CLOUDSDK_COMPUTE_ZONE=?

# User account ID
GCLOUD_ACCOUNT_ID=?account?

# Unique Project id.
GCLOUD_PROJECT_ID=?gedw99-gcloud-test?

# Service account JSON file
GCLOUD_SERVICE_ACCOUNT_FILENAME=?x.json?
# Key  file
GCLOUD_KEY_FILENAME=?key.key=


## gcloud print, outputs all variables for the gcloud tooling
gcloud-print:
	@echo 
	@echo -- GCLOUD --
	@echo GCLOUD_CONFIG_ID: 				$(GCLOUD_CONFIG_ID)
	@echo GCLOUD_CONFIG_DUMMY_ID: 			$(GCLOUD_CONFIG_DUMMY_ID)
	@echo GCLOUD_ACCOUNT_ID: 				$(GCLOUD_ACCOUNT_ID)
	@echo GCLOUD_PROJECT_ID: 				$(GCLOUD_PROJECT_ID)
	@echo GCLOUD_SERVICE_ACCOUNT_FILENAME: 	$(GCLOUD_SERVICE_ACCOUNT_FILENAME)
	@echo GCLOUD_KEY_FILENAME: 				$(GCLOUD_KEY_FILENAME)

	 $(MAKE) gcloud-config-print

## gcloud dep, installs the gcloud tool to your OS.
gcloud-dep:
	# for now just open the web page....
	open https://cloud.google.com/sdk/docs/install
	##or
	open https://cloud.google.com/sdk/docs/downloads-interactive

### INIT

gcloud-init:
	# I cant force it, so step through is only way. For CI, i guess i have to hard code it in github workflow or secrets
	gcloud init


### ACCOUNT

gcloud-account-print:
	@echo 
	@echo configurations
	gcloud auth list

### CONFIG

## gcloud config print, outputs various configuration status
gcloud-config-print:
	@echo 
	@echo configurations
	gcloud config configurations list

	@echo 
	@echo config
	gcloud config list


## gcloud config create, creates a new config
gcloud-config-create:

	# Create a config and activate it.
	gcloud config configurations create $(GCLOUD_CONFIG_ID) --activate

## gcloud config activate, activate a config
gcloud-config-dummy: 

	# Set that config as he active one
	gcloud config configurations create $(GCLOUD_CONFIG_DUMMY_ID) --activate
	

## gcloud config delete, deletes a config
gcloud-config-delete:
	gcloud config configurations delete $(GCLOUD_CONFIG_ID)


### PROJECT

gcloud-project-print:
	@echo 
	@echo projects
	gcloud projects list

## gcloud proj create, creates a project. MUST be unique.
gcloud-proj-create:

	#gcloud projects create -h
	gcloud projects create $(GCLOUD_PROJECT_ID) --name $(GCLOUD_PROJECT_ID)

gcloud-proj-delete:
	#gcloud projects delete -h
	gcloud projects delete $(GCLOUD_PROJECT_ID)

## gcloud console, open the browser to your project
gcloud-project-open:
	open https://console.cloud.google.com/home/dashboard?project=$(GCLOUD_PROJECT_ID)


### SERVICE

gcloud-service-print:
	@echo 
	@echo service-accounts
	gcloud iam service-accounts list
	#gcloud beta iam service-accounts list