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
| A constraint that must hold across several workflows | Policy in agent instructions or `system/` |
| Repeated documents with the same meaningful shape | Template |
| A mechanically detectable failure | Doctor or lint check |
| Repeated transfer from one external system | Connector or importer |
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

## Migrations

Before changing established structure:

1. audit current and uncommitted state;
2. identify authoritative entries and conflicts;
3. preview moves, renames, and rewritten links;
4. preserve raw evidence and history;
5. apply the bounded migration;
6. verify links and the motivating workflow;
7. record the migration in `.lifeos.yaml` only if migration history becomes necessary.
