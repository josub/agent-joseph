# memory/ — the agent's memory

Maps onto a human memory taxonomy. Plain markdown; git is the substrate.

| Folder | Human faculty | What lives here |
|---|---|---|
| `working/` | Working memory (short-term scratch) | Notes the agent or user dumps during the day. **Not wiped immediately** — `sleep` consolidates each item nightly, then *moves* it to `archive/`. |
| `archive/` | (consolidated scratch) | Dated `YYYY-MM-DD/` folders of already-consolidated scratch. Recoverable history; auto-pruned by `sleep` after 30 days. Distinct from `work/archived/` (completed-work provenance, kept indefinitely). |
| `episodic/` | Episodic memory ("what happened") | Dated, append-only `YYYY-MM-DD.md` files. The raw chronological record and audit trail. There is no separate `log.md`. |
| `semantic/` | Semantic memory ("what I know") | A loose-OKF concept wiki: one concept per file, file path = identity, cross-linked. Also holds given **reference conventions** (brand voice, style/design guides) as `type: convention` entries. Read `index.md` first. |
| `reports/` | Daily digests | Human-readable sleep + morning reports. The in-flight cycle lives in `latest/`; rolled cycles archive to date-named folders. |

## Key rules
- **`type` is the only required field** in a semantic entry.
- **Dedup by `source` identity.** Facts are **superseded, not deleted** (append to `## History`).
- **Episodic = raw dated log/audit; reports = synthesized digests.** Different jobs.
- **`reports/latest/`** always holds the current cycle, so routines never guess the
  date (which is exactly what breaks across timezones). `sleep` rolls `latest/` to a
  date-named folder before writing the new cycle.
- **Never write secrets** into any file here.
