# Howzer Roadmap

**TL;DR:** Rebrand Howzer, inventory the inherited app for your keep/rework/remove decisions, then clean the repo and make Markdown files authoritative for quadrant tasks and the thought inbox. Keep routine sync conflict handling automatic, make the vault location configurable, and defer voice and LLM work until the file-backed foundation is reliable.

**Status:** Provisional delivery outline aligned with the approved Option 3 architecture on 2026-09-25. Phase 0 is next. Audit this outline before using it for implementation tracking; it does not supersede the full design plan.

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

### Phase 0: Rebrand Howzer

- Choose and apply Howzer product identity across app display names, icons, documentation, package metadata, installers, and release artifacts.
- Audit application identifiers and release history before changing identifiers; preserve upgrade compatibility unless a deliberate break is chosen.
- Remove upstream branding from user-facing surfaces.
- Preserve license files, attribution, and history.
- **Exit:** builds and release artifacts consistently identify as Howzer, and install/upgrade behavior is understood.

### Phase 1: Existing app inventory and product decisions

- Inventory every user-visible feature, platform target, major dependency, storage path, notification/permission flow, release workflow, and upstream-branded remnant.
- Trace each feature to its main code and tests so decisions reflect actual behavior, not just README claims.
- Present a concise decision list: keep, rework, remove, or defer. Do not remove disputed features before your choices are recorded.
- **Exit:** you have reviewed the inventory and decided what belongs in Howzer's product scope.

### Phase 2: Repo cleanup and workflow baseline

- Apply the approved keep/rework/remove decisions; remove inherited code, assets, dependencies, or platform targets that no longer serve Howzer.
- Run the workflow audit, then the roadmap audit; record current commands, supported platforms, and project checks.
- Establish a small regression-test baseline before changing persistence.
- **Exit:** a maintainable Howzer baseline with no unreviewed scope removals.

### Phase 3: Markdown vault and sync design

- Define a readable Markdown format with stable item IDs, timestamps, inbox/task/trash state, quadrant metadata, and preserved original text.
- Decide the vault layout, configurable location behavior, external-edit detection, and safe write strategy across Android and desktop.
- Implement configurable folder access in the prototype. Start with a 1–2 day real-device spike at 1k, 5k, and 20k representative items; measure cold/warm performance, memory, durable writes, and external-change handling.
- Prototype concurrent edits and reconnect after offline edits. Prefer automatic reconciliation and retain recoverable versions; do not rely on synced lock files as correctness guarantees.
- Prove interrupted-write recovery, deletion behavior, and repeated-sync convergence before migration. The initial spike timebox does not waive these gates.
- **Exit:** format and conflict behavior pass documented acceptance cases without routine user conflict prompts.

### Phase 4: Markdown-backed quadrant tasks

- Introduce a storage boundary that reads and writes Markdown as the authority, with an in-memory index; retire Hive task writes after cutover.
- Migrate existing task data safely, with backup and rollback.
- Keep existing quadrant, reminder, search, and completion flows working against the new storage.
- **Exit:** task changes round-trip through Markdown and existing user data survives migration.

### Phase 5: Thought Inbox

- Add fast typed capture, FIFO review, edit, discard, and promotion into a quadrant.
- Add explicit quick voice-to-text capture, typing fallback, and Markdown handoff; retain no audio by default.
- Keep original thought text when an item is clarified or promoted.
- Retain trashed items for a configurable period (default 30 days), then delete them.
- **Exit:** capture-to-review-to-task works entirely through Markdown files.

### Phase 6: Desktop handoff and sync resilience

- Validate desktop capture/review and the configurable vault access introduced in Phase 3, including revoked permissions and unavailable folders.
- Detect external file changes and refresh safely. Exercise duplicate/conflict files, deletes, renames, simultaneous edits, offline edits, and reconnects.
- Consider multiple independent vaults only after one-vault workflows are reliable.
- **Exit:** users can move between supported devices and sync tools without losing changes or facing routine conflict dialogs.

### Phase 7: Optional capture enhancements

- Add optional review nudges and later multiple independent vaults.
- Add optional LLM cleanup as a review aid, always showing original and proposed text separately.
- Later evaluate a narrow authenticated local-network service for invoking configured local models or skills.
- **Exit:** each enhancement is optional, preserves the source thought, and works without a cloud-provider dependency.

## Deferred

- Always-on wake phrase or background listening.
- Multi-user collaboration and cloud sync service.
- Multiple simultaneously active vaults.
- Direct phone-to-desktop model/skill invocation; requires a separate security and connectivity design.
