# LifeOS

[中文](README.md) · **English**

Give Codex or Claude Code a durable understanding of your goals, relationships, projects, and decisions. Everything stays in a folder you control.

## Try it

1. Create an empty folder, or open an existing personal knowledge directory.
2. Start Codex or Claude Code in that directory.
3. Send it this message:

```text
Read https://raw.githubusercontent.com/coffin5257/lifeos/main/START.md in full.
Using the current version, initialize my LifeOS directly in the current folder. Do not ask
onboarding questions, invent personal content, overwrite existing files, or assume I want Git.
```

The agent creates a readable Markdown structure. You can then ask it:

```text
Organize the three things that matter most right now. Keep only the next actions that are still valid.
```

Or:

```text
Analyze this meeting. Preserve the original record, then write the decisions and action items back to the relevant projects.
```

```text
I am considering a job change. Record the facts, my judgment, the options, and the final decision separately.
```

You do not need to clone this repository or upload personal content to GitHub.

## What it fixes

Ordinary AI conversations lose context easily. A new chat means explaining yourself again. Old plans get mixed with current state. Conclusions survive while their sources disappear.

LifeOS gives an agent durable local context:

- `me/priorities.md` tells it what matters now.
- People and project entrypoints hold current state instead of every historical detail.
- Original chats, meetings, and documents remain available for verification.
- Finished work moves to an archive and stops resurfacing as current action.
- Codex and Claude Code can continue from the same files.

It is for people who already use coding agents and want those agents to understand them over time. It is not currently a GUI application and does not automatically sync every account.

## Four rules

**Read the present first.** The agent starts with current priorities and the relevant people or projects, then opens source material only when needed.

**Keep the source.** A summary, analysis, or wiki page never replaces the original chat, meeting, or document.

**Downrank history.** Old material remains available, but it stays out of current decisions by default.

**Add things after they earn a place.** Templates, skills, connectors, and automations enter the system only after real work repeatedly needs them.

These rules were extracted from a personal system in ongoing use. This public repository contains the reusable protocol, not its personal records.

## Where files go

LifeOS provides the following semantic locations. In an existing directory, the agent maps and fills missing roles instead of rearranging everything to match a template.

<details>
<summary>Show the default structure</summary>

```text
me/          identity, principles, priorities, and major decisions
people/      people and relationships
project/     work with an outcome and completion condition
area/        long-running areas such as health, finance, and career
source/      original external material
minutes/     meeting recordings, transcripts, and notes
discuss/     analysis around a specific question
knowledge/   topic knowledge compiled from named sources
inbox/       capture whose destination is still unclear
outputs/     finished work worth keeping
templates/   structures that have proved reusable
archive/     history that no longer represents current state
```

`.lifeos/` records path mappings, core rules, connector state, and how the system evolves.

</details>

## Data and tools

LifeOS is a set of local files. It does not require a database or hosted service. You may keep it in an ordinary folder, iCloud, Dropbox, a NAS, or Git.

Downloads, conversions, code, caches, and logs belong in a temporary working directory outside LifeOS. The agent writes back only sources and results worth retaining.

Connectors such as Lark, Slack, Notion, Figma, and email are used when a task needs them. Confirm the account and read scope before authorization. Passwords, tokens, and device codes do not belong in LifeOS.

## This repository

- [`START.md`](START.md) is the initialization entrypoint.
- [`seed/`](seed/) contains the agent rules, `.lifeos` control files, and a small template set.
- [`README.md`](README.md) is the Chinese documentation.

This is an early seed that can already be used, not a finished product. If a real task fails to produce what you need, [open an Issue](https://github.com/coffin5257/lifeos/issues/new) with the outcome, where it got stuck, and the working style you want the agent to preserve. Do not include private records or credentials.
