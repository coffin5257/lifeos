# LifeOS Evolution

LifeOS evolves from observed use. Do not expand it merely because a capability might someday be useful.

## Evolution loop

1. Observe a repeated task, recurring error, retrieval failure, or domain-specific constraint.
2. Identify the smallest durable change that removes that friction.
3. Present the evidence and proposed change to the user.
4. Apply it only with write authorization.
5. Verify the real workflow that motivated the change.
6. Remove or simplify the capability if it no longer earns its complexity.

## Choose the right artifact

| Observed need | Durable artifact |
|---|---|
| A repeated workflow with stable inputs, decisions, and output | Skill |
| A constraint that must hold across several workflows | Policy in agent instructions or `.lifeos/` |
| Repeated documents with the same meaningful shape | Template |
| A mechanically detectable failure | Doctor or lint check |
| Repeated transfer from one external system | Connector or importer |
| A recurring time- or event-triggered action | Automation or hook |
| Domain-specific vocabulary, structure, and safety boundary | Domain capability pack |
| A structure that now causes conflicts or retrieval failures | Previewable migration |
| A one-off task | No new artifact |

Repeated use is evidence, not an automatic numeric threshold. A high-risk rule may deserve formalization after one incident; a harmless convenience may remain informal indefinitely.

## Evolution proposal

Every proposal should state:

- the real cases that triggered it;
- the current friction or failure;
- the smallest proposed artifact;
- files and private data it would read or change;
- new permissions or external services, if any;
- the verification workflow;
- how to disable or remove it.

Offer no more than a few high-value proposals at once.

Before proposing a new connector, read `.lifeos/connectors.md` and check whether the current Codex or Claude Code environment already provides the required integration. Prefer configuring and authorizing an existing capability over building a duplicate.

## Content maintenance

Evolution is not limited to adding structure. When evidence changes, update the authoritative current entry, preserve the old evidence, and archive state that is no longer current. Suggest periodic review only when content freshness is causing real decision or retrieval problems.

A content-maintenance proposal should identify:

- which current entry has become stale or contradictory;
- the newer evidence that justifies an update;
- whether the change is fact, inference, decision, or action;
- what historical state should remain traceable;
- how the user can verify that the updated entry is now authoritative.

## Structure changes

Language, directory names, nesting, and enabled domains belong to the user. When structure changes, update the mapping in `.lifeos/manifest.yaml` and all affected agent instructions or links. Do not force the default English path names back into a personalized instance.

The `.lifeos/` control plane is the small exception: while an installed Agent entrypoint refers to it, keep `manifest.yaml`, `core.md`, `connectors.md`, and `evolution.md` at their stable paths. Personalize content structure rather than silently breaking those references.

## Storage, backup, and sync

Version control, backup, and sync remain user choices. Before enabling one, state:

- the destination, owner, and private or public visibility;
- which sensitive content is included or excluded;
- encryption expectations and where credentials remain stored;
- conflict behavior and history retention;
- how one representative file will be restored and verified;
- how the integration can be disabled without losing the local workspace.

Do not describe Git history as a complete backup, and never publish a LifeOS workspace by default.

## Skills

Do not create a skill merely to document a single successful prompt. A skill is justified when the workflow has stable routing, safety constraints, or repeated steps that should behave consistently.

When a skill becomes necessary:

- keep the semantic workflow agent-neutral;
- install an adapter only for the agent environments the user actually uses;
- for Codex, use `.agents/skills/{name}/SKILL.md`;
- for Claude Code, use `.claude/skills/{name}/SKILL.md`;
- avoid embedding user names, companies, absolute paths, or language preferences in a reusable skill;
- put personal variations in the instance configuration or domain files;
- state whether the skill may write and what confirmation it requires.

## Policies versus skills

A policy protects the whole system. A skill implements one recurring workflow. Do not hide a cross-cutting privacy, provenance, or write-authority rule inside a single skill.

## Templates

Templates reduce repeated decisions but are not mandatory forms. Keep only fields that affect later retrieval, verification, or action. Remove empty ceremonial sections.

## Automations and hooks

Create an automation only when a recurring trigger and desired outcome are both stable. Keep the durable behavior agent-neutral, then use the smallest platform-specific adapter required by the user's actual environment.

Before enabling an automation, state:

- its trigger and cadence;
- the files and private data it reads or writes;
- whether it calls an external service;
- how failures are surfaced;
- how it is paused or removed;
- the first bounded verification run.

Do not create background jobs, scheduled tasks, hooks, or external notifications during onboarding. They require separate user authorization when a real use case appears.

## Migrations

Before changing established structure:

1. audit the current filesystem state and any configured backup or version history;
2. identify authoritative entries and conflicts;
3. preview moves, renames, and rewritten links;
4. preserve raw evidence and history;
5. apply the bounded migration;
6. verify links and the motivating workflow;
7. update `.lifeos/manifest.yaml` and record migration history only when it serves a real recovery or compatibility need.
