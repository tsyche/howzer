#!/usr/bin/env bash
set -euo pipefail

flutter_pin=$(awk '$1 == "flutter" { print $2 }' .tool-versions)
pubspec_pin=$(sed -nE 's/^  flutter: "?([0-9]+\.[0-9]+\.[0-9]+)"?$/\1/p' pubspec.yaml)
ci_flutter_pin=$(sed -nE "s/^[[:space:]]*flutter-version: '?([0-9]+\.[0-9]+\.[0-9]+)'?$/\1/p" .github/workflows/build.yml)

if [[ -z "$flutter_pin" || "$flutter_pin" != "$pubspec_pin" || "$flutter_pin" != "$ci_flutter_pin" ]]; then
  printf 'Flutter versions differ across .tool-versions, pubspec.yaml, and build.yml\n' >&2
  exit 1
fi

java_pin=$(awk '$1 == "java" { print $2 }' .tool-versions)
ci_java_pin=$(sed -nE "s/^[[:space:]]*java-version: '?([0-9]+)(\.[0-9]+)*'?$/\1/p" .github/workflows/build.yml)
java_major=${java_pin#temurin-}
java_major=${java_major%%.*}

if [[ -z "$java_major" || "$java_major" != "$ci_java_pin" ]]; then
  printf 'Java versions differ across .tool-versions and build.yml\n' >&2
  exit 1
fi

app_version=$(sed -nE 's/^version: ([0-9]+\.[0-9]+\.[0-9]+)\+[0-9]+$/\1/p' pubspec.yaml)
installer_version=$(sed -nE 's/^#define MyAppVersion "([0-9]+\.[0-9]+\.[0-9]+)"$/\1/p' installers/desktop.iss)
windows_fallback_version=$(sed -nE 's/^#define VERSION_AS_STRING "([0-9]+\.[0-9]+\.[0-9]+)"$/\1/p' windows/runner/Runner.rc)

if [[ -z "$app_version" || "$app_version" != "$installer_version" || "$app_version" != "$windows_fallback_version" ]]; then
  printf 'App versions differ across pubspec.yaml and Windows installer metadata\n' >&2
  exit 1
fi
