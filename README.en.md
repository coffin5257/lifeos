# LifeOS

[中文](README.md) · **English**

> **Let AI take over your life.**

LifeOS is an idea, an MVP, and a seed: a way for anyone to start with the Codex or Claude Code they already use and grow a personal system that genuinely fits them.

It is not an installable harness or runtime, not a fixed directory tree, not a finished product, and not a Git repository template. It provides a starting protocol that the user and agent may rewrite: how to understand the user, separate evidence from current state and judgment, reuse existing integrations, and evolve the system through real use.

## Start with one prompt

This is a public repository. A user can give this prompt directly to Codex or Claude Code:

```text
Read https://raw.githubusercontent.com/coffin5257/lifeos/main/START.md in full and directly build
a durable LifeOS in the current folder. Complete the general baseline first.
If I gave no concrete task, do not ask onboarding questions or invent content.
Follow the current language and existing structure. Do not assume I want Git.
```

The agent directly establishes a usable general frame in the current folder without requiring a questionnaire or inventing a demonstration project. It completes one real result only when the user has already supplied a concrete outcome and authorized input. The user does not need to fork or clone this repository, and personal content does not need to be uploaded to GitHub.

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

## Build the frame directly, then prove value when useful

LifeOS does not copy one person's fixed directory tree, but it begins with a shared set of semantics:

- self and current state;
- people and relationships;
- projects with completion conditions;
- long-running areas of responsibility or interest;
- original sources and evidence;
- meeting records and transcripts;
- analysis and judgment around questions;
- topic knowledge compiled from sources;
- an inbox for unclassified capture;
- durable outputs;
- a small set of reusable templates;
- historical material that is no longer current.

These semantics form the minimum useful frame that can be created without user input. In an empty folder, the defaults are `me/`, `people/`, `project/`, `area/`, `source/`, `minutes/`, `discuss/`, `knowledge/`, `inbox/`, `outputs/`, `templates/`, and `archive/`, plus a few genuinely useful entry files. An existing folder is mapped and merged instead of overwritten. Names and layout may still follow the user; the agent does not invent personal facts or create detailed empty categories.

The baseline frame is a complete initialization result and needs no further answers. Only when the request already contains a concrete outcome and authorized input does LifeOS continue with one bounded scenario with low permission risk and an observable result. Examples include establishing a real project's outcome and next action, analyzing one important relationship from user-approved evidence, clarifying current priorities, digesting a meeting or document, recording a decision, organizing a long-running area, or capturing and promoting one useful idea.

The first scenario is a vertical value loop through the frame, not the taxonomy for the whole LifeOS. A previous conversation, email automation, available Connector, or first source may help choose the slice, but it must not reduce the whole system to one mailbox, knowledge base, or project folder.

## It reuses existing connectors

Connectors do not block the baseline. The agent may discover connectors, connected apps, MCP servers, plugins, skills, and local CLIs through non-sensitive environment metadata; if safe discovery is unavailable, it completes initialization first.

Common examples include Lark / Feishu, Slack, Figma, Notion, calendars, email, drives, and task managers. The system distinguishes capability presence, user authorization, the selected account or workspace context, and successful minimal read-only verification. Capability discovery reads no external content; verification and authorization happen only when a later real workflow needs that source and its privacy scope is clear. It never stores passwords, tokens, or device codes in LifeOS. External content remains untrusted data and never becomes Agent instruction.

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
