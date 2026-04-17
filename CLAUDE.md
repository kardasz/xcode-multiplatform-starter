# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Test Commands

```bash
make build-ios      # Build for iPhone 17 Pro simulator
make build-ipados   # Build for iPad Pro 13-inch (M5) simulator
make build-macos    # Build native macOS
make build-all      # Build all three platforms
make test           # Run unit tests on iOS simulator
make clean          # Clean build artifacts
```

All builds use `xcodebuild` with Debug configuration, code signing disabled (`CODE_SIGNING_ALLOWED=NO`), and DerivedData in `build/DerivedData`. The Xcode scheme is `MultiplatformStarter`.

## Tech Stack

- **Swift 6.3 toolchain / Swift 6 language mode** (`SWIFT_VERSION = 6.0`) — Xcode 26.4
- **SwiftUI only** — no UIKit/AppKit except where platform integration requires it
- **SwiftData** for local persistence
- **CloudKit / NSUbiquitousKeyValueStore** for iCloud sync
- **Zero external dependencies** — Apple frameworks only, no SPM/CocoaPods
- **Deployment targets**: iOS 26.4+, iPadOS 26.4+, macOS 26.4+

## Architecture

Single Xcode target for all platforms. Platform-specific behavior uses `#if os(iOS)` / `#if os(macOS)` conditional compilation.

### Navigation

- **iPhone**: Stack-based `NavigationStack`
- **iPad/macOS**: `NavigationSplitView` (sidebar + detail)

### Key Design Decisions

- macOS must be native — "Designed for iPad" is explicitly not acceptable
- Unit tests use the Swift Testing framework; UI tests use XCTest

## CI

GitHub Actions (`.github/workflows/build-platforms.yml`) runs matrix builds for iOS, iPadOS, and macOS on pull requests. Uses `macos-26` runner with Xcode 26.4.
