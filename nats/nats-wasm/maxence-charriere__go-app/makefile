REPO_NAME=go-app
REPO_VERSION=v9.6.7
# ensure version matches go-mod in consumeing apps. ( check thier go.mod version for maxence-charriere/go-app )

print:

dep-git:
	git clone git@github.com:maxence-charriere/go-app.git -b $(REPO_VERSION)
	@echo $(REPO_NAME) >> .gitignore
dep-git-del:
	rm -rf $(REPO_NAME)
