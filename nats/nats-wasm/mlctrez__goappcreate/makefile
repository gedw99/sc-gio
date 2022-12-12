REPO_NAME=goappcreate

print:

dep-git:
	git clone git@github.com:mlctrez/goappcreate.git
	@echo $(REPO_NAME) >> .gitignore
dep-git-del:
	rm -rf $(REPO_NAME)

build:
	cd $(REPO_NAME) && $(MAKE) create
	cp $(REPO_NAME)/temp/create $(PWD)

create-run:
	mkdir -p go-app
	cd ./go-app && go mod init go-app
	cd ./go-app && ./../create 
create-tidy:
	cd ./go-app && go mod tidy
create-build:
	cd ./go-app && $(MAKE)