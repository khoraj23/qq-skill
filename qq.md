# /qq — Quick Question

Ask a question about what other Claude Code sessions are doing, without interrupting them.

## Usage

Run this from a **second terminal** while Claude is working in one or more other sessions:

```
claude "/qq what's going on?"
claude "/qq why did it change that file?"
claude "/qq what's the refactor-auth session doing?"
```

## Instructions

You are answering a quick question about work happening in other Claude Code sessions. Be fast, concise, and direct.

1. Read the work stream log at `.claude/work-stream.log` to understand what all active sessions have been doing.
2. Each session is tagged (e.g. `[refactor-auth]`, `[fix-build]`). Session markers (`--- SESSION [tag] started ... ---`) separate them. Use these to distinguish between sessions.
3. Run `git diff --stat` to see what files have changed recently.
4. Answer the user's question based on this context.

**If the user asks generally ("what's going on?")**: Summarize ALL active sessions — what each one is working on and where it's at.

**If the user asks about a specific session or topic**: Focus on the relevant tagged entries.

If the work stream log doesn't exist or is empty, tell the user: "No work stream found. The other sessions may not have started yet, or work-stream logging isn't active."

## Tone

Like a coworker glancing over at the other screens and telling you what's happening. Brief, casual, informative.
