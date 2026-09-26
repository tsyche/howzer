set shell := ["bash", "-euo", "pipefail", "-c"]

# List available project commands.
default:
    just --list

# Install Flutter dependencies.
setup:
    flutter pub get

# Run the Flutter test suite.
test:
    flutter test

# Check Dart analysis and formatting.
lint:
    flutter analyze
    dart format --output=none --set-exit-if-changed lib test

# Apply Dart formatting and automated fixes.
lintfix:
    dart format lib test
    dart fix --apply

# Run the app on a connected device or desktop.
run:
    flutter run

# Build a local Android debug APK.
assemble:
    flutter build apk --debug

# Remove generated Flutter build files.
clean:
    flutter clean

# Recreate generated files and dependencies.
fresh:
    flutter clean
    flutter pub get

# Keep the two agent guides identical.
sync-docs:
    if [ AGENTS.md -nt CLAUDE.md ]; then cp AGENTS.md CLAUDE.md; elif [ CLAUDE.md -nt AGENTS.md ]; then cp CLAUDE.md AGENTS.md; fi

# Check documentation links, claims, and guide parity.
check-docs:
    ./scripts/check-docs.sh
