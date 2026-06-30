---
type: convention
title: Git identity on this machine
description: As of 2026-06-28 the machine-wide git identity is Joseph Alsberg <joseph.alsberg@gmail.com> (was previously unset, so repos fell back to a hostname email that doesn't attribute commits to the GitHub account). If the hostname identity reappears in a repo, it has a stale local override.
tags: [convention, git, identity, config]
source: 2026-06-28 contact-scanner work (PR #52 re-author incident)
created: 2026-06-29
updated: 2026-06-29
---

# Git identity on this machine

As of **2026-06-28** the machine-wide git identity is set:
```
git config --global user.name  = "Joseph Alsberg"
git config --global user.email = "joseph.alsberg@gmail.com"
```
So new repos inherit the right author. **Before this it was unset**, and repos without a
local identity (e.g. `contact-scanner`) committed as
`Joseph <joseph@Js-MacBook-Air-M5.local>`, which **doesn't attribute commits to the GitHub
account**. If the hostname identity ever reappears in a repo, it has a stale *local*
override; fix with `git config --local user.email "joseph.alsberg@gmail.com"`.

**Caveat:** `joseph.alsberg@gmail.com` only attributes on GitHub if it's a verified email on
the account (handle `josub`); otherwise use the GitHub `noreply` email. On 2026-06-28 a
`contact-scanner` doc commit (PR #52) was first made with the hostname identity and had to be
re-authored (`git commit --amend --reset-author`) + force-pushed before the global fix landed.

## Related
- [[bash-cwd-resets-use-explicit-repo-paths]]
- [[leadodex]]

## History
- 2026-06-29 — Page created by `sleep` from the 2026-06-28 working note.
