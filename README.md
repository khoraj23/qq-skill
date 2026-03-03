# /qq — Quick Question for Claude Code

**"Hey, what's Claude doing right now?"**

When you have Claude Code working in one terminal, open a second terminal and ask:

```bash
claude "/qq what's going on?"
```

You get a quick, casual answer — like glancing over at a coworker's screen:

```
Two sessions active:

1. refactor-auth — Halfway through rewriting the token refresh logic.
   Just finished writing tests, about to update the middleware.

2. fix-build — Fixed 3 of 5 type errors. Working on the remaining two
   in src/api/client.ts.

No uncommitted file changes yet.
```

No interruption to the working session. No context switching. Just a quick status check.

## Why

Claude Code sessions can run for a while. Sometimes you just want to know what's happening without breaking its flow. `/qq` gives you a read-only window into all active sessions.

## Install

Clone this repo, then `cd` into the project where you use Claude Code and run the installer:

```bash
git clone https://github.com/khoraj23/qq-skill.git
cd your-project
/path/to/qq-skill/install.sh
```

The installer does three things:
1. Copies the `/qq` slash command to `.claude/commands/`
2. Adds work-stream logging instructions to `.claude/CLAUDE.md` (so working sessions know to write status updates)
3. Adds `.claude/work-stream.log` to `.gitignore`

Safe to re-run — won't duplicate anything.

## How it works

Two pieces:

**Work-stream logging** (added to your CLAUDE.md) tells Claude to write brief status lines as it works:

```
[14:32:05][refactor-auth] Finished reading auth module. About to rewrite refresh logic.
[14:33:12][refactor-auth] Step 3/6: Writing tests for async token refresh.
[14:35:01][fix-build] Build failed — 2 type errors in client.ts. Fixing now.
```

**The `/qq` command** reads that log, checks `git diff --stat`, and gives you a plain-English summary.

Multiple sessions can write to the same log simultaneously — each tags its entries so `/qq` can distinguish them.

## Examples

```bash
# General status check
claude "/qq what's going on?"

# Ask about specific work
claude "/qq what's the refactor-auth session doing?"

# Ask about changes
claude "/qq why did it change that file?"

# Keep it casual
claude "/qq yo"
```

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) CLI
