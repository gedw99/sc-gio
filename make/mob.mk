# Mob 
# Mobile tools
# TODO add deployment to Google and Apple app stores
# TODO add firebase tools for deployment, as this is needed for Notifications i think.


# https://gist.github.com/ThePredators/064c46403290a6823e03be833a2a3c21


mob-print: mob-and-dep-print mob-ios-dep-print

### ANDROID

mob-and-dep-print:
	# All this is installed via ZSHRC because it requires paths exported globally, and its easiest to do there.
	@echo
	@echo --- ANDROID ---
	which sdkmanager
	which avdmanager
	which adb 
	@echo

### IOS

mob-ios-dep-print:
	@echo
	@echo --- IOS ---
	which libimobiledevice
	which ideviceinstaller
	which ios-deploy
	which cocoapods
	@echo
	
mob-ios-dep:

	# https://libimobiledevice.org/
	# fancy ios device management
	brew install libimobiledevice

	# # https://newbedev.com/how-to-run-a-flutter-app-via-a-device-code-example
	# standard ios device management
	brew install ideviceinstaller ios-deploy cocoapods

### FLUTTER ( todo move with makefile-flu)

mob-flu-dep:
	brew install --cask flutter




	


	



