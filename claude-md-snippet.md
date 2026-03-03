# CLAUDE.md additions for /qq

Add the following to your project's `CLAUDE.md` to enable work-stream logging.

## 1. Add to your Workflow section

```
- Use `/qq` from a second terminal to ask what's happening without interrupting work
```

## 2. Add this section to CLAUDE.md

```markdown
## Work Stream Logging

As you work, append brief status lines to `.claude/work-stream.log` so that a separate `/qq` session can answer questions about what's happening without interrupting you.

**When to log**: After every 2-3 tool calls or whenever you start a new logical step.

**Format**: One line per entry. Timestamp, session tag, what you just did or are about to do.

[HH:MM:SS][refactor-auth] Finished reading auth module (src/auth/token.ts). About to refactor refresh logic.
[HH:MM:SS][refactor-auth] Step 3/6: Writing tests for async token refresh.
[HH:MM:SS][fix-mobile-bug] Reading crash logs. Looks like stale token issue.

**How to log**: Use bash append. Keep it to one line. Don't overthink it.

printf '[%s][your-tag] Your status line here.\n' "$(date +%H:%M:%S)" >> .claude/work-stream.log

**At session start**: Append a session marker — do NOT clear the log (other sessions may be writing to it).

printf '\n--- SESSION [your-tag] started %s ---\n' "$(date '+%Y-%m-%d %H:%M:%S')" >> .claude/work-stream.log

Pick a short, descriptive tag based on what the user asked you to do (e.g., `refactor-auth`, `fix-build`, `add-dark-mode`). Use the same tag for all entries in that session.
```

## 3. Add to .gitignore

```
.claude/work-stream.log
```
