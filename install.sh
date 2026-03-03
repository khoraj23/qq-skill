#!/bin/bash
set -e

# /qq skill installer
# Installs the /qq slash command and adds work-stream logging to CLAUDE.md

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$(pwd)"

# Ensure .claude/commands exists
mkdir -p "$TARGET_DIR/.claude/commands"

# Copy the slash command
cp "$SCRIPT_DIR/qq.md" "$TARGET_DIR/.claude/commands/qq.md"
echo "Installed /qq command to .claude/commands/qq.md"

# Add work-stream logging to CLAUDE.md if not already present
CLAUDE_MD="$TARGET_DIR/.claude/CLAUDE.md"

if [ -f "$CLAUDE_MD" ] && grep -q "Work Stream Logging" "$CLAUDE_MD"; then
  echo "Work-stream logging already in CLAUDE.md — skipping."
else
  # Create CLAUDE.md if it doesn't exist
  if [ ! -f "$CLAUDE_MD" ]; then
    mkdir -p "$TARGET_DIR/.claude"
    touch "$CLAUDE_MD"
    echo "Created .claude/CLAUDE.md"
  fi

  printf '\n' >> "$CLAUDE_MD"
  cat "$SCRIPT_DIR/CLAUDE.md.snippet" >> "$CLAUDE_MD"
  echo "Added work-stream logging instructions to CLAUDE.md"
fi

# Add work-stream log to gitignore if git repo
if [ -d "$TARGET_DIR/.git" ]; then
  GITIGNORE="$TARGET_DIR/.gitignore"
  if [ ! -f "$GITIGNORE" ] || ! grep -q "work-stream.log" "$GITIGNORE"; then
    echo ".claude/work-stream.log" >> "$GITIGNORE"
    echo "Added .claude/work-stream.log to .gitignore"
  fi
fi

echo ""
echo "Done! Run 'claude \"/qq what's happening?\"' from a second terminal while Claude is working."
