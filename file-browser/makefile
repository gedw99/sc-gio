# https://github.com/odddollar/File-browser
# https://www.reddit.com/r/golang/comments/zksnx4/i_made_a_program_that_hosts_a_directory_through_a/


REPO_NAME=File-browser
REPO_VERSION=master

APP_NAME=goapp

print:
	clear
	@echo 'REPO_NAME:   $(REPO_NAME)'

dep-git:
	git clone git@github.com:odddollar/File-browser.git -b $(REPO_VERSION)
	echo $(REPO_NAME) >> .gitignore
dep-git-del:
	rm -rf ./$(REPO_NAME)
	
dep-tools:
	go install github.com/itchyny/gojq/cmd/gojq@latest
	which gojq

mod-tidy:
	cd $(REPO_NAME) && go mod tidy
mod-upgrade:
	cd $(REPO_NAME) && go-mod-upgrade

run:
	cd $(REPO_NAME) && go run . -v $(PWD)
	# web gui:       http://127.0.0.1:8080
	
