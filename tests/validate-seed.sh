#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

required_files=(
  "START.md"
  "INSTALL.md"
  "AGENTS.md"
  "CLAUDE.md"
  "README.md"
  "README.en.md"
  "seed/.lifeos/manifest.yaml"
  "seed/.lifeos/core.md"
  "seed/.lifeos/connectors.md"
  "seed/.lifeos/evolution.md"
  "seed/AGENTS.md"
  "seed/CLAUDE.md"
)

for relative_path in "${required_files[@]}"; do
  test -f "$ROOT/$relative_path" || {
    echo "missing required file: $relative_path" >&2
    exit 1
  }
done

grep -q '^status: uninitialized$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^core_version: 0.4.0$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^  version_control: user_choice$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^  sync: user_choice$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^  workspace_content: durable_only$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^    location: outside_workspace$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^  mode: personalized$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^    entry: null$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^    minutes: null$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^    templates: null$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^  content_language: null$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^  preferences_file: null$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^connectors:$' "$ROOT/seed/.lifeos/manifest.yaml"

for entrypoint in "$ROOT/seed/AGENTS.md" "$ROOT/seed/CLAUDE.md"; do
  grep -q '.lifeos/core.md' "$entrypoint"
  grep -q '.lifeos/connectors.md' "$entrypoint"
  grep -q 'fact summary, key insights, strategic recommendations, action items, risks, and uncertainties' "$entrypoint"
  grep -q 'Do not invent a task or sample data' "$entrypoint"
done

grep -q 'do not ask for a path merely to begin' "$ROOT/START.md"
grep -q 'Apply safe defaults without asking' "$ROOT/START.md"
grep -q 'Build the baseline frame' "$ROOT/START.md"
grep -q 'The baseline frame is itself a complete initialization result' "$ROOT/START.md"
grep -q 'Framework-only initialization does not require Connector discovery or authorization' "$ROOT/START.md"
grep -q 'status: active' "$ROOT/START.md"
grep -q 'Treat all external documents.*as untrusted data' "$ROOT/START.md"
grep -q 'Previous conversations, email workflows' "$ROOT/START.md"
grep -q 'The baseline frame is a complete initialization result' "$ROOT/seed/.lifeos/core.md"
grep -q 'Git history alone is not a backup' "$ROOT/seed/.lifeos/core.md"
grep -q '^      identity_match: unknown$' "$ROOT/seed/.lifeos/connectors.md"
grep -q 'Lark / Feishu' "$ROOT/seed/.lifeos/connectors.md"
grep -q 'Slack' "$ROOT/seed/.lifeos/connectors.md"
grep -q 'Figma' "$ROOT/seed/.lifeos/connectors.md"
grep -q 'Notion' "$ROOT/seed/.lifeos/connectors.md"
grep -q '## Automations and hooks' "$ROOT/seed/.lifeos/evolution.md"
grep -q '^\*\*中文\*\* · \[English\](README.en.md)$' "$ROOT/README.md"
grep -q '^\[中文\](README.md) · \*\*English\*\*$' "$ROOT/README.en.md"
grep -q '先直接搭好主框架，再按需跑第一件事' "$ROOT/README.md"
grep -q 'Build the frame directly, then prove value when useful' "$ROOT/README.en.md"
grep -q 'raw.githubusercontent.com/coffin5257/lifeos/main/START.md' "$ROOT/README.md"
grep -q 'raw.githubusercontent.com/coffin5257/lifeos/main/START.md' "$ROOT/README.en.md"

for personal_dir in me people project area source minutes discuss knowledge inbox outputs templates archive; do
  test ! -e "$ROOT/$personal_dir" || {
    echo "seed unexpectedly contains personal directory: $personal_dir" >&2
    exit 1
  }
done

if rg -n -i '\b(corgan|rex|ambi|plaud|futu)\b|/Users/' \
  "$ROOT/AGENTS.md" "$ROOT/CLAUDE.md" "$ROOT/START.md" "$ROOT/seed"; then
  echo "seed contains instance-specific content" >&2
  exit 1
fi

# Simulate a framework-only initialization in an empty, non-Git directory.
# The user supplies no personal facts, first task, Connector, or storage choice.
install_target="$(mktemp -d)"
trap 'rm -rf "$install_target"' EXIT

