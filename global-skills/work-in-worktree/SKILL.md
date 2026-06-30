---
name: work-in-worktree
description: Use when the user starts a new branch-worthy unit of work — an issue, feature, or fix that will produce commits — in a git repo. Isolates the work in a dedicated git worktree so concurrent Claude sessions in other VS Code windows can't collide by switching the shared checkout's branch. Also helps the user pick which issue to start (via gh + a question) when they didn't name one. Do NOT use for read-only questions, trivial in-place edits, or when already inside a dedicated worktree.
---

# Work in an isolated git worktree

Multiple Claude chats often share one checkout. Collisions happen when one chat runs
`git checkout` / `git switch` and moves the working tree out from under another. Prevent it:
do branch-worthy work in its own git worktree, and **never switch branches in a shared checkout**.

## 1. Decide — worktree, or work in place?

Spin up a worktree when ALL hold:
- The task is **branch-worthy** (a new issue/feature/fix that will produce commits), and
- You're in the repo's **main** working tree (see check), and
- The user didn't ask to stay on the current branch.

Work in place (skip it) when:
- It's a read-only question, investigation, or a tiny one-off with no new branch.
- You're **already in a dedicated worktree** — don't nest one inside another.
- The user explicitly said to work on the current branch / in place.

Already-in-a-worktree check: in a linked worktree the repo root's `.git` is a **file**, not a
directory — `test -f "$(git rev-parse --show-toplevel)/.git"` → already isolated, work here.

When genuinely unsure, prefer isolating: a worktree is cheap and removes all collision risk.
You may briefly tell the user you're isolating in a worktree, but don't turn it into a question.

## 2. Pick the issue (only if unspecified)

If the user said "start an issue / a new task" without naming which:
- If `gh` is available and the remote is GitHub: `gh issue list --limit 15`.
- Present the open issues with **AskUserQuestion** so they choose (don't make them type a
  number). Otherwise use whatever task the user described.

## 3. Create the worktree

1. `ROOT="$(git rev-parse --show-toplevel)"`; base = default branch from
   `git -C "$ROOT" symbolic-ref --quiet refs/remotes/origin/HEAD` (strip to name, else `main`),
   or a base branch the user named; then `git -C "$ROOT" fetch origin`.
2. Branch name: `feat/<n>-<slug>` (or a sensible slug from the task).
3. Worktree path beside the repo: `<parent-of-ROOT>/<repo-name>-worktrees/<branch-slug>`
   (must not already exist).
4. Reuse if present — check `git -C "$ROOT" worktree list`. Else create off the fetched base:
   `git -C "$ROOT" worktree add -b <branch> <path> origin/<base>`
   (branch exists but unchecked-out → omit `-b`).
5. Make it runnable (each worktree is a fresh folder):
   - `ROOT/.env.local` exists → `ln -s "$ROOT/.env.local" <path>/.env.local`.
   - Lockfile present → install deps in `<path>` (npm / pnpm / yarn to match the lockfile).

## 4. Hand off, then work

Print the worktree path and `code -n <path>` to open it as its own window. Recommend continuing
the work **in that window** (one window = one task = one worktree). If the user wants to keep
going in this chat, operate strictly inside `<path>` via `git -C <path>` and absolute file paths —
never touch the original checkout's branch or files.

Then do the work: read the issue, plan, implement, commit on `<branch>` inside the worktree. When
it's merged, clean up with `git -C "$ROOT" worktree remove <path>`.
