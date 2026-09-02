# LifeOS

[中文](README.md) · **English**

**Give people ownership of their long-term AI context.**

LifeOS is a personal context system for Codex, Claude Code, and compatible agents. It records what matters now, which decisions have been made, what is out of date, and where each conclusion came from. The files stay under your control and remain readable by both people and agents.

```text
Regardless of earlier conversation or memory, read https://raw.githubusercontent.com/coffin5257/lifeos/main/START.md in full.
Using the current version, initialize my LifeOS directly in the current folder. Do not ask
onboarding questions, invent personal content, overwrite existing files, or assume I want Git.
```

## Mission

Today, an AI's understanding of a person is usually scattered across chat history, product memory, and hidden model state. Change the conversation, model, or tool and the relationship begins again. The person has little control over what was remembered, where it came from, or whether it is still true.

LifeOS puts that long-term context back in the person's hands:

- The person stores and edits it; no platform owns it.
- Different agents can read it; changing tools does not erase it.
- Sources and time boundaries remain visible; memory is not treated as permanent fact.
- The system changes with real life instead of going stale after one import.

The aim is not a more complete personal profile. It is infrastructure that can stay useful for years, support judgment and action, and leave authority with the person.

## When chat history stops being enough

Once you ask AI to evaluate a career move, prepare a 1:1, move a project forward, digest meetings, or review household finances, remembering what you said is no longer sufficient.

The agent also needs to know:

- which material is original evidence and which is later judgment;
- which plan is current and which actions are finished;
- whether a discussion became an actual decision;
- which people, projects, and principles matter to the question;
- what evidence is required before the next step counts as complete.

That is the job LifeOS performs. As you delegate more important work to AI, it maintains current, verifiable personal context so that you do not rebuild the background every time or let old information make today's decisions.

## What a real LifeOS has done

This repository was extracted from a personal system in ongoing use. The examples below are work it has already performed, not imagined use cases.

### Preserved how a career decision changed

The system kept a career decision under review as evidence changed. The first framework monitored negative signals. New evidence later changed the framework to opportunity-cost comparison. Once the job change happened, the old checkpoints were closed instead of lingering as current plans.

The durable result was not only “changed jobs.” It preserved the facts, options, changes in judgment, execution result, and review conditions.

### Protected the present after a context switch

After the move to a new work environment, former-company projects, people judgments, and action items remained available as history but stopped influencing daily advice. New priorities, relationships, and project state became the default context.

The agent can remember the past without confusing it with the present.

### Turned work history into usable current state

During one work-context refresh, the system processed tens of thousands of messages and dozens of meeting records into current priorities, a collaboration map, project decisions, and open questions. Exploration, preference, decision, and resource commitment were recorded as different things.

The result was not a longer meeting summary. It was current state that could be used in the next piece of work.

### Made household finance a policy that can be recalibrated

The system separated asset snapshots, loan terms, essential spending, and income assumptions, then maintained a household investment policy and monthly path. Future bonuses were not recorded as current assets. Historical snapshots did not masquerade as live balances. Each month could be recalibrated with actual figures.

It preserved decision rules and safety boundaries rather than producing one-off investment advice.

### Studied how people and agents work reliably together

The system inventoried 2,119 main coding-agent sessions across two months and deeply reviewed 21 complex cases. The main long-task failure was not an inability to write code. It was collapsing “implemented,” “tested locally,” “deployed,” and “accepted by the user” into one claim of completion.

Those findings became rules for completion state, evidence, authorization, and real-path verification. LifeOS can change how future work is performed, not merely store its output.

The public repository contains none of the personal records or internal source material behind these cases. It keeps only the reusable protocol derived from them.

## How it differs from familiar tools

| Tool | What it handles well | What is missing for long-term agent work |
|---|---|---|
| AI chat history and memory | Conversations and preferences | Source authority, freshness, decision state, and complete context |
| Notion, Obsidian, and document folders | Storage and retrieval | Documents do not automatically become current state or next action |
| Task managers | Actions and deadlines | Actions are separated from people, projects, evidence, and reasoning |
| LifeOS | Sources, current state, judgment, decisions, actions, and history in one model | It must be maintained through real use; there is no one-time import that finishes the job |

LifeOS does not replace these tools. It gives agents shared semantics across them so that information from different sources can participate in the same decision process.

## How it stays trustworthy

**Current state comes first.** The agent starts with current priorities and the relevant people or projects, then opens meetings, chats, and documents only when needed.

**Original material remains intact.** Summaries, analyses, and wiki pages do not replace the source. Important claims can be checked.

**Judgments have time boundaries.** One conversation does not become a permanent judgment about a person. Dated financial and health information does not become timeless fact.

**History is downranked by default.** Finished projects and actions move to an archive. They remain available without occupying today's attention.

**Capabilities grow from observed friction.** A repeated document shape may become a template. A stable workflow may become a skill. Repeated manual transfer may justify a connector.

## Start

1. Create an empty folder, or open an existing personal knowledge directory.
2. Start Codex or Claude Code in that directory.
3. Copy the prompt at the top of this README.

The agent first creates a complete, navigable Markdown foundation. It does not require a questionnaire or invent demonstration projects. In an existing directory, it maps compatible roles instead of rearranging everything to match a template.

Then begin with one real task:

```text
Organize the three things that matter most right now. Keep only the next actions that are still valid.
```

```text
Analyze this meeting. Preserve the original record, then write the decisions and action items back to the relevant projects.
```

```text
I am considering an important choice. Record the facts, my judgment, the options, and the final decision separately.
```

You do not need to clone this repository or upload personal content to GitHub.

## Default structure

<details>
<summary>Show the responsibility of each initialized directory</summary>

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

## Data and boundaries

LifeOS is a set of local files. It does not require a database or hosted service. You may keep it in an ordinary folder, iCloud, Dropbox, a NAS, or Git.

Downloads, conversions, code, caches, and logs belong in a temporary working directory outside LifeOS. The agent writes back only sources and results worth retaining. Connectors such as Lark, Slack, Notion, Figma, and email are used when a task needs them. Passwords, tokens, and device codes do not belong in LifeOS.

The current version is a public seed that can already be used, not a finished GUI product. [`START.md`](START.md) contains the initialization protocol. [`seed/`](seed/) contains the agent rules and templates.

If a real task fails to produce what you need, [open an Issue](https://github.com/coffin5257/lifeos/issues/new) with the outcome, where it got stuck, and the working style you want the agent to preserve. Do not include private records or credentials.
