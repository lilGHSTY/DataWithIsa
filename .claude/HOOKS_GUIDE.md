# Hooks Guide

## What Are Hooks?

Hooks are automated commands that run when Claude Code performs certain actions. They work **automatically in the background** - you don't need to do anything once they're set up.

## How Claude Code Uses Hooks

**Important**: Claude Code runs these hooks **automatically** without asking you. They trigger based on Claude's actions, not yours. Think of them as "watchers" that spring into action when Claude does specific things.

## Our Default Hooks Explained

### 1. Auto-format Python Files (PostToolUse)
**When it runs**: After Claude edits any Python file
**What it does**: Automatically formats the code to follow Python standards
**Why useful**: Ensures consistent code style without you or Claude thinking about it
**Example**: If Claude writes messy Python code, it gets cleaned up automatically

### 2. Log Research Activities (PostToolUse)
**When it runs**: After Claude searches the web or fetches a webpage
**What it does**: Creates a log entry in `research/research-log.md`
**Why useful**: You can see all research Claude did, even across sessions
**Example**: 
```
[2024-01-10 14:23:45] Researched: https://flask.palletsprojects.com/
[2024-01-10 14:24:12] Researched: flask authentication best practices
```

### 3. Track File Modifications (PostToolUse)
**When it runs**: After Claude creates or modifies any file
**What it does**: Adds an entry to `docs/PROGRESS.md`
**Why useful**: Automatic development log without manual updates
**Example**:
```
- [2024-01-10] Modified: src/app.py
- [2024-01-10] Modified: src/templates/login.html
```

### 4. Prevent Accidental Secret Commits (PreToolUse)
**When it runs**: BEFORE Claude writes to any file
**What it does**: Scans for API keys, passwords, or secrets and BLOCKS the write
**Why useful**: Prevents accidentally exposing sensitive data
**Example**: If Claude tries to write `OPENAI_KEY="sk-abc123..."`, it gets blocked

### 5. Protect Critical Files (PreToolUse)
**When it runs**: BEFORE Claude modifies .env or hooks.json
**What it does**: Blocks the modification entirely
**Why useful**: Prevents Claude from accidentally breaking your configuration
**Example**: Claude can read .env but cannot modify it

### 6. Session Summary (Stop)
**When it runs**: When you end your Claude Code session
**What it does**: Adds a timestamp to mark the session end
**Why useful**: Clear session boundaries in your progress log

## When Would You Use Them?

You benefit from hooks when:

1. **You forget to format code** - Hook does it automatically
2. **You want audit trails** - Hooks create logs without asking
3. **You need security** - Hooks block dangerous actions
4. **You want automation** - Hooks run tasks you'd otherwise forget

## How to Enable/Disable

**To use hooks**: They're already configured! Just work normally with Claude Code.

**To disable all hooks**: Delete or rename `.claude/hooks.json`

**To disable specific hooks**: Remove that section from hooks.json

**To test if hooks are working**: 
1. Ask Claude to create a Python file with messy formatting
2. Check if it gets auto-formatted
3. Check if docs/PROGRESS.md gets updated

## Common Questions

**Q: Do I need to install anything?**
A: The hooks use standard Unix commands. Python formatting requires autopep8 (installed by setup.sh).

**Q: Will hooks slow down Claude Code?**
A: No, they run in milliseconds and don't block Claude's thinking.

**Q: Can I add my own hooks?**
A: Yes! Add new entries to hooks.json following the same pattern.

**Q: What if a hook fails?**
A: PostToolUse hooks fail silently. PreToolUse hooks can block actions if they return exit code 1.

## Hook Safety

Our hooks are designed to be safe:
- They only affect your project files
- They can't access system files
- They use careful pattern matching
- They fail gracefully if commands don't exist

Remember: Hooks run with your permissions, so only add hooks you understand!