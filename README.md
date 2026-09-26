# Howzer

**TL;DR:** Howzer is a Flutter task manager built around the Eisenhower Matrix. Its current icons and platform identifiers are temporary placeholders; product screenshots will be made after the visual redesign.

Howzer keeps the inherited task matrix and useful UI while its next phases define the product scope and replace Hive task storage with portable Markdown. See [ROADMAP.md](ROADMAP.md) for the provisional delivery outline.

## Contents

- [Current capabilities](#current-capabilities)
- [Development](#development)
- [Attribution and license](#attribution-and-license)

## Current capabilities

- Organize tasks across four priority quadrants.
- Edit notes, due dates, and completion state.
- Use Android and desktop interfaces present in the repository.
- Store task data locally with Hive while the approved Markdown storage work remains future work.

Platform directories and visible UI do not prove release readiness. Device behavior and supported-platform claims still need verification.

## Development

Install Flutter and Java versions from `.tool-versions`, then run `just setup`.
Use `just run` to launch the app, `just lint` for static checks, `just test` for tests, and `just check-docs` for documentation checks.
The inherited counter test needs replacement before the test command can serve as a release gate. See [AGENTS.md](AGENTS.md) for development constraints.
The `0.1.0+1` app version is a development placeholder; no Howzer release has been verified.

## Attribution and license

Howzer is derived from [Focus by Basim Basheer](https://github.com/Appaxaap/Focus) and retains its GPL-3.0 license. Upstream attribution is retained here and in the Windows installer license. Howzer changes and new artwork are maintained in this repository.

See [LICENSE](LICENSE) for the license text.
