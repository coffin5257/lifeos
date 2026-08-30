# Install LifeOS

This document is an instruction contract for Codex, Claude Code, and compatible coding agents. The GitHub repository containing this file is the distribution source, not the destination for the user's personal data.

## Non-negotiable storage boundary

- Install LifeOS into the local directory chosen by the user.
- The target may be a new folder or an existing personal knowledge directory.
- Do not require, initialize, configure, or recommend Git as part of installation.
- Do not create a GitHub repository, fork the source repository, or copy personal data back into the distribution source.
- If the user separately asks for version control or sync, treat that as a later, independent choice.
- If the target is outside the agent's current writable workspace, explain the boundary and obtain only the access needed for that exact directory.

## 1. Resolve the target directory

If the user explicitly named a target, use it. If the user said to install in the current directory, verify the current directory is not this distribution source and use it. Otherwise ask one concise question for the desired local location.

Before writing into an existing directory:

- inspect only its top-level structure and relevant instruction files;
- identify path conflicts with `AGENTS.md`, `CLAUDE.md`, `.lifeos/`, `me/`, `inbox/`, `source/`, or `outputs/`;
- preserve existing user content;
- propose a merge when an existing instruction file must be integrated rather than overwritten.

## 2. Begin from a real outcome

Ask what the user most wants LifeOS to help with now. Encourage one concrete situation, such as:

- keeping current priorities and projects coherent;
- preparing for important conversations;
- importing meetings or documents without losing provenance;
- making and revisiting a decision;
- managing a long-running life area;
- capturing ideas without immediately organizing them.

Do not begin by asking the user to enumerate every life domain.

## 3. Gather the minimum personal context

Through a short conversation, establish only what is needed:

- preferred name and language;
- preferred language for content, headings, and directory names;
- current important roles or contexts;
- the most important outcomes for the next 30–90 days;
- the concrete first workflow;
- sources they expect to bring into LifeOS;
- privacy boundaries and whether writes should be proposed or performed directly;
- desired collaboration style, including how proactive the agent should be.
- whether the user already has a directory convention that LifeOS should follow.

Ask one compact group of questions at a time. Accept incomplete answers. Never infer sensitive or missing facts from stereotypes or weak evidence.

## 4. Reflect the proposed instance

Before broad creation, summarize:

- the exact target directory;
- what LifeOS will help with first;
- the proposed current priorities;
- the proposed content language and directory mapping;
- which minimal files and directories will be created;
- what will deliberately not be created yet;
- any unresolved personal facts.

If the user's request already authorizes initialization, this reflection is for correction, not a second permission gate. Incorporate corrections and continue.

## 5. Install the self-contained runtime

Install the self-contained rules from the distribution's `runtime/` directory into the target directory:

```text
{target}/
  .lifeos/
    manifest.yaml
    core.md
    evolution.md
  AGENTS.md or CLAUDE.md
  templates/
```

Always install `.lifeos/` and `templates/`. Install `AGENTS.md` for Codex, `CLAUDE.md` for Claude Code, or both only when the user actually uses both environments.

Use the exact runtime files from the same source revision as this document. Do not replace them with remembered or improvised variants. When the source is remote, retrieve only these named files through the available read mechanism.

If the target already contains `AGENTS.md` or `CLAUDE.md`, integrate the LifeOS loading contract into the existing file while preserving its unrelated rules. Never silently overwrite existing agent instructions.

## 6. Create the minimum personal system

The following is a default semantic shape, not a required English directory tree:

```text
me/
  profile.md
  priorities.md
inbox/
  README.md
source/
  README.md
outputs/
  README.md
```

Translate or adapt directory names, filenames, headings, and template content to the user's language and conventions. Record the effective semantic path mapping in `{target}/.lifeos/manifest.yaml`. If the user already has a coherent structure, integrate with it instead of creating English duplicates.

Use the files in `{target}/templates/` as semantic starting points, not mandatory forms. Remove irrelevant placeholders. Create a principles file only if the user supplied real principles. Create people, project, area, minutes, discuss, or knowledge structures only when the first real workflow needs them.

Update `{target}/.lifeos/manifest.yaml`:

- set `status: initialized`;
- set `initialized_at` to the current date;
- record the content language and effective path mapping;
- list only the agent environments actually in use;
- list only capabilities actually enabled;
- preserve `version_control: user_choice` unless the user explicitly chooses otherwise.

Do not create skills during onboarding.

## 7. Complete one golden path

Use the user's concrete situation to complete one useful end-to-end action. Examples:

- capture one real idea;
- create one active project with a completion condition;
- store one source and derive a separately labeled judgment;
- create one decision record;
- establish one current area state.

Show the user where evidence, current state, judgment, and actions were placed.

## 8. Finish with a usable map

Report:

- the target directory and what now exists;
- the first workflow that works;
- a few natural-language examples for the next interaction;
- what remains intentionally absent;
- that storage, sync, and version control remain the user's independent choice;
- when an evolution review would become useful.

Do not recommend a large roadmap immediately after initialization.
