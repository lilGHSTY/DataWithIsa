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

### 2. Intelligent Research Capture (PostToolUse)
**When it runs**: After Claude fetches documentation from the web
**What it does**: 
- Logs all web research in `research/logs/research-log.md`
- **Smart filtering**: Only captures official docs/guides/tutorials
- **Auto-organizes**: Saves to `research/[technology]/docs.md` by technology
- **No duplicates**: Skips URLs already researched

**Why useful**: Claude builds a knowledge base about your tech stack automatically
**Example**: 
```
# Claude researches Flask authentication
https://flask.palletsprojects.com/en/3.0.x/tutorial/auth/
↓ Automatically saved to:
research/flask/docs.md
```

**Technologies detected**: flask, django, python, javascript, react, vue, postgresql, mysql, stripe, aws, docker, nginx, and more

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

### 5. Research Activity Logging (PostToolUse)
**When it runs**: After Claude performs web searches
**What it does**: Logs search queries in `research/logs/research-log.md`
**Why useful**: Track what Claude searched for, helps understand context gathering
**Example**: 
```
[2024-01-10 14:24:12] Search: flask authentication best practices
```

### 6. Auto-Update Documentation Index (PostToolUse)
**When it runs**: After Claude creates new documentation files
**What it does**: Automatically adds new docs to `docs/README.md` index
**Why useful**: Keeps documentation organized without manual updates
**Example**: Creating `docs/DEPLOYMENT.md` automatically adds it to the docs index

### 7. Protect Critical Files (PreToolUse)
**When it runs**: BEFORE Claude modifies .env or hooks.json
**What it does**: Blocks the modification entirely
**Why useful**: Prevents Claude from accidentally breaking your configuration
**Example**: Claude can read .env but cannot modify it

### 8. Setup Guidance (PreToolUse)
**When it runs**: BEFORE Claude writes Python code
**What it does**: Checks if project setup is complete, reminds to finish setup if needed
**Why useful**: Prevents coding before proper project configuration
**Example**: Shows "Consider completing project setup first" if requirements aren't filled out

### 9. Session Summary (Stop)
**When it runs**: When you end your Claude Code session
**What it does**: Adds a timestamp to mark the session end in `docs/PROGRESS.md`
**Why useful**: Clear separation between different work sessions
**Example**: 
```
=== Session ended at 2024-01-10 16:30:15 ===
```

### 10. Research Summary (Stop)
**When it runs**: When you end your Claude Code session
**What it does**: Adds recent research to the session summary
**Why useful**: See what was researched during each session
**Example**: 
```
## Recent Research
[2024-01-10 16:25:12] https://flask.palletsprojects.com/auth/
[2024-01-10 16:28:45] Search: PostgreSQL indexing best practices
```
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