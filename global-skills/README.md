# global-skills

Portable, **model-invoked** Claude Code Skills — versioned here, but exposed **globally** so
they work in every repo (not just this one).

## Why this is separate from `skills/`

The brain's `skills/` are the *agent's own* capabilities: pure (no triggers), exposed only
inside this repo (via the generated `.claude/skills/` symlinks), and born inert as `draft_`
pending review. The skills here are the opposite by design: they carry a `description` that
**is** the trigger (Claude decides when to use them), they're **global**, and they're live
immediately. Keeping them out of `skills/` avoids violating those conventions.

## How it's wired

Each subdir is a Claude Code Skill (`<name>/SKILL.md`). It's made global by symlinking it into
the personal skills dir:

```bash
ln -s "$(pwd)/<name>" ~/.claude/skills/<name>
```

The source of truth stays in git here; `~/.claude/skills/<name>` is just a pointer, so editing
the file in this repo updates the live skill. New machine? Re-run the symlink for each subdir.

## Skills

- **work-in-worktree** — when starting branch-worthy work (a new issue/feature/fix), isolate it
  in a dedicated `git worktree` so concurrent Claude windows can't collide by switching the
  shared checkout's branch. Includes the "worktree vs. work-in-place" decision and gh-based
  issue selection.
