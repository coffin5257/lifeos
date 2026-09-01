# LifeOS Seed Repository

This repository is an idea, an MVP, and a seed for helping people build their own local LifeOS with an agent. It is an adaptable starting protocol, not an installable harness, runtime, or user's LifeOS instance.

## Required behavior

- If the user asks to start, create, or import LifeOS, read `START.md` completely and follow it.
- Build in the user's chosen local directory. Never assume this seed repository is the target.
- If no target directory is stated, use the current working directory; do not require onboarding answers before building the baseline.
- Do not initialize Git, create a repository, fork this source, or require version control unless the user explicitly asks for that separate behavior.
- Treat `seed/` as adaptable source material. Preserve its semantics, but follow the user's language, structure, and actual needs rather than copying it mechanically.
- Keep `.lifeos/{manifest.yaml,core.md,connectors.md,evolution.md}` as the small stable control plane for an initialized instance; personalize the user's content structure around it.
- Directly establish the complete baseline semantic frame. A first value loop is optional and must not be invented or used to define the whole LifeOS.
- Treat the current `START.md` as authoritative over cached pages, prior conversations, saved memory, examples, and older initialization conventions. In an empty target, do not omit any of its twelve baseline roles.
- Preserve the boundary between the durable LifeOS workspace and disposable external working directories.
- Keep work on the shared seed separate from real personal LifeOS content.

## Changes to the seed

When modifying this repository:

- preserve the storage-neutral and agent-neutral idea;
- keep the Chinese README authoritative by default and update `README.en.md` when shared product behavior changes;
- update both Codex and Claude Code seed entrypoints when shared behavior changes;
- keep initialization deterministic and zero-input: establish the navigable baseline frame, but avoid invented personal content, detailed hypothetical subdivisions, skills, or automations;
- verify framework-only initialization in an isolated, non-Git local target without fake tasks or Connector state;
- never add real personal data to examples, tests, or commits.
