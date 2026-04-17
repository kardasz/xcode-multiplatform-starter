# Technical Stack

## Language & Toolchain

| Component | Version | Notes |
|-----------|---------|-------|
| Swift toolchain | 6.3 | `swiftlang-6.3.0.123.5` |
| Swift language mode | 6 | `SWIFT_VERSION = 6.0` in the Xcode project |
| Xcode | 26.4 | Build version 17E192 |
| Minimum iOS | 26.4 | iPhone |
| Minimum iPadOS | 26.4 | iPad |
| Minimum macOS | 26.4 | Native Mac target |

Xcode stores Swift 6 language mode as `SWIFT_VERSION = 6.0`; the active compiler/toolchain is Apple Swift 6.3.

## Frameworks

### UI

- **SwiftUI** — All user interface. No UIKit/AppKit views except where platform integration requires it (see below).

### Data & Persistence

- **SwiftData** — Local persistence

### iCloud Sync

- **CloudKit** / **NSUbiquitousKeyValueStore** — Progress sync across devices. Implementation choice depends on data size:
  - `NSUbiquitousKeyValueStore`: simpler, 1 MB limit (~2100 boolean flags fit easily).
  - `CloudKit`: more scalable, needed if storing additional metadata.

## Architecture

### Navigation

| Platform | Pattern |
|----------|---------|
| iPhone | Stack-based `NavigationStack` |
| iPad | `NavigationSplitView` (sidebar + detail) |
| macOS | `NavigationSplitView` (sidebar + detail) |

### Multiplatform Strategy

Single Xcode target with shared SwiftUI code for iOS, iPadOS, and macOS. Platform-specific behavior is handled via:
- `#if os(iOS)` / `#if os(macOS)` conditional compilation for platform integrations.
- SwiftUI adaptive layouts (grid on iPad/Mac, list on iPhone).

## External Dependencies

**None.** The project uses only Apple first-party frameworks. No SPM packages, CocoaPods, or third-party SDKs.

## Build

Makefile builds use `xcodebuild` via the provided `Makefile`:

```bash
make build-ios      # iPhone simulator
make build-ipados   # iPad simulator
make build-macos    # Native macOS
make build-all      # All supported platforms
make test           # Run unit tests
make clean          # Clean build artifacts
```

The Makefile stores DerivedData under `build/DerivedData`.

## Project Structure

```
MultiplatformStarter/
├── MultiplatformStarter.xcodeproj/          # Xcode project configuration
├── MultiplatformStarter/                    # Main app source
│   ├── StarterApp.swift                     # App entry point
│   ├── ContentView.swift                    # Root view
│   ├── Assets.xcassets/                     # App icons, colors
│   ├── starter.entitlements                 # App entitlements
│   └── Info.plist                           # Platform Info.plist values
├── MultiplatformStarterTests/               # Unit tests
├── MultiplatformStarterUITests/             # UI tests
├── Makefile                                 # Build automation
├── README.md                                # Project overview
└── Techstack.md                             # This file
```
