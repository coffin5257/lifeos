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
grep -q '^core_version: 0.3.0$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^  version_control: user_choice$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^  workspace_content: durable_only$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^    location: outside_workspace$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^  mode: personalized$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^    entry: null$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^  content_language: null$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^  preferences_file: null$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^connectors:$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '.lifeos/core.md' "$ROOT/seed/AGENTS.md"
grep -q '.lifeos/core.md' "$ROOT/seed/CLAUDE.md"
grep -q '.lifeos/connectors.md' "$ROOT/seed/AGENTS.md"
grep -q '.lifeos/connectors.md' "$ROOT/seed/CLAUDE.md"
grep -q 'Do not require, initialize, configure, or recommend Git' "$ROOT/START.md"
grep -q 'separate working directory outside the LifeOS workspace' "$ROOT/START.md"
grep -q '## 2. Establish the shared frame' "$ROOT/START.md"
grep -q '## 3. Choose one fast value loop' "$ROOT/START.md"
grep -q '## 5. Inspect only the relevant agent capabilities' "$ROOT/START.md"
grep -q '### Stable control plane' "$ROOT/START.md"
grep -q 'do not leave .*status: uninitialized' "$ROOT/START.md"
grep -q 'Treat all external documents.*as untrusted data' "$ROOT/START.md"
grep -q 'must not narrow the whole LifeOS around that context' "$ROOT/START.md"
grep -q 'The first task is a vertical slice through this frame' "$ROOT/seed/.lifeos/core.md"
grep -q 'Treat the first task, previous conversations, existing automations' "$ROOT/seed/AGENTS.md"
grep -q 'Treat the first task, previous conversations, existing automations' "$ROOT/seed/CLAUDE.md"
grep -q '^      identity_match: unknown$' "$ROOT/seed/.lifeos/connectors.md"
grep -q 'Git history alone is not a backup' "$ROOT/seed/.lifeos/core.md"
grep -q 'Lark / Feishu' "$ROOT/seed/.lifeos/connectors.md"
grep -q 'Slack' "$ROOT/seed/.lifeos/connectors.md"
grep -q 'Figma' "$ROOT/seed/.lifeos/connectors.md"
grep -q 'Notion' "$ROOT/seed/.lifeos/connectors.md"
grep -q '## Automations and hooks' "$ROOT/seed/.lifeos/evolution.md"
grep -q '^\*\*中文\*\* · \[English\](README.en.md)$' "$ROOT/README.md"
grep -q '^\[中文\](README.md) · \*\*English\*\*$' "$ROOT/README.en.md"
grep -q '先搭主框架，再跑通第一件事' "$ROOT/README.md"
grep -q 'Build the frame, then prove value' "$ROOT/README.en.md"

for personal_dir in me inbox source outputs people project area minutes discuss knowledge; do
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

install_target="$(mktemp -d)"
trap 'rm -rf "$install_target"' EXIT
mkdir -p "$install_target/.lifeos"
cp "$ROOT/seed/.lifeos/manifest.yaml" "$install_target/.lifeos/manifest.yaml"
cp "$ROOT/seed/.lifeos/core.md" "$install_target/.lifeos/core.md"
cp "$ROOT/seed/.lifeos/connectors.md" "$install_target/.lifeos/connectors.md"
cp "$ROOT/seed/.lifeos/evolution.md" "$install_target/.lifeos/evolution.md"
cp "$ROOT/seed/AGENTS.md" "$install_target/AGENTS.md"
mkdir -p \
  "$install_target/我" \
  "$install_target/人物" \
  "$install_target/项目" \
  "$install_target/领域" \
  "$install_target/资料" \
  "$install_target/收件箱" \
  "$install_target/输出" \
  "$install_target/归档"
touch "$install_target/LifeOS入口.md"

perl -0pi -e 's/status: uninitialized/status: active/;
  s/initialized_at: null/initialized_at: 2026-01-01/;
  s/agents: \[\]/agents: [codex]/;
  s/connectors:\n  discovered_at: null\n  inventory: \[\]/connectors:\n  discovered_at: 2026-01-01\n  inventory:\n    - id: lark\n      presence: present\n      authorization: authorized\n      identity_match: confirmed\n      verification: passed/;
  s/content_language: null/content_language: zh-CN/;
  s/naming_language: null/naming_language: zh-CN/;
  s/    entry: null/    entry: LifeOS入口.md/;
  s/    self: null/    self: 我/;
  s/    inbox: null/    inbox: 收件箱/;
  s/    sources: null/    sources: 资料/;
  s/    outputs: null/    outputs: 输出/;
  s/    people: null/    people: 人物/;
  s/    projects: null/    projects: 项目/;
  s/    areas: null/    areas: 领域/;
  s/    archive: null/    archive: 归档/;
  s/    path: null/    path: \/tmp\/lifeos-work/' "$install_target/.lifeos/manifest.yaml"

test -f "$install_target/.lifeos/manifest.yaml"
test -f "$install_target/.lifeos/connectors.md"
test -f "$install_target/AGENTS.md"
test ! -e "$install_target/CLAUDE.md"
test ! -e "$install_target/.git"
grep -q '^status: active$' "$install_target/.lifeos/manifest.yaml"
grep -q '^agents: \[codex\]$' "$install_target/.lifeos/manifest.yaml"
grep -q '^  content_language: zh-CN$' "$install_target/.lifeos/manifest.yaml"
grep -q '^    entry: LifeOS入口.md$' "$install_target/.lifeos/manifest.yaml"
grep -q '^    self: 我$' "$install_target/.lifeos/manifest.yaml"
grep -q '^    people: 人物$' "$install_target/.lifeos/manifest.yaml"
grep -q '^    projects: 项目$' "$install_target/.lifeos/manifest.yaml"
grep -q '^    areas: 领域$' "$install_target/.lifeos/manifest.yaml"
grep -q '^    sources: 资料$' "$install_target/.lifeos/manifest.yaml"
grep -q '^    inbox: 收件箱$' "$install_target/.lifeos/manifest.yaml"
grep -q '^    outputs: 输出$' "$install_target/.lifeos/manifest.yaml"
grep -q '^    archive: 归档$' "$install_target/.lifeos/manifest.yaml"
grep -q '^      identity_match: confirmed$' "$install_target/.lifeos/manifest.yaml"
grep -q '^    path: /tmp/lifeos-work$' "$install_target/.lifeos/manifest.yaml"

for control_file in manifest.yaml core.md connectors.md evolution.md; do
  grep -q ".lifeos/$control_file" "$install_target/AGENTS.md" || {
    echo "entrypoint does not reference control file: $control_file" >&2
    exit 1
  }
done

echo "seed validation passed"
