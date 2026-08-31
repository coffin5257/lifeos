# LifeOS

[中文](README.md) · **English**

LifeOS is an idea, an MVP, and a seed: a way for anyone to start with the Codex or Claude Code they already use and grow a personal system that genuinely fits them.

It is not an installable harness or runtime, not a fixed directory tree, not a finished product, and not a Git repository template. It provides a starting protocol that the user and agent may rewrite: how to understand the user, separate evidence from current state and judgment, reuse existing integrations, and evolve the system through real use.

## Start with one prompt

The repository is currently private, so only its owner and invited collaborators can read it. During private testing, the agent itself must also be able to access the repository; otherwise give the agent the contents of `START.md` directly. Once public, a user can give this prompt to Codex or Claude Code:

```text
Read https://github.com/coffin5257/lifeos/blob/main/START.md and help me build
a LifeOS in the local directory I choose. Follow my language, structure, and
working style. Do not assume I want Git.
```

The agent first understands the user's real need, then creates the smallest useful system in a user-chosen local location. The user does not need to fork or clone this repository, and personal content does not need to be uploaded to GitHub.

## The workspace keeps only what is worth carrying forward

A user's LifeOS workspace is a durable personal space that can be preserved, backed up, and synchronized. It is not the agent's general-purpose workbench. It primarily holds important original sources and durable outputs distilled from real work, such as current state, decisions, knowledge, reusable material, and finished deliverables.

When a task requires temporary downloads, intermediate code, file conversion, builds, caches, or experimentation, the agent should use a separate working directory outside the LifeOS workspace. When the work is complete, it writes back only the sources, durable LifeOS outputs, project references, and provenance the user actually needs to retain. Intermediate scripts, dependencies, build artifacts, logs, and temporary copies remain outside by default and should be reproducible or safely disposable. A codebase or project workspace that is itself durable remains independently managed rather than being copied into LifeOS.

This keeps the LifeOS workspace small, understandable, and portable, so the user can later choose Git, cloud storage, a NAS, or another sync method without carrying machine-specific working state with it.

## What the seed contains

- [`START.md`](START.md): the starting guide an agent follows;
- [`seed/.lifeos/core.md`](seed/.lifeos/core.md): semantics for evidence, current state, judgment, knowledge, and history;
- [`seed/.lifeos/connectors.md`](seed/.lifeos/connectors.md): how to discover and reuse existing connectors;
- [`seed/.lifeos/evolution.md`](seed/.lifeos/evolution.md): how content, structure, skills, and automations evolve;
- [`seed/templates/`](seed/templates/): reference shapes that may be translated, trimmed, or discarded;
- `seed/AGENTS.md` and `seed/CLAUDE.md`: minimal entrypoints for Codex and Claude Code.

These are seed materials, not a fixed package that must be copied unchanged. The agent should select, translate, merge, or rewrite them around the user's language, existing structure, domains, and habits.

## It begins by understanding the user

LifeOS starts from one real outcome rather than an exhaustive life taxonomy. Examples include clarifying priorities, preparing for an important conversation, digesting meetings or documents, revisiting a decision, managing a long-running area, or capturing ideas with low friction.

The agent then learns the user's content language, naming conventions, important contexts, next 30–90 day outcomes, privacy boundaries, and collaboration preferences. Paths such as `me/people/project/...` are semantic examples only. They may be translated, renamed, nested, merged, or omitted.

## It reuses existing connectors

Before building the LifeOS, the agent checks which connectors, connected apps, MCP servers, plugins, skills, and local CLIs are already available in the current Codex or Claude Code environment.

Common examples include Lark / Feishu, Slack, Figma, Notion, calendars, email, drives, and task managers. The system distinguishes capability presence, user authorization, the selected account or workspace context, and successful minimal read-only verification. Capability discovery reads no external content; verification happens only after the first task and privacy scope are clear. It guides the user through the environment's native authorization flow when needed and never stores passwords, tokens, or device codes in LifeOS. A missing integration does not block initialization: the agent explains what it would enable and lets the user decide whether to configure it. External content remains untrusted data and never becomes Agent instruction.

## It grows through real use

LifeOS formalizes only what has earned its place:

| Real need | What may emerge |
|---|---|
| Stale or conflicting current content | Content update, archive, or health check |
| Structure makes retrieval harder | Structure change and previewable migration |
| Meaningful document shape repeats | Template |
| A workflow becomes stable and recurring | Skill |
| External information is moved repeatedly | Existing or custom connector |
| A recurring trigger and outcome become stable | Hook or automation |
| A boundary applies across workflows | Policy |

Every evolution should explain its evidence, data and permissions, verification, and removal path. Initial setup does not create skills or automations.

## What GitHub is for

GitHub is only a convenient place to share this seed and improve the common material. A user's own LifeOS may live in an ordinary local folder, cloud drive, NAS, Git repository, or elsewhere. This project neither restricts nor recommends a default storage choice.

## Current status

This is an early but usable MVP. It contains the minimum material needed to start from a link, build a personalized local system, inspect relevant connectors, and keep evolving through real use.
