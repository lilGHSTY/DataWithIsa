# Development Conventions

## Core Principles
1. **Research First** - Always research before implementing
2. **Ask, Don't Assume** - Check DECISIONS.md, then ask user
3. **Start Simple** - Begin with basic implementation, enhance iteratively
4. **Document Everything** - Update docs as you work

## Research Requirements
Before implementing any feature:
- Research 10+ pages of official documentation
- Use web search for current best practices (2024+)
- Check for security considerations
- Document findings in research/ folder
- Look for existing solutions before building custom

## Code Standards

### General
- Production-ready code only (no placeholders)
- No hardcoded test data or fake responses
- All code must handle errors gracefully
- Security first - validate all inputs
- Keep files under 500 lines when possible

### Frontend (HTML/CSS/JS)
- Semantic HTML5 elements
- Mobile-first responsive design
- CSS organized with utility classes
- Vanilla JavaScript (no framework until requested)
- Form validation both client and server side

### Backend (Python/Flask)
- Follow PEP 8 style guide
- Type hints where helpful
- Docstrings for complex functions
- RESTful API design
- Always use parameterized queries (no SQL injection)

## File Organization
```
src/
├── app.py              # Main Flask application
├── routes/             # Route blueprints
├── models/             # Database models
├── static/             # CSS, JS, images
├── templates/          # HTML templates
└── utils/              # Helper functions
```

## Decision Protocol
1. Check DECISIONS.md for existing choices
2. If not documented, ask user with clear options
3. Document decision immediately in DECISIONS.md
4. Follow documented decisions consistently

## Testing Approach
- Manual testing first
- Test critical paths (login, data submission)
- Document test scenarios in tests/README.md
- Add automated tests when patterns emerge

## Security Checklist
- [ ] Environment variables for all secrets
- [ ] Input validation on all forms
- [ ] CSRF protection enabled
- [ ] SQL injection prevention (ORM/parameterized queries)
- [ ] XSS prevention (escape output)
- [ ] Authentication required for sensitive routes
- [ ] HTTPS only in production

## Git Workflow
- Commit messages: "Add/Update/Fix/Remove [what] [why if needed]"
- Feature branches: feature/dashboard-charts
- Small, focused commits
- Never commit: .env, *.pyc, __pycache__, venv/

## Performance Guidelines
- Page load under 3 seconds
- Optimize images before upload
- Lazy load when appropriate
- Cache static assets
- Database queries should use indexes

## When Stuck
1. Re-read the error message carefully
2. Check the research/ folder for docs
3. Search for the specific error
4. Ask user for guidance with clear options
5. Document the solution for future reference