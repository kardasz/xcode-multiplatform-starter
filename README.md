# Xcode Multiplatform Starter

## Platforms

| Platform | Minimum Version |
|----------|----------------|
| iOS      | 26.4+          |
| iPadOS   | 26.4+          |
| macOS    | 26.4+          |

## Tech Stack

| Component       | Technology                          |
|-----------------|-------------------------------------|
| Toolchain       | Xcode 26.4 / Apple Swift 6.3        |
| Swift language mode | Swift 6 (`SWIFT_VERSION = 6.0`) |
| UI              | SwiftUI                             |
| Persistence     | SwiftData                           |
| iCloud Sync     | CloudKit / NSUbiquitousKeyValueStore |
| Dependencies    | None (Apple frameworks only)        |

## Project Structure

TBD

## Build

```bash
make build-ios      # iPhone simulator
make build-ipados   # iPad simulator
make build-macos    # Native macOS
make build-all      # All supported platforms
make test           # Run unit tests
make clean          # Clean build artifacts
```
Build output and DerivedData are written under `build/DerivedData` when using the Makefile.
