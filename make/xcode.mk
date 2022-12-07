# xcode

xcode-print:
	@echo
	@echo -- XCODE ---
	@echo tools for managing xcode.


xcode-dep:
	# Update them from Software Update in System Preferences or run:
  	softwareupdate --all --install --force

xcode-dep-force:
	# If that doesn't show you any updates, run:
	sudo rm -rf /Library/Developer/CommandLineTools
  	sudo xcode-select --install