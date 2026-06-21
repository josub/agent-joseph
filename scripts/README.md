# scripts/

CLI entry for running the agent's routines. **Scheduling is optional** — by default
nothing runs on a timer; you invoke routines by hand until you wire a scheduler.

## `run-routine.sh`
```bash
scripts/run-routine.sh sleep
scripts/run-routine.sh morning-review
scripts/run-routine.sh start-work-session
```
It resolves the routine in `routines/active/<name>.md`, reads the skill it `runs:`,
sources `.env` if present, and invokes the `claude` CLI to perform that skill from the
repo root. (No `claude` on PATH? It tells you, and you can run the skill manually by
opening its `SKILL.md`.)

## The pause switch (emergency stop)
Create a `.paused` file at the repo root to halt **all** scheduled activity:
```bash
touch .paused      # stop everything
rm .paused         # resume
```
`run-routine.sh` checks for it first and exits immediately if present. `.paused` is
gitignored.

## Wiring a schedule (opt-in)

### cron (Linux/macOS)
`crontab -e`, then add lines with **absolute** paths:
```cron
0 23    * * *  /path/to/agent-brain/scripts/run-routine.sh sleep
0  8    * * *  /path/to/agent-brain/scripts/run-routine.sh morning-review
0 9-18/2 * * * /path/to/agent-brain/scripts/run-routine.sh start-work-session
```

### launchd (macOS) — sample `.plist`
Save as `~/Library/LaunchAgents/com.agent-brain.sleep.plist`, fix the paths, then
`launchctl load ~/Library/LaunchAgents/com.agent-brain.sleep.plist`:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>            <string>com.agent-brain.sleep</string>
  <key>ProgramArguments</key>
  <array>
    <string>/path/to/agent-brain/scripts/run-routine.sh</string>
    <string>sleep</string>
  </array>
  <key>StartCalendarInterval</key>
  <dict>
    <key>Hour</key>    <integer>23</integer>
    <key>Minute</key>  <integer>0</integer>
  </dict>
  <key>StandardOutPath</key>  <string>/tmp/agent-brain-sleep.log</string>
  <key>StandardErrorPath</key><string>/tmp/agent-brain-sleep.err</string>
</dict>
</plist>
```
Duplicate the file per routine (one Label each) to schedule `morning-review` and
`start-work-session`.

> Adjust routine times in `routines/active/*.md` to match whatever schedule you wire —
> the routine files are the source of truth for *when*; the scheduler just calls
> `run-routine.sh`.
