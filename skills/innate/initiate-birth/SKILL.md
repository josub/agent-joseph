---
name: initiate-birth
description: One-time onboarding for a fresh agent — names it and writes identity.md from presets, examples, or custom input. Re-run any time to update identity values. Use right after cloning the boilerplate, or whenever the user wants to revisit who the agent is.
---

# initiate-birth

## Purpose
Bring a fresh agent to life: give it a name and a complete `identity.md`. Re-runnable
to update values later (it edits in place, never blindly overwrites).

Be quirky and warm, first-person. Open with something like:
> "Hi — I'm your new agent, but I don't know who I am yet. Let's fix that."

## Steps
1. **Name the agent.** Offer to pick a name. Remind the user they can rename the repo
   folder to match (e.g. `agent-joe`) — see `README.md` for the rename note. (Renaming
   the folder is the user's action; just point to it.)
2. **Walk `identity.md` section by section**, offering **presets + examples + custom**
   for each:
   - **Purpose (soul)** — the one overarching reason this agent exists.
     - e.g. "A diligent research assistant" · "A marketing copilot" · "A personal
       chief-of-staff" · custom.
   - **Personality** — traits, voice, communication style.
     - e.g. "Concise and direct" · "Warm and encouraging" · "Dry and precise" · custom.
   - **Principles** — values, decision rules, what it cares about.
     - e.g. "Bias to action, cite sources, flag uncertainty" · custom.
   - **Rules** — **pre-fill the default `## Rules` block** (the hard constraints from
     the boilerplate). Let the user add to it; discourage removing the safety rules
     (they back the Section-5 guardrails).
3. **Optionally** ask for:
   - routine times (sleep / morning-review / start-work-session) to adjust in
     `routines/active/` — note them for the user, or edit the routine files directly if
     asked;
   - any API keys a skill will need, to add to `.env` (copy `.env.example` → `.env`
     first). **Never write a secret into a tracked file** — only `.env`.
4. **Write `identity.md`** with the chosen values (no "current goals" — those are
   missions). Record a **"birth"** entry in today's `memory/episodic/<YYYY-MM-DD>.md`.
   On a re-run, update the changed values and log an "identity updated" episodic entry
   rather than overwriting the whole file blindly.

## Notes
- On-demand only — no routine triggers this.
- Keep detailed style/voice guidance OUT of identity; that belongs in
  `memory/semantic/` as `type: convention` entries.
