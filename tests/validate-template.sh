#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

required_files=(
  ".lifeos.yaml"
  "AGENTS.md"
  "CLAUDE.md"
  "README.md"
  "system/core.md"
  "system/onboarding.md"
  "system/evolution.md"
)

for relative_path in "${required_files[@]}"; do
  test -f "$ROOT/$relative_path" || {
    echo "missing required file: $relative_path" >&2
    exit 1
  }
done

grep -q '^status: uninitialized$' "$ROOT/.lifeos.yaml"
grep -q 'system/core.md' "$ROOT/AGENTS.md"
grep -q 'system/core.md' "$ROOT/CLAUDE.md"

for personal_dir in me inbox source outputs people project area minutes discuss knowledge; do
  test ! -e "$ROOT/$personal_dir" || {
    echo "template unexpectedly contains personal directory: $personal_dir" >&2
    exit 1
  }
done

if rg -n -i '\b(corgan|rex|ambi|plaud|futu|coffin5257)\b|/Users/' \
  "$ROOT/AGENTS.md" "$ROOT/CLAUDE.md" "$ROOT/system" "$ROOT/templates"; then
  echo "template contains instance-specific content" >&2
  exit 1
fi

echo "template validation passed"
