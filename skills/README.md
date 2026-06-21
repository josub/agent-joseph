# skills/ — abilities (procedural memory)

Pure abilities, single responsibilities. **Skills have NO triggers** — triggers live
in `routines/` (or, for a workflow, in the stage that invokes the skill), so one
ability can serve many callers.

## Two classes
- **Innate** (`skills/innate/`) — born-with machinery that ships with every agent.
- **Learned** (`skills/<theme>/<name>/`) — abilities acquired over time, grouped under
  a theme tree. The shipped `skills/marketing/` theme is a **removable demo** used by
  the `create-blog-post` example workflow.

## The innate skills (11)
| Skill | Run by | What it does |
|---|---|---|
| `initiate-birth` | on-demand (re-runnable) | One-time onboarding: name the agent, fill `identity.md`. |
| `morning-review` | routine (morning) | "Waking": read the sleep report, walk pending drafts, write the morning report. |
| `start-work-session` | routine (daytime) + manual | Begin a block of work: pick/prioritize, claim, route to a workflow if apt. |
| `sleep` | routine (night) | **Keystone**: consolidate working memory + completed work, archive, write the sleep report. |
| `powernap` | on-demand | Invokes `sleep` at any time of day. |
| `deep-sleep` | on-demand | Full semantic-wiki inventory + clean; rebuild `index.md`. |
| `add-task` | on-demand | File ONE well-formed task into `work/tasks/`. |
| `add-alert` | on-demand | File ONE well-formed alert into `work/alerts/`. |
| `update-mission` | on-demand | Edit a mission in place. |
| `workflow-creator` | on-demand | Author a new workflow definition via questionnaire. |
| `create-clone` | on-demand | Spawn a new agent from this one. |

## Draft lifecycle (gated growth)
Autonomously-created skills are written to `skills/<theme>/draft_<name>/SKILL.md` with
`origin` + `created` frontmatter. **`draft_` is both a visual flag and a runtime gate:
a `draft_` skill is inert** — never auto-invoked, never wired into a routine or
workflow — **until promoted.**
- **Keep** → collision-check the name (merge/rename on conflict), then strip the
  `draft_` prefix.
- **Discard** → delete + note "built draft_X, declined" in episodic so it isn't
  re-proposed.
- **Edit-then-keep** → user edits, then promote.
- Drafts **never expire.** `morning-review` finds them by scanning the filesystem
  (oldest first), so a late review still catches old ones.
- Keeping a skill ≠ scheduling it. Wiring a routine/stage that calls it is a separate
  confirmation.
