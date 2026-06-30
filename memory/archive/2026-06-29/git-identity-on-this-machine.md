---
name: git-identity-on-this-machine
description: Global git identity is now Joseph Alsberg <joseph.alsberg@gmail.com>; was previously unset (commits fell back to a hostname email).
metadata:
  type: convention
---

As of **2026-06-28** the machine-wide git identity is set:
```
git config --global user.name  = "Joseph Alsberg"
git config --global user.email = "joseph.alsberg@gmail.com"
```
So new repos inherit the right author. **Before this it was unset**, and repos without a
local identity (e.g. `contact-scanner`) committed as `Joseph <joseph@Js-MacBook-Air-M5.local>`,
which **doesn't attribute commits to the GitHub account**. If you ever see that hostname
identity reappear in a repo, it has a stale *local* override — fix with
`git config --local user.email "joseph.alsberg@gmail.com"`.

Caveat: `joseph.alsberg@gmail.com` only attributes on GitHub if it's a verified email on the
account (handle `josub`); otherwise use the GitHub `noreply` email. On 2026-06-28 a
`contact-scanner` doc commit (PR #52) was first made with the hostname identity and had to be
re-authored (`git commit --amend --reset-author`) + force-pushed before the global fix landed.
Relates to [[contact-scanner-issues-lag-code]] and [[bash-cwd-resets-use-explicit-repo-paths]].
