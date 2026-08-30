# LifeOS Onboarding

Use this workflow only when `.lifeos.yaml` has `status: uninitialized` and the user asks to initialize or set up their LifeOS.

The outcome is a useful first personal system, not a complete biography or a large empty directory tree.

## 1. Begin from a real outcome

Ask what the user most wants LifeOS to help with now. Encourage one concrete situation, such as:

- keeping current priorities and projects coherent;
- preparing for important conversations;
- importing meetings or documents without losing provenance;
- making and revisiting a decision;
- managing a long-running life area;
- capturing ideas without immediately organizing them.

Do not begin by asking the user to enumerate every life domain.

## 2. Gather the minimum personal context

Through a short conversation, establish only what is needed:

- preferred name and language;
- current important roles or contexts;
- the most important outcomes for the next 30–90 days;
- the concrete first workflow;
- sources they expect to bring into LifeOS;
- privacy boundaries and whether writes should be proposed or performed directly;
- desired collaboration style, including how proactive the agent should be.

Ask one compact group of questions at a time. Accept incomplete answers. Never infer sensitive or missing facts from stereotypes or weak evidence.

## 3. Reflect the proposed instance

Before broad creation, summarize:

- what LifeOS will help with first;
- the proposed current priorities;
- which minimal files and directories will be created;
- what will deliberately not be created yet;
- any unresolved personal facts.

If the user's original request already authorizes initialization, this reflection is for correction, not a second permission gate. Incorporate corrections and continue.

## 4. Create the minimum system

Usually create:

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

Use the files in `templates/` as starting points, removing irrelevant placeholders. Create `me/principles.md` only if the user supplied real principles. Create people, project, area, minutes, discuss, or knowledge structures only when the first real workflow needs them.

Update `.lifeos.yaml`:

- set `status: initialized`;
- set `initialized_at` to the current date;
- record the preferred language;
- list only capabilities actually enabled;
- preserve the privacy defaults unless the user explicitly changes them.

Do not create skills during onboarding.

## 5. Complete one golden path

Use the user's concrete situation to complete one useful end-to-end action. Examples:

- capture one real idea;
- create one active project with a completion condition;
- store one source and derive a separately labeled judgment;
- create one decision record;
- establish one current area state.

Show the user where evidence, current state, judgment, and actions were placed.

## 6. Finish with a usable map

Report:

- what now exists;
- the first workflow that works;
- a few natural-language examples for the next interaction;
- what remains intentionally absent;
- when an evolution review would become useful.

Do not recommend a large roadmap immediately after initialization.
