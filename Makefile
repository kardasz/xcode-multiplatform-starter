PROJECT = MultiplatformStarter.xcodeproj
SCHEME = MultiplatformStarter

IOS_DESTINATION = platform=iOS Simulator,name=iPhone 17 Pro
IPAD_DESTINATION = platform=iOS Simulator,name=iPad Pro 13-inch (M5)
MACOS_DESTINATION = platform=macOS

XCODEBUILD_FLAGS = -project $(PROJECT) -scheme $(SCHEME) -configuration Debug CODE_SIGNING_ALLOWED=NO
DERIVED_DATA = build/DerivedData
SWIFT_MODULE_CACHE = .build/swift-module-cache

.PHONY: build-all build-ios build-ipados build-macos clean test

build-all: build-ios build-ipados build-macos

build-ios:
	xcodebuild build $(XCODEBUILD_FLAGS) -derivedDataPath $(DERIVED_DATA) -destination '$(IOS_DESTINATION)'

build-ipados:
	xcodebuild build $(XCODEBUILD_FLAGS) -derivedDataPath $(DERIVED_DATA) -destination '$(IPAD_DESTINATION)'

build-macos:
	xcodebuild build $(XCODEBUILD_FLAGS) -derivedDataPath $(DERIVED_DATA) -destination '$(MACOS_DESTINATION)'

clean:
	xcodebuild clean -project $(PROJECT) -scheme $(SCHEME) -derivedDataPath $(DERIVED_DATA)
	rm -rf build/ $(SWIFT_MODULE_CACHE)

test:
	xcodebuild test $(XCODEBUILD_FLAGS) -derivedDataPath $(DERIVED_DATA) -destination '$(IOS_DESTINATION)'
