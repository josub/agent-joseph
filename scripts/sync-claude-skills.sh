#!/usr/bin/env bash
#
# sync-claude-skills.sh — expose the brain's skills to Claude Code's native skill
# discovery by symlinking them into .claude/skills/.
#
# Why: Claude Code only auto-discovers skills under .claude/skills/ (project) or
# ~/.claude/skills/ (user). Agent Brain keeps its skills in skills/ ("folder = state,
# git is the substrate"), so they're invisible to the harness by default. This bridges
# the two WITHOUT duplicating content, using relative symlinks — a single source of
# truth that also resolves inside a clone (create-clone).
#
# Scope: every skill under skills/ (innate AND learned themes), EXCEPT:
#   - draft_*  — inert/gated until promoted (guardrail 6); never exposed.
#   - _*       — templates and scaffolding (e.g. skills/_TEMPLATE).
#
# Scheduled anchors (sleep, morning-review, start-work-session) ARE exposed: they keep
# running via the run-routine.sh/cron path AND can be invoked manually through Claude
# Code's native discovery.
#
# Idempotent: safe to re-run. Refreshes links, picks up newly added/promoted skills,
# and prunes links that no longer belong (skill removed or drafted).
# This is why `sleep` runs it nightly — so both changes and new skills stay in sync.
#
# Portable to macOS's stock bash 3.2 (no associative arrays).
#
# Usage: scripts/sync-claude-skills.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

SKILLS_DIR="skills"
DEST_DIR=".claude/skills"

mkdir -p "$DEST_DIR"

# --- Create / refresh relative symlinks for every eligible skill ---
DESIRED=" "
linked=0
while IFS= read -r skill_md; do
  skill_dir="$(dirname "$skill_md")"        # e.g. skills/innate/add-task | skills/marketing/copywrite
  name="$(basename "$skill_dir")"           # the skill name (= folder name)

  case "$name" in
    draft_*) continue ;;                    # inert/gated — never expose
    _*)      continue ;;                    # templates/scaffolding
  esac

  if [[ "$DESIRED" == *" $name "* ]]; then
    echo "[sync-claude-skills] WARNING: duplicate skill name '$name' ($skill_dir) — keeping first, skipping this one." >&2
    continue
  fi

  # .claude/skills/ is two levels below the repo root, so '../../' + the repo-relative
  # skill path is the correct relative target (resolves the same way inside a clone).
  ln -sfn "../../$skill_dir" "$DEST_DIR/$name"
  DESIRED+="$name "
  linked=$((linked + 1))
done < <(find "$SKILLS_DIR" -type f -name SKILL.md | sort)

# --- Prune symlinks that no longer belong (removed, drafted, or broken) ---
pruned=0
for link in "$DEST_DIR"/*; do
  [[ -L "$link" ]] || continue              # only touch our symlinks
  name="$(basename "$link")"
  if [[ "$DESIRED" != *" $name "* ]]; then
    rm -f "$link"
    pruned=$((pruned + 1))
  fi
done

echo "[sync-claude-skills] linked ${linked} skill(s) into ${DEST_DIR}; pruned ${pruned} stale link(s)."
