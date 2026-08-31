# LifeOS Seed Repository

This repository is an idea, an MVP, and a seed for helping people build their own local LifeOS with an agent. It is not a harness and not a user's LifeOS instance.

## Required behavior

- If the user asks to start, create, or import LifeOS, read `START.md` completely and follow it.
- Build in the user's chosen local directory. Never assume this seed repository is the target.
- If no target directory is stated or discoverable from the current workspace, ask for it before writing.
- Do not initialize Git, create a repository, fork this source, or require version control unless the user explicitly asks for that separate behavior.
- Treat `seed/` as adaptable source material. Preserve its semantics, but follow the user's language, structure, and actual needs rather than copying it mechanically.
- Preserve the boundary between the durable LifeOS workspace and disposable external working directories.
- Keep work on the shared seed separate from real personal LifeOS content.

## Changes to the seed

When modifying this repository:

- preserve the storage-neutral and agent-neutral idea;
- keep the Chinese README authoritative by default and update `README.en.md` when shared product behavior changes;
- update both Codex and Claude Code seed entrypoints when shared behavior changes;
- keep onboarding progressive and avoid hypothetical directories, skills, or automations;
- verify the seed in an isolated, non-Git local target;
- never add real personal data to examples, tests, or commits.
