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
grep -q '^  version_control: user_choice$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^  mode: personalized$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^  content_language: null$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '^connectors:$' "$ROOT/seed/.lifeos/manifest.yaml"
grep -q '.lifeos/core.md' "$ROOT/seed/AGENTS.md"
grep -q '.lifeos/core.md' "$ROOT/seed/CLAUDE.md"
grep -q '.lifeos/connectors.md' "$ROOT/seed/AGENTS.md"
grep -q '.lifeos/connectors.md' "$ROOT/seed/CLAUDE.md"
grep -q 'Do not require, initialize, configure, or recommend Git' "$ROOT/START.md"
grep -q '## 2. Inspect the agent environment' "$ROOT/START.md"
grep -q 'Lark / Feishu' "$ROOT/seed/.lifeos/connectors.md"
grep -q 'Slack' "$ROOT/seed/.lifeos/connectors.md"
grep -q 'Figma' "$ROOT/seed/.lifeos/connectors.md"
grep -q 'Notion' "$ROOT/seed/.lifeos/connectors.md"
grep -q '## Automations and hooks' "$ROOT/seed/.lifeos/evolution.md"
grep -q '^\*\*中文\*\* · \[English\](README.en.md)$' "$ROOT/README.md"
grep -q '^\[中文\](README.md) · \*\*English\*\*$' "$ROOT/README.en.md"

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
cp -R "$ROOT/seed/." "$install_target/"
mkdir -p "$install_target/我" "$install_target/收件箱" "$install_target/资料" "$install_target/输出"

test -f "$install_target/.lifeos/manifest.yaml"
test -f "$install_target/.lifeos/connectors.md"
test -f "$install_target/AGENTS.md"
test -f "$install_target/CLAUDE.md"
test ! -e "$install_target/.git"

echo "seed validation passed"
