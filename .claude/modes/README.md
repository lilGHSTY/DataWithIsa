# Phase Lock Files

This directory contains lock files that control Claude Code's behavior.

## Lock Files

- `SETUP.lock` - Setup phase active (planning only, no coding)
- `RESEARCH.lock` - Research mode active (gathering documentation)
- `DEPLOY.lock` - Deployment phase active (future feature)

## Important

- These files are created/removed by slash commands only
- Never manually create or delete lock files
- Presence of a lock file changes Claude Code's behavior
- Only one phase can be active at a time

## Commands

- `/setup start` - Creates SETUP.lock
- `/setup complete` - Removes SETUP.lock
- `/research [topic]` - Creates temporary RESEARCH.lock