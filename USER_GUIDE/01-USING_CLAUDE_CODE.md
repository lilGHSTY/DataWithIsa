# Using Claude Code

## Slash Commands

Control Claude Code's behavior with these commands:

- **`/setup start`** - Begin project discovery
- **`/setup complete`** - Start building
- **`/research [topic]`** - Gather official documentation
- **`/context verify`** - Check loaded context

## Project Phases

**Setup Phase**: Planning and documentation (no coding)
**Development Phase**: Building features (normal work)  
**Research Mode**: Gathering technical context

## Best Practices

**DO:**
- Use `/setup start` for new projects  
- Use `/research` before new features
- Be specific about requirements
- Stay in control of decisions

**DON'T:**
- Skip the setup phase
- Accept placeholder code
- Let CC add complex frameworks without asking

## Common Workflows

**Starting any session:**
```
"Please read CLAUDE.md and follow the Session Startup Checklist before we begin."
[This ensures CC loads all project context first]
```

**New Feature:**
```
/research user authentication flask
[Tell CC what you need]
```

**Debugging:**
```
"The login form isn't working"
[CC debugs using project context]
```

**Check Context:**
```
/context verify
[See what CC knows about your project]
```