# 

# ex: https://github.com/mlctrez/goapp-audioplayer

# go.mod:
#//replace github.com/maxence-charriere/go-app/v9 => ../go-app
#replace github.com/maxence-charriere/go-app/v9 => ../../maxence-charriere__go-app/go-app

# github.com/mlctrez/goapp-natsws v1.0.2

REPO_NAME=goapp-audioplayer
REPO_VERSION=v0.11.18

APP_NAME=goapp

print:

dep-git:
	git clone git@github.com:mlctrez/goapp-audioplayer.git -b $(REPO_VERSION)
	@echo $(REPO_NAME) >> .gitignore
dep-git-del:
	rm -rf $(REPO_NAME)
dep-git-pull:
	cd $(REPO_NAME) && git pull

mod-tidy:
	cd $(REPO_NAME) && go mod tidy

# ~/Music is where music should be.

music-index:
	cd $(REPO_NAME) && go run -v music/index/index.go
music-open:
	open ~/Music

run:
	cd $(REPO_NAME) && GIN_MODE=release $(MAKE)
	# http://localhost:9021

run-secure: 
	@DEV=1 GIN_MODE=release ADDRESS=:443 ./$(REPO_NAME)/temp/$(APP_NAME)
	# https://localhost:443

