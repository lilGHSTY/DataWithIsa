# Custom Slash Commands

This directory can contain custom slash command definitions for your project.

## Creating Custom Commands

Create markdown files with your command definitions:

```markdown
# /mycommand

This command does something specific to my project.

## Steps
1. First do this
2. Then do that
3. Finally do this
```

## Example Commands You Might Create

- `/deploy` - Custom deployment workflow
- `/backup` - Database backup procedure
- `/test-all` - Run comprehensive test suite
- `/client-setup` - Onboard a new client

## Usage

Custom commands are invoked the same way as built-in commands:
```
/mycommand argument1 argument2
```

## Note

This feature may require Claude Code updates to fully support custom commands.