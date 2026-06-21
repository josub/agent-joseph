#!/usr/bin/env bash
#
# run-routine.sh — CLI entry point that runs a named routine (or skill) via Claude Code.
#
# Usage:
#   scripts/run-routine.sh sleep
#   scripts/run-routine.sh morning-review
#   scripts/run-routine.sh start-work-session
#
# It resolves <name> to routines/active/<name>.md, reads the skill it `runs:`, and
# invokes Claude Code non-interactively to perform that skill from the repo root.
#
# Guardrails honored here:
#   - Global pause switch: if a `.paused` file exists at the repo root, this exits
#     without doing anything. (Create `.paused` to halt all scheduled activity; delete
#     to resume.)
#   - Secrets stay in `.env`, which is sourced (never committed).

set -euo pipefail

# --- Locate the repo root (parent of this scripts/ dir) ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

# --- Kill-switch: honor .paused ---
if [[ -f "$REPO_ROOT/.paused" ]]; then
  echo "[run-routine] .paused present — all scheduled activity halted. Delete it to resume."
  exit 0
fi

# --- Argument ---
ROUTINE="${1:-}"
if [[ -z "$ROUTINE" ]]; then
  echo "Usage: $0 <routine-name>    (e.g. sleep | morning-review | start-work-session)" >&2
  exit 2
fi

# --- Source .env if present (secrets live here only) ---
if [[ -f "$REPO_ROOT/.env" ]]; then
  set -a
  # shellcheck disable=SC1091
  source "$REPO_ROOT/.env"
  set +a
fi

# --- Resolve the routine file -> the skill it runs ---
ROUTINE_FILE="$REPO_ROOT/routines/active/$ROUTINE.md"
if [[ ! -f "$ROUTINE_FILE" ]]; then
  echo "[run-routine] No active routine '$ROUTINE' at $ROUTINE_FILE" >&2
  echo "Active routines:" >&2
  ls -1 "$REPO_ROOT/routines/active/" 2>/dev/null | sed 's/\.md$//' >&2 || true
  exit 1
fi

# Pull the `runs:` target (e.g. skills/innate/sleep) from the frontmatter.
SKILL_PATH="$(awk -F': *' '/^runs:/ {print $2; exit}' "$ROUTINE_FILE" | tr -d '[:space:]')"
if [[ -z "$SKILL_PATH" ]]; then
  echo "[run-routine] Routine '$ROUTINE' has no 'runs:' target in its frontmatter." >&2
  exit 1
fi

SKILL_FILE="$REPO_ROOT/$SKILL_PATH/SKILL.md"
if [[ ! -f "$SKILL_FILE" ]]; then
  echo "[run-routine] Routine '$ROUTINE' points at '$SKILL_PATH' but $SKILL_FILE is missing." >&2
  exit 1
fi

echo "[run-routine] $ROUTINE -> $SKILL_PATH"

# --- Invoke Claude Code non-interactively to perform the skill ---
# The agent operates from the repo root; CLAUDE.md + identity.md give it its context.
PROMPT="Perform the skill defined in $SKILL_PATH/SKILL.md. Follow CLAUDE.md, identity.md, and the guardrails. This is an unattended routine run ($ROUTINE): take no consequential or outbound action on your own — stage and draft instead."

if command -v claude >/dev/null 2>&1; then
  exec claude -p "$PROMPT"
else
  echo "[run-routine] 'claude' CLI not found on PATH." >&2
  echo "Install Claude Code, or run the skill manually by opening $SKILL_FILE." >&2
  exit 127
fi

# ---------------------------------------------------------------------------
# Scheduling is OPT-IN. Examples below are commented out — wire them yourself.
#
# --- cron (Linux/macOS) --- edit with `crontab -e`, use ABSOLUTE paths:
#   0 23   * * *  /path/to/agent-brain/scripts/run-routine.sh sleep
#   0  8   * * *  /path/to/agent-brain/scripts/run-routine.sh morning-review
#   0 9-18/2 * * * /path/to/agent-brain/scripts/run-routine.sh start-work-session
#
# --- launchd (macOS) --- see scripts/README.md for a sample .plist that calls this
#   script on a StartCalendarInterval. Load with:
#   launchctl load ~/Library/LaunchAgents/com.agent-brain.sleep.plist
# ---------------------------------------------------------------------------
