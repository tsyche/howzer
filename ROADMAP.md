# Howzer Roadmap

**TL;DR:** Rebrand Howzer, inventory the inherited app for your keep/rework/remove decisions, then clean the repo and make Markdown files authoritative for quadrant tasks and the thought inbox. Keep routine sync conflict handling automatic, make the vault location configurable, and defer voice and LLM work until the file-backed foundation is reliable.

**Status:** Provisional delivery outline aligned with the approved Option 3 architecture. Phase 0 identity is in the fresh local root commit, and inherited beta/version copy has been cleaned locally. Build/install verification remains. The full design plan stays active as the architecture source.

**Last updated:** 2026-09-25

**Scope:** Evolve the existing Howzer Flutter app; do not start a replacement app unless Phase 1 finds a concrete blocker.

**Related:** [README.md](README.md)

## Overview

- Preserve the useful task-management UI and platform work where it fits.
- Rebrand first, then remove inherited code, assets, and workflow that do not serve Howzer.
- Store inbox entries and quadrant tasks as authoritative Markdown files, with an in-memory index initially. Retire Hive task storage after verified migration; add a rebuildable cache only for measured need.
- Support a configurable Markdown vault and make sync transport optional. The target is no routine conflict prompts, with recovery for competing edits.
- Include explicit quick voice capture in the first useful inbox release; optional review nudges and LLM integration follow later.

## Phases

### Phase 0: Finish Howzer rebrand (~1–3 days total)

- The Flutter package is `howzer`; platform application IDs use temporary `com.howzer.app`. This is a deliberate new install identity, so an existing Focus install does not upgrade in place.
- The static branding scan found no inherited product identifiers in source. Temporary Howzer artwork and version `0.1.0+1` are accepted until final release design work.
- Preserve GPL-3.0 licensing and upstream author attribution. The local rebrand commit is a fresh root commit; upstream Git history is not retained in this repo.
- Verify Android and available desktop builds/install identity under the pinned SDK. Android debug build passes with Flutter 3.47.2 and Java 25.0.4; APK metadata reports application ID `com.howzer.app` and label `Howzer`. No Android device is connected for an install check. This Mac lacks Xcode, so the macOS build remains unverified; Linux and Windows builds remain unverified.
- **Exit:** user-facing surfaces and build artifacts identify as Howzer; the deliberate install break and any unverified platform are documented.

### Phase 1: Existing app inventory and product decisions (~1–3 days)

- Inventory every user-visible feature, platform target, major dependency, storage path, notification/permission flow, release workflow, and upstream-branded remnant.
- Trace each feature to its main code and tests so decisions reflect actual behavior, not just README claims.
- Present a concise decision list: keep, rework, remove, or defer. Do not remove disputed features before your choices are recorded.
- 🧑 needs-human: choose keep/rework/remove/defer after reviewing the inventory.
- **Exit:** you have reviewed the inventory and decided what belongs in Howzer's product scope.

### Phase 2: Repo cleanup and workflow baseline (~2–5 days)

- Apply the approved keep/rework/remove decisions; remove inherited code, assets, dependencies, or platform targets that no longer serve Howzer.
- 🧑 needs-human: Phase 1 feature decisions before functional removals.
- Review the locally applied workflow baseline and audit results; verify Flutter commands under the pinned SDK before treating them as release gates.
- Establish a small regression-test baseline before changing persistence.
- Replace the inherited counter test with app behavior checks, then gate pull requests with Flutter lint and tests under the pinned SDK.
- **Exit:** a maintainable Howzer baseline with no unreviewed scope removals.

### Phase 3: Markdown vault and sync design (~4–8 days)

- Define a readable Markdown format with stable item IDs, timestamps, inbox/task/trash state, quadrant metadata, and preserved original text.
- Decide the vault layout, configurable location behavior, external-edit detection, and safe write strategy across Android and desktop.
- Implement configurable folder access in the prototype. Start with a 1–2 day real-device spike at 1k, 5k, and 20k representative items; measure cold/warm performance, memory, durable writes, and external-change handling.
- 🧑 needs-human: provide the Android phone, desktop, and actual shared-folder/sync setup for the device gate.
- Prototype concurrent edits and reconnect after offline edits. Prefer automatic reconciliation and retain recoverable versions; do not rely on synced lock files as correctness guarantees.
- Prove interrupted-write recovery, deletion behavior, and repeated-sync convergence before migration. The initial spike timebox does not waive these gates.
- **Exit:** format and conflict behavior pass documented acceptance cases without routine user conflict prompts.

### Phase 4: Markdown-backed quadrant tasks (~3–6 days)

- Introduce a storage boundary that reads and writes Markdown as the authority, with an in-memory index; retire Hive task writes after cutover.
- Migrate existing task data safely, with backup and rollback.
- Keep existing quadrant, reminder, search, and completion flows working against the new storage.
- **Exit:** task changes round-trip through Markdown and existing user data survives migration.

### Phase 5: Thought Inbox (~3–6 days)

- Add fast typed capture, FIFO review, edit, discard, and promotion into a quadrant.
- Add explicit quick voice-to-text capture, typing fallback, and Markdown handoff; retain no audio by default.
- Keep original thought text when an item is clarified or promoted.
- Retain trashed items for a configurable period (default 30 days), then delete them.
- **Exit:** capture-to-review-to-task works entirely through Markdown files.

### Phase 6: Desktop handoff and sync resilience (~3–7 days)

- Validate desktop capture/review and the configurable vault access introduced in Phase 3, including revoked permissions and unavailable folders.
- Detect external file changes and refresh safely. Exercise duplicate/conflict files, deletes, renames, simultaneous edits, offline edits, and reconnects.
- 🧑 needs-human: provide actual devices and sync-tool access for the two-device gate.
- Consider multiple independent vaults only after one-vault workflows are reliable.
- **Exit:** users can move between supported devices and sync tools without losing changes or facing routine conflict dialogs.

### Phase 7: Optional capture enhancements (estimate each before starting)

- Add optional review nudges and later multiple independent vaults.
- Add optional LLM cleanup as a review aid, always showing original and proposed text separately.
- Later evaluate a narrow authenticated local-network service for invoking configured local models or skills.
- **Exit:** each enhancement is optional, preserves the source thought, and works without a cloud-provider dependency.

## Approved additions after the core foundation

1. **Accessibility pass for the matrix and inbox** (~1–2 days after the inbox UI exists)
   - Check screen reader labels, keyboard focus order, and large text; fix blockers in task creation, capture, and review.
   - 🧑 needs-human: observe the final Android screen reader flow on a real device.
2. **Android share-sheet capture** (~2–3 days after durable inbox capture)
   - Accept shared text and URLs into the Markdown inbox; acknowledge only durable saves and make retried intents idempotent.
3. **Bulk Markdown note import** (~2–4 days after the vault format is stable)
   - Preview item counts and duplicates before import, leave source files unchanged, and make repeated imports safe.

## Deferred

- Always-on wake phrase or background listening.
- Multi-user collaboration and cloud sync service.
- Multiple simultaneously active vaults.
- Direct phone-to-desktop model/skill invocation; requires a separate security and connectivity design.

## Recommended next 3

1. Verify the new install identity on a device and build desktop targets where toolchains are available. This closes the rebrand without removing inherited behavior.
2. Inventory every existing feature and platform path in Phase 1. The code inventory can proceed while device behavior is marked unverified.
3. Review the Phase 1 keep/rework/remove/defer list. Your decisions unlock functional cleanup in Phase 2.
