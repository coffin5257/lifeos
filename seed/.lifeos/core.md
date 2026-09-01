# LifeOS Core

LifeOS connects personal evidence, current state, judgment, knowledge, and action. Its purpose is not to accumulate documents. It should help the user understand what is true now, make better decisions, and preserve the path back to evidence.

These semantic rules are stable. The user's directories, domains, templates, skills, language, and workflows may evolve.

## 1. Information layers

These are semantic distinctions, not a required directory taxonomy. An existing personal system may express them differently. When LifeOS stores durable content, the user and future agents should still be able to tell which role the content is serving:

1. **Raw evidence** — source documents, transcripts, chats, recordings, exports, and original user input. Preserve the original and its provenance.
2. **Current state** — priorities, current roles, active project state, current relationship context, and still-valid action items.
3. **Analysis and judgment** — discussions, advice, hypotheses, comparisons, and retrospectives. Distinguish confirmed facts, inference, proposal, risk, and uncertainty.
4. **Compiled knowledge** — topic pages rebuilt from named sources. It is a retrieval view, not the source of truth.
5. **Archive** — historical evidence or old state that remains traceable but is not assumed to be current.

One item may participate in more than one distinction, but one role must not impersonate another. A summary does not replace a transcript. A discussion does not become a decision. A wiki page does not become raw evidence. An archived action item is not current work.

## 2. Source priority and time

When information conflicts:

1. identify the date and applicable context;
2. use raw evidence to verify facts;
3. use the newest authoritative current-state entry to determine what is active now;
4. present older material as historical rather than silently discarding it;
5. state uncertainty when the conflict cannot be resolved.

Every judgment that may become stale should carry evidence or a time boundary.

## 3. Read narrowly

Start with the user's current priorities when a task spans multiple domains. Then read the relevant person, project, or area entry. Read raw sources only when verification is necessary.

Do not recursively scan unrelated private content. Archive is opt-in for historical review, transition analysis, retrospectives, or explicit comparison.

## 4. Write deliberately

- Preserve raw material and provenance.
- Prefer updating an existing authoritative entry over creating a synonymous document.
- Keep unknown facts unknown.
- Route unclear fragments to the configured inbox rather than inventing a new system.
- Analysis is read-only by default. Write only when the user explicitly requests initialization, capture, import, record, update, organization, or another scoped mutation.
- Do not rewrite unrelated people, projects, or areas during a focused task.

## 5. Personalized structure

The semantics are stable; directory names and layout are not. Follow the path mapping in `.lifeos/manifest.yaml`, the user's language, and any existing structure.

An initialized LifeOS should expose a small shared frame from one user-facing entry. In a new empty folder, all of these roles belong to the baseline even when they initially contain only a useful entry page:

- `me/` — identity, current roles, priorities, principles, and major decisions;
- `people/` — ongoing relationship context;
- `project/` — work with a result and completion condition;
- `area/` — responsibilities or interests without a fixed endpoint;
- `source/` — external and original material with provenance;
- `minutes/` — meeting recordings, transcripts, and minutes;
- `discuss/` — analysis and judgment around a concrete question;
- `knowledge/` — topic knowledge compiled from named sources;
- `inbox/` — uncategorized capture awaiting later judgment;
- `outputs/` — durable deliverables intended for sharing or reuse;
- `templates/` — a small set of reusable document shapes;
- `archive/` — historical material that is no longer assumed to be current.

Additional roles such as `ops/` should appear only when earned by repeated use.

These names are defaults and examples, not requirements. The user may rename, translate, nest, merge, or use one existing location for multiple roles. Record every effective baseline mapping in `.lifeos/manifest.yaml` so future agents use the same structure. The shared roles must still be understandable from the entry page and manifest.

The baseline frame is a complete initialization result and requires no invented task or onboarding answer. If the user has already supplied a concrete desired outcome and authorized input, that first task may be a vertical slice through the frame, but never its taxonomy. Previous conversations, email workflows, existing automations, and the first imported source may inform that slice but must not redefine the global structure. If the user asks to build the framework first, finish the framework without forcing a value loop.

Generated content, headings, filenames, and templates should follow the user's preferred language and naming conventions. Internal runtime rules may remain in their source language.

## 6. Storage, privacy, and safety

- LifeOS is a collection of local files and does not require a repository, remote host, or sync provider.
- The LifeOS workspace is the durable boundary for important original sources and lasting outputs such as current state, decisions, knowledge, reusable material, and finished deliverables. It is not a general-purpose workbench.
- Use a separate working directory outside the LifeOS workspace for implementation, temporary downloads, intermediate code, conversion steps, builds, dependencies, caches, logs, and experiments.
- Disposable scratch work should prefer a user-private, non-synchronized location. Work that is itself a durable code or project workspace may remain independently managed and versioned outside LifeOS. Apply protections appropriate to the source data's sensitivity in either case.
- Promote only important sources, durable LifeOS results, project references, and necessary provenance back into LifeOS. Do not copy an entire working directory or project repository into the workspace merely because it was used to produce a result.
- Intermediate work should be reproducible or safely disposable. Verify promoted results before cleanup. Never make a temporary working directory the only home of irreplaceable source material or a finished result.
- Do not delete original input or an external working directory without explicit user authorization. Report what was removed and whether it is recoverable.
- Version control and sync are independent user choices. Do not initialize, configure, or recommend them unless requested.
- Before enabling version control, backup, or sync, confirm the destination and visibility, sensitive-content scope, encryption expectations, include and exclude rules, conflict behavior, history retention, and one recovery path. Default to private visibility. Git history alone is not a backup.
- Never store credentials, tokens, private keys, authentication codes, or secret environment values in LifeOS content.
- Do not send private content to external systems unless the user authorized that system and scope.
- Separate reversible suggestions from destructive cleanup.
- Preview migrations that move, rename, or rewrite existing user content.

## 7. Keep the system understandable

Every durable rule, template, automation, or skill must solve an observed problem and have a clear owner and removal path. Prefer direct natural-language work until a repeated pattern is stable enough to formalize.
