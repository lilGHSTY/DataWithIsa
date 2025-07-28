# Claude Code Configuration

This directory contains Claude Code specific configuration and state management.

## Directory Structure

- `modes/` - Phase lock files (SETUP.lock, RESEARCH.lock, etc.)
- `commands/` - Custom slash command definitions
- `templates/` - Template files for progressive documentation

## Important Notes

- Lock files in `modes/` control Claude Code's behavior
- Never manually create lock files - use slash commands
- All files here are project-specific and should be committed to git

## Phase Management

Phases are controlled by lock files:
- `/setup start` creates `modes/SETUP.lock`
- `/setup complete` removes `modes/SETUP.lock`
- `/research [topic]` creates temporary `modes/RESEARCH.lock`