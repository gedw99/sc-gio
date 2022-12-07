# git-multi

for when you need to work on many git repos together.

1. add github workflow that uses makefile to build..

one repo is dependent on another, and it could be a binary or a code dependency
for binary dep, we need CI to build it, so others can get it.
- latest version is useful for CI dev, where you always want the latest deps.
- fixed version is useful for CI prod.

for source deps, it should be just a matter of a go-mod-upgrade ?
- lets see.




