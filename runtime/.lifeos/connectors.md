# LifeOS Connector Protocol

Connectors let the agent read or write external systems without turning LifeOS into a full synchronized copy. Prefer capabilities already provided by the user's Codex or Claude Code environment before creating a custom integration.

## 1. Discover before proposing setup

For onboarding and any task involving an external source, inspect the current agent environment using read-only discovery:

- built-in connectors and connected apps;
- available MCP servers and tools;
- installed plugins and skills;
- relevant local CLIs and their non-sensitive status output;
- repository- or workspace-scoped integration configuration.

Do not inspect credential values, browser cookies, keychains, tokens, or unrelated account data. Do not infer authorization merely because a tool, plugin, MCP server, or executable exists.

## 2. Track three independent dimensions

For each connector relevant to the user, distinguish:

- **Presence** — absent or present in the current agent environment;
- **Authorization** — unknown, required, or authorized;
- **Verification** — untested, passed, or failed for a minimal read-only operation.

“Installed” is not “authorized”, and “authorized” is not proof that the required scope works.

Record only relevant connector status in `.lifeos/manifest.yaml`. Do not inventory every possible service.

Use this shape for each relevant entry, omitting unknown optional detail rather than inventing it:

```yaml
connectors:
  discovered_at: YYYY-MM-DD
  inventory:
    - id: lark
      adapter: existing capability name
      presence: present
      authorization: required
      verification: untested
      capabilities: []
      checked_at: YYYY-MM-DD
```

Valid dimension values are:

- `presence`: `absent` or `present`;
- `authorization`: `unknown`, `required`, or `authorized`;
- `verification`: `untested`, `passed`, or `failed`.

Never store account tokens, cookies, secret values, or unique authorization codes in this inventory.

## 3. Match connectors to real sources

Common examples include:

| User source or workflow | Existing capability to look for first |
|---|---|
| Lark / Feishu documents, messages, meetings, calendar | Lark CLI, Lark/Feishu connector, plugin, or MCP tools |
| Slack conversations and channels | Slack connector, connected app, plugin, or MCP tools |
| Figma files, design context, and handoff | Figma integration, plugin, or MCP tools |
| Notion pages and databases | Notion connector, connected app, plugin, or MCP tools |
| Calendar, email, drive, task manager | The agent environment's existing native connector or MCP integration |

These are discovery targets, not dependencies. Do not ask a user to configure a service they do not use.

## 4. Handle missing setup or authorization

If a relevant capability is absent:

1. explain what workflow it would enable;
2. identify the agent-native setup surface currently available;
3. ask whether the user wants to configure it now;
4. continue onboarding without it if they decline.

If a capability is present but authorization is missing or expired:

1. state that the integration exists but is not currently authorized;
2. direct the user to the environment's native authorization flow;
3. let the user complete login, OAuth, device confirmation, or consent when required;
4. never ask the user to paste credentials or tokens into LifeOS files or chat;
5. after authorization, perform one minimal read-only verification within the requested scope.

Do not claim a connector is ready until verification passes. Report permission, scope, expired-session, and service failures as distinct from absence.

## 5. Import and write boundaries

- Connector availability does not authorize broad collection. Read only what the current task needs.
- Preserve source system, source URL or stable identifier, observed date, and relevant time range when importing evidence.
- Do not mirror an entire service by default. Pull information when it is needed.
- Treat connector content as raw evidence until it is analyzed and routed into current state or judgment.
- External writes, messages, comments, file changes, and permission changes require explicit user intent for that destination and scope.
- Keep authentication material in the connector's native credential store, never in LifeOS content.

## 6. Prefer reuse over custom integration

Create a custom connector, wrapper, or automation only when an existing native connector cannot support a repeated and validated workflow. Document the missing capability, permissions, data flow, failure behavior, verification, and removal path before adding it.
