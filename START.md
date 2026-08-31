# Start a Personal LifeOS

This guide is for Codex, Claude Code, and compatible agents. LifeOS is an idea and a seed, not a harness to install mechanically. Use the material in this repository to help the user grow a local system that follows their language, structure, priorities, and working style.

## 1. Choose the local home

Build LifeOS in the local directory chosen by the user. It may be a new folder or an existing personal knowledge space.

- Do not require, initialize, configure, or recommend Git as part of this flow.
- Do not create a GitHub repository, fork this seed, or copy personal data back into it.
- If the user separately asks for version control, sync, or backup, treat that as an independent choice.
- If no target directory is stated or clear from the current workspace, ask one concise question before writing.
- If the directory already contains material, inspect only its top-level structure and relevant agent instructions. Preserve existing content and merge rather than overwrite.
- Treat the LifeOS workspace as a durable knowledge and output boundary, not as a general-purpose workbench.
- Put temporary downloads, intermediate code, conversions, builds, caches, logs, and experiments in a separate working directory outside the LifeOS workspace.
- Write back only important sources, durable results, and the provenance needed to understand them. Temporary work should remain reproducible or safely disposable.

## 2. Inspect the agent environment

Before asking the user to configure integrations, use non-mutating discovery to understand what the current Codex or Claude Code environment already provides:

- built-in connectors and connected apps;
- MCP servers and tools;
- installed plugins and skills;
- relevant local CLIs;
- workspace-scoped integration configuration.

Pay attention to real sources such as Lark / Feishu, Slack, Figma, Notion, calendars, email, drives, and task managers. These are examples, not required dependencies.

For each connector that becomes relevant, distinguish whether it is present, whether the user is authorized, and whether a minimal read-only operation succeeds. When authorization is missing, guide the user to the current environment's native login or OAuth flow. Never ask for tokens, passwords, cookies, or device codes in chat or store them in LifeOS.

If a useful integration is absent, explain what it would enable and ask whether the user wants to set it up. Unrelated or missing connectors do not block the basic local LifeOS.

Use [`seed/.lifeos/connectors.md`](seed/.lifeos/connectors.md) for the detailed connector boundaries.

## 3. Start from one real outcome

Ask what the user most wants LifeOS to help with now. Prefer one concrete situation over a complete life taxonomy, for example:

- clarifying current priorities and projects;
- preparing for an important conversation;
- digesting a meeting, chat, or external document;
- making and revisiting a decision;
- managing a long-running life area;
- capturing ideas without immediately organizing them.

## 4. Learn only what is needed

Through a short conversation, establish:

- the user's preferred name;
- content, heading, filename, and directory language;
- existing structure or naming conventions worth preserving;
- important current roles or contexts;
- the most important outcomes for the next 30–90 days;
- expected source systems and inputs;
- privacy, read, and write boundaries;
- the preferred external working-directory location, if the user already has one;
- preferred collaboration style and agent proactivity;
- the first real workflow to complete.

Ask compact questions and accept incomplete answers. Never infer sensitive facts from weak evidence.

## 5. Reflect the proposed beginning

Before broad creation, summarize:

- the exact local target;
- the first result LifeOS will support;
- the proposed language and semantic structure;
- relevant connectors that are ready, need authorization, are absent, or are intentionally skipped;
- the few files and directories worth creating now;
- where temporary and intermediate work will happen outside the LifeOS workspace;
- what will deliberately remain absent;
- unresolved facts.

If the user already asked to build the LifeOS, this reflection is for correction rather than a second permission gate. Incorporate corrections and continue.

## 6. Plant the seed

Use `seed/` as adaptable source material:

- preserve the information semantics in `seed/.lifeos/core.md`;
- copy or adapt `seed/.lifeos/connectors.md` and `seed/.lifeos/evolution.md` so the local LifeOS remains self-explanatory;
- use `seed/AGENTS.md` for Codex, `seed/CLAUDE.md` for Claude Code, or both only if the user actually uses both;
- translate, trim, merge, or rewrite files under `seed/templates/` to match the user;
- do not force English filenames, default directories, empty sections, or unused capabilities.

A useful local seed often includes:

```text
{target}/
  .lifeos/
    manifest.yaml
    core.md
    connectors.md
    evolution.md
  AGENTS.md or CLAUDE.md
  templates/                 optional reference material
  me/ or a user-named equivalent
  inbox/ or a user-named equivalent
  source/ or a user-named equivalent
  outputs/ or a user-named equivalent
```

This is a semantic example, not a required tree. The user may translate, rename, nest, merge, or omit these locations. Integrate with a coherent existing structure instead of creating duplicates.

If `.lifeos/manifest.yaml` is useful for continuity, record:

- initialization date and active agent environments;
- content language and collaboration preferences;
- semantic path mapping;
- only the capabilities actually enabled;
- only relevant connector presence, authorization, and verification status;
- storage, sync, and version control as user choices;
- the external working-directory policy and a path only when the user has chosen one.

Do not create skills, hooks, or automations at the beginning.

## 7. Complete one golden path

Use the user's real situation to complete one useful end-to-end action. Preserve raw evidence separately from current state and judgment. Show the user where information went and why.

Perform disposable or machine-specific work outside the LifeOS workspace. Before finishing, promote only the important source material, durable output, and necessary provenance into the workspace; do not copy back the whole working directory.

Examples include capturing one idea, creating one active project with a completion condition, saving one source and deriving a separately labeled judgment, recording one decision, or establishing one current area state.

## 8. Leave the seed able to grow

Make the local LifeOS aware of [`seed/.lifeos/evolution.md`](seed/.lifeos/evolution.md). Future agents should be able to propose, when justified by real use:

- updating stale current content;
- changing structure and migrating links;
- creating or simplifying templates;
- creating a skill for a stable recurring workflow;
- reusing or creating a connector;
- adding a lint or health check;
- adding a hook or automation for a stable trigger and outcome;
- adding a cross-cutting policy.

Every evolution should explain the evidence, affected data, required permissions, verification, and removal path.

## 9. Finish with a usable map

Report:

- the local target and what now exists;
- the first workflow that works;
- a few natural-language examples for the next interaction;
- what remains intentionally absent;
- connector status and any user authorization still needed;
- that storage, sync, and version control remain independent user choices;
- where future intermediate work should happen and what is allowed to be written back;
- when an evolution review would become useful.

Do not turn the ending into a large speculative roadmap.
