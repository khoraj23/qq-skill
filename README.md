# /qq — Quick Question for Claude Code

Ask what your other Claude Code sessions are doing without interrupting them.

```
claude "/qq what's going on?"
claude "/qq why did it change that file?"
claude "/qq what's the refactor-auth session doing?"
```

## How it works

1. Your working sessions write brief status lines to `.claude/work-stream.log`
2. `/qq` reads that log (plus `git diff --stat`) and answers your question
3. Runs in a separate terminal — no interruption to the working session

## Install

Clone this repo, `cd` into your project, and run:

```bash
/path/to/qq-skill/install.sh
```

This will:
- Copy the `/qq` command to `.claude/commands/`
- Add work-stream logging instructions to `.claude/CLAUDE.md`
- Add `.claude/work-stream.log` to `.gitignore`

Safe to re-run — it won't duplicate anything.

## Use it

In a second terminal, while Claude is working:

```bash
claude "/qq what's happening?"
```

## Files

| File | Purpose |
|------|---------|
| `qq.md` | The `/qq` slash command |
| `CLAUDE.md.snippet` | Work-stream logging instructions (appended to your CLAUDE.md by the installer) |
| `install.sh` | One-command installer |
