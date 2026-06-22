# agent-brain

A clean-slate **boilerplate for an autonomous agent that works like a mind.** The folder
system maps onto the brain's memory taxonomy, and the agent's daily rhythm — sleep,
waking, working — is expressed entirely in the system's own primitives: **routines** that
call **skills**. It's all plain markdown, with git as the substrate.

> Universal infrastructure ships and works on clone; project content is left empty. Clone
> it per project, or spin up new differently-trained agents from an existing one with
> `create-clone`.

## The idea, in a paragraph
The agent has a stable **identity** (`identity.md`), a **memory** split the way human
memory is — working scratch (`memory/working/`), episodic "what happened"
(`memory/episodic/`), semantic "what I know" (`memory/semantic/`), and daily digests
(`memory/reports/`) — and **prospective memory** of what to do (`work/`: persistent
missions plus flowing tasks and alerts). Its abilities are **skills** (pure, no
triggers), its habits are **routines** (trigger → skill), and its complex repeatable
procedures are **workflows** (staged input→process→output with a Verify gate). The
keystone is **sleep**: a nightly routine that folds the day into long-term memory and
writes a sleep report; the next morning, **morning-review** turns that into a
human-readable day plan.

## Directory tour
```
identity.md     the self — purpose, personality, principles, hard Rules (no goals here)
CLAUDE.md       the operating manual — brain map, rhythm, guardrails, conventions
memory/         working · archive · episodic · semantic (wiki) · reports (digests)
work/           missions (persistent) · tasks · alerts · ongoing · completed · archived
skills/         innate/ (ships with every agent) + learned theme trees
workflows/      reusable multi-stage procedures — ICM applies HERE ONLY
routines/       active/ + inactive/ — trigger → skill bindings
scripts/        run-routine.sh (routine runner) · sync-claude-skills.sh (native exposure)
.claude/skills/ generated symlinks that expose on-demand skills to Claude Code natively
```
Read `CLAUDE.md` for the full map and the rules; each top folder has its own README.

## A note on native skill invocation (`.claude/skills/`)
Claude Code only auto-discovers skills under `.claude/skills/`, so the brain's own
`skills/` are otherwise invokable only conversationally or via `run-routine.sh`. Running
**`scripts/sync-claude-skills.sh`** symlinks **every skill** (innate *and* learned
themes) into `.claude/skills/` (committed, so clones carry them) — making them appear in
the harness skill list and invokable directly. The links are **relative**, so they
resolve in a clone. Three things are deliberately excluded: inert **`draft_`** skills
(guardrail 6 — gated until promoted), templates (`_*`), and the **scheduled anchors**
(`sleep`, `morning-review`, `start-work-session`), which stay on the
`run-routine.sh`/cron path so they aren't fired ad hoc. The script is idempotent and
**`sleep` runs it nightly**, so promoted/new skills surface automatically and stale
links (removed, drafted, or now-anchor skills) are pruned — you rarely need to run it by
hand.

## A note on the demo
`workflows/create-blog-post/` and the `skills/marketing/` theme it uses ship as a
**removable demo** that teaches the workflow pattern (research → copywrite → pdf). Delete
both folders if you don't want them; nothing else depends on them.

## A note on multi-agent
Because the whole agent is just a folder, **`create-clone`** spins up a new,
differently-trained agent from this one — carrying over the machinery and any relevant
learned skills/workflows, with a fresh identity and empty memory. Clones are independent
folders; there's no cross-agent runtime coordination.

---

## After you clone
1. **Rename** the repo folder to your agent's name (e.g. `agent-joe`).
2. Copy `.env.example` → `.env` and add any keys (only if a skill needs them). `.env` is
   gitignored — never commit secrets.
3. Run **`initiate-birth`** to set identity from presets, examples, or custom input
   (writes `identity.md`, incl. the default safety Rules). Re-run any time to update.
4. Create your first **mission** in `work/missions/`; seed known facts as concepts in
   `memory/semantic/` (including any voice/style **`convention`** entries).
5. Adjust the **anchor routine times** in `routines/active/`; wire scheduling via
   `scripts/` if you want it (and know about the `.paused` kill-switch).
6. Work the rhythm: **`add-task`** / **`add-alert`** to file work,
   **`start-work-session`** to begin a block, **`powernap`** to consolidate midday,
   **`deep-sleep`** to spring-clean the wiki.
7. **Keep or delete the demo**: remove `workflows/create-blog-post/` and
   `skills/marketing/`, or adapt them. Author your own with **`workflow-creator`**.
8. **Grow a fleet**: run **`create-clone`** to spawn a new, differently-trained agent.

> This is the *light* model. It borrows one idea from ICM (folder-as-architecture,
> staged input→process→output contracts) but **scopes ICM strictly to `workflows/`**.
> The cyclic cognition (sleep/wake/work) stays native everywhere else.
