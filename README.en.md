# LifeOS

[中文](README.md) · **English**

**AI takes over your life.**

LifeOS is a personal context system for Codex, Claude Code, and compatible agents — not by deciding for you, but by remembering the decisions you've already made: what matters right now, which conclusions are stale, and what each judgment was based on. The files live in your own folder, stay readable by people, and carry over to whichever agent you use next.

```text
Regardless of earlier conversation or memory, read https://raw.githubusercontent.com/coffin5257/lifeos/main/START.md in full.
Using the current version, initialize my LifeOS directly in the current folder. Do not ask
onboarding questions, invent personal content, overwrite existing files, or assume I want Git.
```

## Why this exists

I started asking AI to take part in more consequential work: making decisions, digesting meetings, understanding relationships, moving projects forward. What actually got in the way was never how smart the model was — it was that the agent didn't know what was still valid, or where a conclusion came from.

Chat history keeps what was said. Product memory keeps a few preferences. Both stay locked inside one product — I can't inspect what it remembers, and I lose it the moment I switch models or tools.

So I keep that context in ordinary files I control. Current priorities have a clear entry point. Important decisions keep their basis and outcome attached. Meetings and chats keep their original record for verification. Finished projects move to an archive. A different agent picks up the same files and keeps going.

This public repository is the method, not my personal records.

## What using it feels like

The biggest change: you can start from the question instead of onboarding the AI again every time.

1. **Making sense of a relationship**
   The agent pulls up what actually happened between you two and the read you had on it at the time, and helps you trace how you got here.

2. **Remembering how a big decision evolved**
   The agent remembers how the question evolved — from "is this job still worth staying in" to "what does staying cost versus leaving" — not just which way you went.

3. **Reviewing a part of your life you manage long-term**
   The agent answers from the current numbers on things like finances and health, not a three-year-old budget or an old checkup.

4. **Checking whether an old judgment still holds**
   The agent pulls up the reasoning and assumptions behind a call you made months ago, and tells you which of those assumptions still hold and which don't.

5. **Checking a project's real status**
   The agent separates what's actually decided from what's still being argued over and what's long since archived.

Switch agents and that context is still there. You can open the files and see what it relied on this time, and fix anything wrong or stale yourself. LifeOS can't guarantee every AI judgment is correct — but it gives that judgment something to check, so the next collaboration doesn't start from zero.

## How it differs from notes and task apps

Notes apps store material, but material doesn't turn into "what to do now" on its own. Task apps store actions, but actions are separated from the people, projects, and evidence behind them. AI chat memory stores conversations, but it doesn't leave that one product — switch tools and it's gone.

LifeOS keeps sources, current state, judgment, and decisions in separate layers, then lets an agent connect them from the same set of files. A summary doesn't get to overwrite the original. An old action item doesn't get to resurface as something current. One conversation doesn't get to become a permanent verdict on a person.

The structure isn't designed upfront either — a document earns a template only once it genuinely repeats; a workflow earns a skill or automation only once it's proven stable.

## Start

1. Create an empty folder, or open an existing personal knowledge directory.
2. Start Codex or Claude Code in that directory.
3. Copy the prompt at the top of this README.

The agent first builds a complete, navigable Markdown foundation. No questionnaire, no invented projects for show. An existing directory gets mapped into compatible roles instead of being rearranged to fit a template.

Then start with one real task:

```text
Organize the three things that matter most right now. Keep only the next actions that are still valid.
```

```text
Analyze this meeting. Preserve the original record, then write the decisions and action items back to the relevant projects.
```

```text
I am considering an important choice. Record the facts, my judgment, the options, and the final decision separately.
```

You don't need to clone this repository or upload personal content to GitHub.

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

LifeOS is local files — no database, no hosted service required. Keep it in an ordinary folder, iCloud, Dropbox, a NAS, or Git; your call.

Downloads, conversions, code, caches, and logs belong in a temporary working directory outside LifeOS — only sources and results worth keeping get written back. Connectors like Lark, Slack, Notion, Figma, and email get turned on per task. Passwords, tokens, and device codes never go into LifeOS.

The current version is a public seed you can actually use, not a finished GUI product. [`START.md`](START.md) has the initialization protocol; [`seed/`](seed/) has the agent rules and templates.

If a real task doesn't get you what you needed, [open an Issue](https://github.com/coffin5257/lifeos/issues/new) — say what you were trying to do, where it broke down, and what working style you want the agent to keep. Don't attach private material or credentials.
