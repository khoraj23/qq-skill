# /qq — Quick Question for Claude Code

Ask what other Claude Code sessions are doing without interrupting them.

## The Problem

When Claude Code is running a long task, there's no way to ask "what's going on?" without interrupting the generation. You either watch passively or break its flow.

## How /qq Works

1. **Work-stream logging**: Your CLAUDE.md instructs Claude to append brief status lines to `.claude/work-stream.log` as it works — automatically, every few steps.

2. **`/qq` command**: From a second terminal, ask a question. The `/qq` skill reads the log, checks recent git changes, and gives you a quick answer.

```
# Terminal 2 (while Claude works in Terminal 1)
claude "/qq what's going on?"
claude "/qq why did it change that file?"
claude "/qq what's the refactor-auth session doing?"
```

3. **Multi-session aware**: Each Claude session tags its log entries (e.g. `[refactor-auth]`, `[fix-build]`). If you have 3 terminals working, `/qq what's going on?` summarizes all of them.

## Install

```bash
git clone https://github.com/khoraj23/qq-skill.git
cd qq-skill
./install.sh /path/to/your/project
```

Then add the work-stream logging instructions to your `CLAUDE.md` — see `claude-md-snippet.md` for the exact text.

## How It Looks

The work-stream log:
```
--- SESSION [refactor-auth] started 2026-03-03 08:15:00 ---
[08:15:02][refactor-auth] Reading auth module. 4 files to review.
[08:15:18][refactor-auth] Step 1/3: Extracting token refresh into separate module.
[08:15:35][refactor-auth] Step 2/3: Writing tests for new refresh logic.

--- SESSION [fix-mobile-bug] started 2026-03-03 08:20:00 ---
[08:20:05][fix-mobile-bug] Reading crash logs. Looks like stale token issue.
[08:20:22][fix-mobile-bug] Found root cause — token manager not handling expiry.
```

You ask: `claude "/qq what's going on?"`

Response: "Two sessions active. refactor-auth is on step 2/3, writing tests for the token refresh extraction. fix-mobile-bug found the crash root cause — stale token expiry handling — and is working on a fix."

## Limitations

- Requires a second terminal — you can't type `/qq` in the same terminal while Claude is generating (that's a Claude Code platform limitation, not a skill limitation)
- The log is a summary, not the full conversation. The "TA" knows what the "professor" wrote on the board, but not everything they said.
- Adds minor overhead — a one-line bash append every few steps.

## Feature Request

We filed [anthropics/claude-code#30389](https://github.com/anthropics/claude-code/issues/30389) for a native `Ctrl+Q` implementation that would work in the same terminal without interrupting generation.
