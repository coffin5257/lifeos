# LifeOS Distribution Repository

This repository distributes the LifeOS installation protocol and runtime package. It is not a user's LifeOS instance.

## Required behavior

- If the user asks to import, install, or initialize LifeOS, read `INSTALL.md` completely and follow it.
- Install into the user's chosen target directory. Never assume this distribution repository is the target.
- If no target directory is stated or discoverable from the current workspace, ask for it before writing.
- Do not initialize Git, create a repository, fork this source, or require version control unless the user explicitly asks for that separate behavior.
- Treat `runtime/` as the source of truth for files installed into a personal LifeOS.
- Keep source-repository contribution work separate from personal LifeOS content.

## Product changes

When modifying this distribution:

- preserve the storage-neutral and agent-neutral contract;
- update both Codex and Claude Code runtime entrypoints when shared behavior changes;
- keep onboarding progressive and avoid hypothetical directories or skills;
- verify the packaged runtime in an isolated target directory;
- never add real personal data to examples, tests, or commits.
