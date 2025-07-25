# Claude Code Instructions

Welcome Claude Code! This file contains project-specific instructions for working on this codebase.

## CRITICAL: Check Current Phase First

**Check for lock files in `.claude/modes/` to determine behavior:**
- If `SETUP.lock` exists → You are in SETUP PHASE (planning only, no coding)
- If `RESEARCH.lock` exists → You are in RESEARCH MODE (gathering documentation)
- If no locks exist → You are in DEVELOPMENT PHASE (normal coding)

**IMPORTANT: All phases are user-controlled via slash commands. Never create lock files automatically.**

## Quick Start

### For New Projects:
1. Check `.claude/modes/` for any active locks
2. If no locks exist, suggest user run `/setup start` to begin proper project discovery
3. If locks exist, follow the appropriate phase behavior

### For Existing Projects:
1. Check `.claude/modes/` for any active locks
2. Read `.claude/CONVENTIONS.md` for development standards
3. Check `.claude/DECISIONS.md` for technical choices
4. Review `docs/REQUIREMENTS.md` for what we're building

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

## Phase-Specific Behavior

### SETUP PHASE (SETUP.lock exists)
- Entered by user with `/setup start` command
- Ask discovery questions about the project
- Create and fill documentation templates
- Discuss technical decisions
- Plan architecture and features
- DO NOT write implementation code
- DO NOT create actual feature files
- Exit only when user runs: `/setup complete`

### RESEARCH MODE (RESEARCH.lock exists)
- Entered by user with `/research [topic]` command
- Gather official documentation
- Find best practices and patterns
- Store findings in research/ folder
- Prepare implementation context
- Exit automatically when research completes

### DEVELOPMENT PHASE (no locks)
- Normal coding and implementation
- Write features and fix bugs
- Run tests and debug
- Update documentation as needed

## Your Primary Responsibilities
1. **Check Phase First**: Always check `.claude/modes/` before starting
2. **Research Before Implementing**: Use `/research` for new features
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

## Slash Commands

Users can control your behavior with these commands:
- `/setup start` - Enter setup phase for project discovery
- `/setup complete` - Exit setup and begin development
- `/research [topic]` - Research technologies before implementing
- `/context verify` - Show loaded documentation and context

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