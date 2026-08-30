#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

required_files=(
  "INSTALL.md"
  "AGENTS.md"
  "CLAUDE.md"
  "README.md"
  "runtime/.lifeos/manifest.yaml"
  "runtime/.lifeos/core.md"
  "runtime/.lifeos/evolution.md"
  "runtime/AGENTS.md"
  "runtime/CLAUDE.md"
)

for relative_path in "${required_files[@]}"; do
  test -f "$ROOT/$relative_path" || {
    echo "missing required file: $relative_path" >&2
    exit 1
  }
done

grep -q '^status: uninitialized$' "$ROOT/runtime/.lifeos/manifest.yaml"
grep -q '^  version_control: user_choice$' "$ROOT/runtime/.lifeos/manifest.yaml"
grep -q '^  mode: personalized$' "$ROOT/runtime/.lifeos/manifest.yaml"
grep -q '^  content_language: null$' "$ROOT/runtime/.lifeos/manifest.yaml"
grep -q '.lifeos/core.md' "$ROOT/runtime/AGENTS.md"
grep -q '.lifeos/core.md' "$ROOT/runtime/CLAUDE.md"
grep -q 'Do not require, initialize, configure, or recommend Git' "$ROOT/INSTALL.md"
grep -q '## Automations and hooks' "$ROOT/runtime/.lifeos/evolution.md"

for personal_dir in me inbox source outputs people project area minutes discuss knowledge; do
  test ! -e "$ROOT/$personal_dir" || {
    echo "distribution unexpectedly contains personal directory: $personal_dir" >&2
    exit 1
  }
done

if rg -n -i '\b(corgan|rex|ambi|plaud|futu)\b|/Users/' \
  "$ROOT/AGENTS.md" "$ROOT/CLAUDE.md" "$ROOT/INSTALL.md" "$ROOT/runtime"; then
  echo "distribution contains instance-specific content" >&2
  exit 1
fi

install_target="$(mktemp -d)"
trap 'rm -rf "$install_target"' EXIT
cp -R "$ROOT/runtime/." "$install_target/"
mkdir -p "$install_target/我" "$install_target/收件箱" "$install_target/资料" "$install_target/输出"

test -f "$install_target/.lifeos/manifest.yaml"
test -f "$install_target/AGENTS.md"
test -f "$install_target/CLAUDE.md"
test ! -e "$install_target/.git"

echo "distribution validation passed"
