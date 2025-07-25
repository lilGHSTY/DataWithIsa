# Using Claude Code Effectively

Claude Code (CC) is your AI development partner. This guide explains how to work together effectively.

## Slash Commands

Slash commands give you explicit control over Claude Code's behavior:

### Core Commands

- **`/setup start`** - Begin the setup phase (discovery and planning)
- **`/setup complete`** - End setup and transition to development
- **`/research [topic]`** - Research specific technologies or approaches
- **`/context verify`** - Check what documentation CC has loaded

### Usage Examples

```
You: /setup start
CC: [Enters setup mode, asks about your project]

You: /research stripe integration flask
CC: [Researches and stores Stripe documentation]

You: /setup complete
CC: [Exits setup mode, ready to build]
```

## Project Phases

Claude Code adapts its behavior based on the current phase:

1. **Setup Phase** (SETUP.lock active)
   - Asks questions about your project
   - Creates documentation
   - Plans the implementation
   - NO coding happens here

2. **Development Phase** (no locks active)
   - Writes code
   - Implements features
   - Tests functionality
   - Normal development work

3. **Research Mode** (RESEARCH.lock active)
   - Finds official documentation
   - Stores context for later use
   - Analyzes best practices
   - Prepares for implementation

## Best Practices

### DO:
- Use `/setup start` for new projects
- Use `/research` before implementing new features
- Be specific about what you want
- Review CC's plans before implementation
- Ask for explanations if confused

### DON'T:
- Skip the setup phase
- Assume CC knows your business context
- Accept placeholder code
- Let CC add complex frameworks without asking

## Working with Hooks

Some tasks trigger automatically:
- File naming standardization
- Code formatting
- Git operations

You can also trigger hooks manually with slash commands when needed.

## Common Workflows

### Starting a New Feature
```
You: /research user authentication flask
You: I need to add user login to my site
CC: [Uses researched context to implement properly]
```

### Reviewing Documentation
```
You: /context verify
CC: [Shows loaded documentation and context]
```

### Fixing Issues
```
You: The login form isn't working
CC: [Debugs using project context and conventions]
```

## Tips for Success

1. **Start Simple**: Don't over-engineer from the beginning
2. **Use Setup Phase**: Proper planning prevents poor implementation
3. **Research First**: Use `/research` for unfamiliar technologies
4. **Stay in Control**: You make the decisions, CC implements them
5. **Document Decisions**: Update DECISIONS.md as you go

## Understanding CC's Responses

- **Tool Use**: When CC uses tools, it's working on your project
- **Questions**: CC asks to understand your needs better
- **Suggestions**: CC offers options but you decide
- **Explanations**: CC explains complex changes

---

Remember: Claude Code is a powerful assistant, but you're the architect of your project!