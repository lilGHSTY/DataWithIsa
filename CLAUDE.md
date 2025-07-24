# Claude Code Instructions

Welcome Claude Code! This file contains project-specific instructions for working on this codebase.

## Quick Start

### For New Projects:
If this is a fresh skeleton, read `.claude/SETUP_GUIDE.md` and help the user through setup.

### For Existing Projects:
1. Read `.claude/CONVENTIONS.md` for development standards
2. Check `.claude/DECISIONS.md` for technical choices
3. Review `docs/REQUIREMENTS.md` for what we're building
4. Follow `.claude/RESEARCH.md` methodology before implementing

## Project Overview
This is a web application project using:
- Frontend: HTML/CSS/JavaScript (vanilla)
- Backend: Python Flask
- Database: SQLite (development) → PostgreSQL (production)
- Hosting: Local → Digital Ocean (when ready)

## IMPORTANT: Technology Stack Rules
**DO NOT change the core stack without explicit user approval:**
- ❌ NO React/Vue/Angular unless user specifically requests
- ❌ NO Django/FastAPI - stick with Flask
- ❌ NO MongoDB/Firebase - use SQLite/PostgreSQL
- ❌ NO complex build tools - vanilla JS only
- ✅ You MAY add Flask extensions (Flask-Login, Flask-SQLAlchemy, etc.)
- ✅ You MAY add necessary libraries (Stripe, SendGrid, etc.)
- ✅ You MAY use modern CSS (Grid, Flexbox, CSS Variables)

## Your Primary Responsibilities
1. **Research First**: Always research thoroughly before implementing
2. **Ask for Decisions**: If something isn't in DECISIONS.md, ask the user
3. **Write Production Code**: No placeholders or mock data
4. **Maintain Documentation**: Update docs as you work
5. **Security Focus**: Validate inputs, prevent injections, use HTTPS

## Current Project State
- [ ] Initial setup
- [ ] Basic file structure
- [ ] Environment configuration
- [ ] Database schema
- [ ] User authentication
- [ ] Core features
- [ ] Testing
- [ ] Deployment

## Important Context Commands
When starting a session:
- Run the setup script if environment isn't ready
- Check for any new requirements in docs/
- Review recent commits for context
- Update this checklist as you complete tasks

## Common Tasks

### Starting the Development Server
```bash
cd src
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
python app.py
```

### Adding a New Feature
1. Research the requirement thoroughly
2. Update docs/ARCHITECTURE.md if needed
3. Implement in a feature branch
4. Test manually
5. Update docs/PROGRESS.md

### Database Changes
1. Make changes in a new migration file
2. Test migration up and down
3. Document schema changes
4. Never modify existing migration files

## Things to Remember
- The user wants to maintain control of all decisions
- Start simple and enhance iteratively
- Documentation is as important as code
- Security cannot be an afterthought
- Performance targets: <3s page load, <500ms API

## When You're Stuck
1. Re-read the error carefully
2. Check the research/ folder
3. Ask the user with clear options
4. Document the solution

## Do NOT
- Use complex frameworks without user approval
- Add dependencies without clear benefit
- Write placeholder code
- Assume library availability
- Make architecture decisions without consulting DECISIONS.md
- Commit secrets or .env files
- Create unnecessary abstraction layers

## Project-Specific Notes
[This section will be updated with project-specific requirements and gotchas as they arise]