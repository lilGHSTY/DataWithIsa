# Research Methodology

This document outlines how to conduct effective research before implementing features.

## Research Process

### 1. Define the Problem
Before researching, clearly define:
- What feature are we building?
- What are the user requirements?
- What are the technical constraints?
- What security concerns exist?

### 2. Gather Documentation
For each technology/library/API:
- Official documentation (read thoroughly)
- Recent tutorials (2023+ preferred)
- Security best practices
- Common pitfalls and solutions
- Example implementations

### 3. Research Sources
Priority order:
1. Official documentation
2. MDN Web Docs (for web standards)
3. Python.org docs (for Python features)
4. Stack Overflow (recent answers only)
5. GitHub examples (check stars and recent updates)

### 4. Document Findings
Create a file in `research/[feature-name].md` with:
```markdown
# [Feature Name] Research

## Requirements
- What we need to build

## Key Findings
- Important discoveries
- Best practices
- Security considerations

## Implementation Approach
- Recommended solution
- Alternative options
- Reasons for choice

## Code Examples
- Relevant code snippets
- API usage examples

## References
- Links to documentation
- Useful tutorials
```

## Research Checklist

Before implementing any feature:
- [ ] Read official documentation (10+ pages if available)
- [ ] Check for recent breaking changes
- [ ] Understand security implications
- [ ] Find 3+ implementation examples
- [ ] Identify common errors and solutions
- [ ] Check browser/version compatibility
- [ ] Consider performance implications
- [ ] Look for existing libraries vs custom code

## Common Research Topics

### Form Handling
- CSRF protection
- Input validation patterns
- File upload security
- Multi-step forms

### Authentication
- Session management
- Password hashing
- Remember me functionality
- OAuth integration

### Database Operations
- Query optimization
- Connection pooling
- Migration strategies
- Backup procedures

### API Design
- RESTful principles
- Rate limiting
- Versioning strategies
- Documentation tools

### Frontend Interactivity
- Progressive enhancement
- Accessibility (ARIA)
- Performance optimization
- Cross-browser compatibility

## Red Flags in Research

Be cautious of:
- Outdated tutorials (pre-2022)
- Solutions requiring many dependencies
- Code without error handling
- Missing security considerations
- Overly complex solutions for simple problems

## When Research is Complete

You know you've researched enough when:
1. You understand the problem deeply
2. You can explain 2-3 solution approaches
3. You know the security implications
4. You have working code examples
5. You understand potential edge cases

Remember: 2 hours of research can save 10 hours of debugging!