# These are your global envs.
# You can override them in your make file or the make command line at your project level terminal
# e.g: make GCLOUD_USER=d env-print
# e.g: make GCLOUD_USER=a gcloud-print 

### GIT
GIT_ORIGIN_USER=gedw99
GIT_ORIGIN_EMAIL=gedw99@gmail.com
# use ssh to configure yours.
GIT_SSH_USER=github.com-gedw99

### FLU
# run ```make flu-devices``` to discover yours.
FLU_DEVICE_IOS=bdf90dc799709a013a25d0fc2df80e441df026f3
FLU_DEVICE_AND=?

### GCLOUD
GCLOUD_USER=env_x



## env print
env-print:
	@echo
	@echo -- ENV ---
	@echo GIT_ORIGIN_USER:		$(GIT_ORIGIN_USER)
	@echo GIT_ORIGIN_EMAIL:		$(GIT_ORIGIN_EMAIL)
	@echo GIT_SSH_USER:			$(GIT_SSH_USER)
	@echo
	@echo FLU_DEVICE_IOS:		$(FLU_DEVICE_IOS)
	@echo FLU_DEVICE_AND:		$(FLU_DEVICE_AND)
	@echo
	@echo GCLOUD_USER:			$(GCLOUD_USER)
	@echo

	
