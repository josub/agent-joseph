# work/ — prospective memory ("what I need to do")

Two flowing item types plus persistent missions. **Status is the folder; type is
metadata** that survives once an item leaves intake.

| Folder | What it holds |
|---|---|
| `missions/` | Ongoing projects = current goals. Persistent; **never flows**; edited in place by `update-mission`. |
| `tasks/` | Intake for **proactive** items. Filed via `add-task`. Each item is a folder. |
| `alerts/` | Intake for **reactive** events. Filed via `add-alert`. Each item is a folder. |
| `ongoing/` | Claimed items being worked (including live workflow runs). |
| `completed/` | Finished items, awaiting the nightly `sleep` sweep. |
| `archived/` | Post-`sleep` cold storage, in `YYYY-MM-DD/` folders (by archive date). Kept indefinitely. |

## Each item is a folder
A unique, descriptive kebab-case **slug** names the folder and serves as the item's
id while active (e.g. `answer-email-from-customer-a`). It holds:
- its content file — `task.md` or `alert.md`;
- optionally a `references/` subfolder for dumped files (PDFs, etc.) — **created only
  if such files exist**;
- while being worked, a transient `.lock` (gitignored).

Each intake folder ships a `_TEMPLATE/` (just the content file) as a best-practice
shape, not a requirement. `add-task` / `add-alert` copy it and fill the content file
from a short questionnaire, minting a slug that isn't already used in the **active
pipeline** (`tasks/`, `alerts/`, `ongoing/`, `completed/`). Archived items live under
date folders, so old names never clash with new ones.

## Lifecycle
```
new item-folder → tasks/ or alerts/
   → start-work-session claims it (atomic .lock inside the folder) → ongoing/
   → completed/
   → sleep appends episodic, extracts semantic (cited to the item) → archived/<date>/
```
Lineage is the `mission:` link in the item's content file.

## Claiming work (multi-agent safe)
An item waiting in `tasks/`/`alerts/` is **lock-free**. To take it:
1. Atomically create the lock: `mkdir work/tasks/<id>/.lock` (fails if it exists — the
   race gate). One agent wins; the loser never touches the folder.
2. Winner stamps the content file's frontmatter: `status: doing`, `claimed_by`,
   `claimed_at` (ISO 8601).
3. Winner moves the whole folder to `ongoing/<id>/` and works it.
4. On finish, move to `completed/` and remove the `.lock`.

**Distributed fleet** (machines on a shared remote): commit + push the frontmatter
change to claim — a rejected non-fast-forward push means you lost; pull and pick
another. Or use Git LFS file locking (`git lfs lock <file>`).

**Stale claims:** if an item is still locked past a TTL (e.g. 4h) without completing,
treat it as abandoned — clear its `.lock` for reclaim and log to episodic.

## Workflow runs are work items
A workflow run is a task whose `task.md` carries `workflow:` / `run:` / `stage:`
pointers and, once started, a `stages/` subfolder of per-stage outputs. It flows like
any other item, so `sleep` sweeps and archives it for free. See `workflows/README.md`.