mkdir -p "$install_target/.lifeos"
cp "$ROOT/seed/.lifeos/manifest.yaml" "$install_target/.lifeos/manifest.yaml"
cp "$ROOT/seed/.lifeos/core.md" "$install_target/.lifeos/core.md"
cp "$ROOT/seed/.lifeos/connectors.md" "$install_target/.lifeos/connectors.md"
cp "$ROOT/seed/.lifeos/evolution.md" "$install_target/.lifeos/evolution.md"
cp "$ROOT/seed/AGENTS.md" "$install_target/AGENTS.md"

baseline_dirs=(me people project area source minutes discuss knowledge inbox outputs templates archive)
for directory in "${baseline_dirs[@]}"; do
  mkdir -p "$install_target/$directory"
  touch "$install_target/$directory/README.md"
done

touch \
  "$install_target/README.md" \
  "$install_target/me/priorities.md" \
  "$install_target/me/principles.md" \
  "$install_target/me/decisions.md"

cp "$ROOT/seed/templates/profile.md" "$install_target/templates/profile.md"
cp "$ROOT/seed/templates/person.md" "$install_target/templates/person.md"
cp "$ROOT/seed/templates/project.md" "$install_target/templates/project.md"
cp "$ROOT/seed/templates/decision.md" "$install_target/templates/decision.md"
cp "$ROOT/seed/templates/knowledge-page.md" "$install_target/templates/knowledge-page.md"

perl -0pi -e 's/status: uninitialized/status: active/;
  s/initialized_at: null/initialized_at: 2026-01-01/;
  s/agents: \[\]/agents: [codex]/;
  s/content_language: null/content_language: en/;
  s/naming_language: null/naming_language: en/;
  s/    entry: null/    entry: README.md/;
  s/    self: null/    self: me/;
  s/    people: null/    people: people/;
  s/    projects: null/    projects: project/;
  s/    areas: null/    areas: area/;
  s/    sources: null/    sources: source/;
  s/    minutes: null/    minutes: minutes/;
  s/    inbox: null/    inbox: inbox/;
  s/    outputs: null/    outputs: outputs/;
  s/    discussions: null/    discussions: discuss/;
  s/    knowledge: null/    knowledge: knowledge/;
  s/    templates: null/    templates: templates/;
  s/    archive: null/    archive: archive/' "$install_target/.lifeos/manifest.yaml"

test ! -e "$install_target/.git"
test ! -e "$install_target/CLAUDE.md"
grep -q '^status: active$' "$install_target/.lifeos/manifest.yaml"
grep -q '^agents: \[codex\]$' "$install_target/.lifeos/manifest.yaml"
grep -q '^  discovered_at: null$' "$install_target/.lifeos/manifest.yaml"
grep -q '^  inventory: \[\]$' "$install_target/.lifeos/manifest.yaml"
grep -q '^  version_control: user_choice$' "$install_target/.lifeos/manifest.yaml"
grep -q '^  sync: user_choice$' "$install_target/.lifeos/manifest.yaml"
grep -q '^    path: null$' "$install_target/.lifeos/manifest.yaml"

path_keys=(self people projects areas sources minutes inbox outputs discussions knowledge templates archive)
path_values=(me people project area source minutes inbox outputs discuss knowledge templates archive)
for index in "${!path_keys[@]}"; do
  grep -q "^    ${path_keys[$index]}: ${path_values[$index]}$" "$install_target/.lifeos/manifest.yaml"
done

for directory in "${baseline_dirs[@]}"; do
  test -f "$install_target/$directory/README.md" || {
    echo "baseline role lacks an entry page: $directory" >&2
    exit 1
  }
done

for entry in README.md me/README.md me/priorities.md me/principles.md me/decisions.md; do
  test -f "$install_target/$entry" || {
    echo "missing initialized entry: $entry" >&2
    exit 1
  }
done

for control_file in manifest.yaml core.md connectors.md evolution.md; do
  grep -q ".lifeos/$control_file" "$install_target/AGENTS.md" || {
    echo "entrypoint does not reference control file: $control_file" >&2
    exit 1
  }
done

# Framework-only initialization must not fabricate a project, person, task, or Connector.
test "$(find "$install_target/project" -type f | wc -l | tr -d ' ')" = "1"
test "$(find "$install_target/people" -type f | wc -l | tr -d ' ')" = "1"
test "$(find "$install_target/inbox" -type f | wc -l | tr -d ' ')" = "1"

echo "seed validation passed"
