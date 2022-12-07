#FLU_DEVICE_IOS=
#FLU_DEVICE_AND=

## prints flu
flu-print:

	@echo
	@echo --- FLU ---
	@echo FLU_EX:				$(FLU_EX)
	@echo FLU_DEVICE_IOS:		$(FLU_DEVICE_IOS)
	@echo FLU_DEVICE_AND:		$(FLU_DEVICE_AND)

### UTIL

## configures the flu targets
flu-conf-init:
	# web
	cd $(FLU_EX) && flutter config --enable-web

	# desktop
	cd $(FLU_EX) && flutter config --enable-windows-desktop
	cd $(FLU_EX) && flutter config --enable-macos-desktop
	cd $(FLU_EX) && flutter config --enable-linux-desktop
	
	# mobile
	cd $(FLU_EX) && flutter config --enable-android
	cd $(FLU_EX) && flutter config --enable-ios

## lists the flu devices available
flu-devices:
	flutter devices

# clears the flu config features
flu-conf-clear:
	cd $(FLU_EX) && flutter config --clear-features

# creates a flu proejcts
flu-create:
	cd $(FLU_EX) && flutter create .

# cleans the flu project
flu-clean:
	cd $(FLU_EX) && flutter clean



### OPEN

## opens the xcode editor
flu-open-xcode:
	cd $(FLU_EX) && open ./ios/Runner.xcodeproj

### RUN

## run web debug
flu-run-web-debug:
	cd $(FLU_EX) && flutter run -d chrome --debug
## run web release
flu-run-web-release:
	cd $(FLU_EX) && flutter run -d chrome --release

# Desktop

## run mac debug
flu-run-mac-debug:
	cd $(FLU_EX) && flutter run -d macos --debug
## run mac release
flu-run-mac-release:
	cd $(FLU_EX) && flutter run -d macos --release

## run win debug
flu-run-win-debug:
	cd $(FLU_EX) && flutter run -d windows --debug
## run win release
flu-run-win-release:
	cd $(FLU_EX) && flutter run -d windows --release

## run linux debug
flu-run-lin-debug:
	cd $(FLU_EX) && flutter run -d linux --debug
## run linux release
flu-run-lin-release:
	cd $(FLU_EX) && flutter run -d linux --release


# Mobile

## run ios debug
flu-run-ios-debug:
	cd $(FLU_EX) && flutter run -d $(FLU_DEVICE_IOS) --debug
## run ios release
flu-run-ios-release:
	cd $(FLU_EX) && flutter run -d $(FLU_DEVICE_IOS) --release

## run android debug
flu-run-and-debug:
	cd $(FLU_EX) && flutter run -d $(FLU_DEVICE_AND) --debug
## run android release
flu-run-and-release:
	cd $(FLU_EX) && flutter run -d $(FLU_DEVICE_AND) --release
	