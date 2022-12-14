# https://github.com/mlctrez/goapp-mdc

REPO_NAME=goapp-mdc
REPO_VERSION=master

DEMO_REPO_NAME=goapp-mdc-demo
DEMO_REPO_VERSION=master

print:

dep-git:
	git clone git@github.com:mlctrez/goapp-mdc.git -b $(REPO_VERSION)
	@echo $(REPO_NAME) >> .gitignore

	git clone git@github.com:mlctrez/goapp-mdc-demo.git -b $(DEMO_REPO_VERSION)
	@echo $(DEMO_REPO_NAME) >> .gitignore
	
dep-git-del:
	rm -rf $(REPO_NAME)
	rm -rf $(DEMO_REPO_NAME)


run:	
	# works :)
	cd $(DEMO_REPO_NAME) && $(MAKE)
	# http://localhost:8000/

