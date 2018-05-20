build:
	swift build

synx:
	synx Swort.xcodeproj

test:
	swift test

lint:
	swiftlint

.PHONY: synx test lint
