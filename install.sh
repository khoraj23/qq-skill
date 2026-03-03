#!/bin/bash
# Install /qq skill into a Claude Code project
#
# Usage: ./install.sh [project-path]
# Defaults to current directory if no path provided.

set -e

PROJECT="${1:-.}"
COMMANDS_DIR="$PROJECT/.claude/commands"
CLAUDE_MD="$PROJECT/.claude/CLAUDE.md"

# Copy skill
mkdir -p "$COMMANDS_DIR"
cp "$(dirname "$0")/qq.md" "$COMMANDS_DIR/qq.md"
echo "Installed /qq skill to $COMMANDS_DIR/qq.md"

# Add work-stream.log to gitignore if git repo
if [ -d "$PROJECT/.git" ]; then
  GITIGNORE="$PROJECT/.gitignore"
  if ! grep -q "work-stream.log" "$GITIGNORE" 2>/dev/null; then
    echo ".claude/work-stream.log" >> "$GITIGNORE"
    echo "Added .claude/work-stream.log to .gitignore"
  fi
fi

echo ""
echo "Done! Next step: add the work-stream logging instructions to your CLAUDE.md."
echo "See claude-md-snippet.md for the exact text to add."
