# Howzer development guide

**TL;DR:** Keep the existing Flutter app while Howzer is rebranded and its inherited features are inventoried. Markdown will become authoritative for inbox items and quadrant tasks only after the storage spike and verified migration.

## Project state

- Flutter and Riverpod power the app. Hive currently stores tasks.
- [ROADMAP.md](ROADMAP.md) is a provisional delivery outline. It does not replace the approved architecture plan.
- Do not remove user-visible features before the Phase 1 keep/rework/remove/defer decisions.
- The planned vault uses Markdown files with an in-memory index first. Retire Hive task storage only after migration and rollback are verified.
- Before migration, prove Android and desktop file access, performance at 1k/5k/20k items, crash recovery, and sync convergence.
- Preserve GPL-3.0 licensing and upstream attribution.

## Development

- Install the Flutter and Java versions in `.tool-versions`. The release workflow uses the same pinned versions.
- Run `just setup` after checkout. Run `just lint`, `just test`, and `just check-docs` for local checks.
- Use `just run` for a connected device or desktop and `just assemble` for an Android debug APK.
- The inherited `test/widget_test.dart` is a counter template. It needs replacement with app behavior coverage in Phase 2 before tests can gate pull requests.
- Edit this guide, then run `just sync-docs` to copy the newer guide to its twin. `just check-docs` checks parity.
- Do not commit signing keys, local paths, or generated build output. Android release APKs are unsigned in CI.

## Key files

- `lib/`: Flutter UI and app logic.
- `android/`, `ios/`, `linux/`, `macos/`, `windows/`: platform projects.
- `pubspec.yaml` and `pubspec.lock`: declared and resolved Dart dependencies.
- `.github/workflows/build.yml`: Android release workflow for tag pushes or manual dispatch.
- `.github/workflows/docs.yml`: documentation checks on pull requests and main.
