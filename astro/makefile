
REPO_NAME=compiler
print:

dep-git:
	git clone git@github.com:withastro/compiler.git
	@echo $(REPO_NAME) >> .gitignore

build-wasm:
	cd $(REPO_NAME) && $(MAKE) wasm
	#cd $(REPO_NAME) && CGO_ENABLED=0 GOOS=js GOARCH=wasm go build "-ldflags=-s -w" -trimpath -o ./packages/compiler/astro.wasm ./cmd/astro-wasm/astro-wasm.go