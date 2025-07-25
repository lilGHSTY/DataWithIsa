# /context Command

Manages and verifies loaded documentation context.

## Usage

```
/context verify
```

## Actions

Shows:
1. Currently loaded documentation
2. Research files available
3. Project-specific context
4. Active conventions and decisions

## Example Output

```
User: /context verify

CC: Current Context Loaded:

📚 Project Documentation:
- docs/REQUIREMENTS.md (last updated: 2024-01-25)
- .claude/DECISIONS.md (Django → Flask, PostgreSQL chosen)
- CLAUDE.md (E-commerce project context)

🔍 Research Context:
- research/20240125_flask-login/ (Authentication patterns)
- research/20240124_stripe-python/ (Payment integration)

📋 Active Conventions:
- Python: PEP 8, type hints encouraged
- Git: Conventional commits
- Security: Input validation required

🔧 Current Phase: Development (no locks active)
```

## Additional Commands (Future)

### Load specific context
```
/context load research/20240125_flask-login/
```

### Clear context cache
```
/context clear
```

### Refresh project docs
```
/context refresh
```

## Why Context Matters

Good context ensures Claude Code:
- Uses official patterns
- Follows project conventions
- Remembers previous decisions
- Implements consistently
- Avoids contradictions

## Context Sources

1. **Project Files**
   - CLAUDE.md
   - docs/* 
   - .claude/*

2. **Research Files**
   - research/*/
   - Timestamped folders
   - Official documentation

3. **Templates**
   - .claude/templates/
   - Progressive disclosure
   - Best practices

## Best Practices

1. Verify context before major implementations
2. Research new technologies before using
3. Keep documentation updated
4. Use consistent patterns