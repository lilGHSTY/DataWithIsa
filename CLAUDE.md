# Claude Code Instructions

Welcome Claude Code! This file contains project-specific instructions for working on this codebase.

**⚠️ IMPORTANT: Before doing anything else, complete the "Session Startup Checklist" below to load all project context.**

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

**CRITICAL Setup Phase Workflow:**
1. **CHECK FIRST**: Always use LS to check if directories/files exist
2. **READ TEMPLATES**: Read all template files in templates/ directory
3. **COLLABORATE**: Work WITH the user, don't just fill out templates automatically
4. **COPY & ENHANCE**: Copy templates to docs/ and fill with user-confirmed content
5. **CONFIRM DECISIONS**: Get explicit approval before making major technical choices
6. **ITERATIVE**: Present sections for review rather than completing everything at once

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

## Setup Phase Checklist
When user runs `/setup start`, complete these in order:

### ENVIRONMENT SETUP (CRITICAL - Do First)
- [ ] **INSTALL DEPENDENCIES**: Activate venv and install latest versions from requirements.txt
- [ ] **VERIFY FLASK WORKS**: Test that `python app.py` starts successfully  
- [ ] **INSTALL PLAYWRIGHT MCP**: Run `claude mcp add playwright -- npx @playwright/mcp@latest`
- [ ] **TEST MCP**: Verify Playwright tools are available after restart

### PROJECT DISCOVERY  
- [ ] Check `.claude/modes/` and create SETUP.lock
- [ ] Read ANY existing drafts/ folder contents first
- [ ] Read ALL template files in templates/ directory
- [ ] Ask discovery questions about the project
- [ ] **COLLABORATE**: Present findings and ask for confirmation/improvements

### DOCUMENTATION CREATION
- [ ] Copy templates to docs/ and fill with agreed-upon content
- [ ] **COLLABORATE**: Review each major section before finalizing
- [ ] Create .claude/DECISIONS.md with technology choices (confirm with user)
- [ ] Create .claude/CONVENTIONS.md with coding standards
- [ ] Create docs/PROGRESS.md with roadmap and milestones
- [ ] **REWRITE README.md**: Replace template content with project-specific README

### FINAL VERIFICATION
- [ ] **TEST SERVER**: Verify localhost:5000 loads correctly
- [ ] **TEST PLAYWRIGHT**: Take screenshot of working site if MCP available
- [ ] **COMMIT CHANGES**: Create initial commit with all setup work
- [ ] Document specific widget/component types needed

## CRITICAL: Session Startup Checklist
**BEFORE doing ANYTHING else in any session, complete these steps:**

1. **Check Phase**: `LS .claude/modes/` to see if any phase locks exist
2. **Read Core Context** (in this exact order):
   - Read this CLAUDE.md file completely
   - Read .claude/DECISIONS.md (if exists)
   - Read .claude/CONVENTIONS.md (if exists)
3. **Read Project Documentation**:
   - Read docs/REQUIREMENTS.md (if exists) 
   - Read docs/ARCHITECTURE.md (if exists)
   - Read docs/PROGRESS.md (if exists)
4. **Check File Structure**: `LS` the project root to understand what exists
5. **Only then**: Begin responding to user request

**This ensures you have full context before making any decisions or suggestions.**

## Important Context Commands
When starting a session:
- ALWAYS follow the Session Startup Checklist above
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

## What Claude Code CAN Do (Don't Be Overly Cautious!)

### GitHub Integration
- ✅ **CREATE REPOS**: `gh repo create project-name --private --source=. --remote=origin --push`
- ✅ **COMMIT & PUSH**: Full git workflow including commits and pushes
- ✅ **MANAGE BRANCHES**: Create, switch, merge branches

### MCP Management  
- ✅ **INSTALL MCPs**: `claude mcp add playwright -- npx @playwright/mcp@latest`
- ✅ **VERIFY MCPs**: `claude mcp list` to check installation
- ⚠️ **REQUIRES RESTART**: User must restart Claude Code for new MCPs to work

### Environment Setup
- ✅ **INSTALL DEPENDENCIES**: Full pip install workflows with virtual environments
- ✅ **SYSTEM PACKAGES**: Can install system packages with apt/brew when needed
- ✅ **VERIFY INSTALLATIONS**: Test that installations work correctly

## Linux Distribution Handling

### Pop!_OS Specific Fixes
- Pop!_OS is Ubuntu-based but not recognized by some tools
- **Playwright**: Install Google Chrome manually before MCP installation
- **Package Installation**: Use `sudo apt` commands (works on Pop!_OS)

### Installation Sequence for Pop!_OS
1. Install Google Chrome: `sudo apt install google-chrome-stable`
2. Install Playwright MCP: `claude mcp add playwright`
3. Test functionality: Verify browser launches correctly

## Troubleshooting Common Setup Issues

### Dependencies Won't Install
1. Check virtual environment is activated: `which python`
2. Update pip: `pip install --upgrade pip`
3. Install dependencies one by one to isolate issues

### Playwright MCP Issues  
1. Linux: Install Google Chrome first: `sudo apt install google-chrome-stable`
2. Pop!_OS: Use manual Chrome installation before MCP
3. Restart Claude Code after MCP installation
4. Verify with: `claude mcp list`

### Flask Won't Start
1. Check for syntax errors in app.py
2. Verify all imports are available
3. Check port 5000 isn't already in use: `lsof -i :5000`

## Documentation Standards for Setup Phase

### README.md Requirements
- [ ] Project-specific title and description
- [ ] Accurate technology stack listing
- [ ] Working installation instructions
- [ ] Current project status and roadmap
- [ ] Contact information for project owner
- [ ] No template placeholders remaining

### Technical Documentation  
- [ ] REQUIREMENTS.md reflects actual user needs (not generic)
- [ ] ARCHITECTURE.md shows real technology choices made
- [ ] PROGRESS.md has realistic timeline and milestones

## Setup Success Validation

A successful setup phase should result in:
- [ ] **Working Application**: localhost:5000 loads project homepage  
- [ ] **Interactive Features**: Forms, calculators, navigation work
- [ ] **Professional Documentation**: All docs project-specific, no templates
- [ ] **Development Ready**: Other developers can clone and run immediately
- [ ] **Testing Capable**: Playwright MCP installed and functional
- [ ] **Version Controlled**: All work committed to appropriate repository

## Pre-Setup-Complete Verification
Before running `/setup complete`, verify:

- [ ] **Dependencies Installed**: `pip list` shows all required packages
- [ ] **Flask Starts**: `python app.py` runs without errors
- [ ] **Localhost Responds**: `curl http://localhost:5000` returns 200
- [ ] **Playwright Available**: Can take screenshot of localhost (if MCP installed)
- [ ] **README Updated**: No template content remains
- [ ] **Git Status Clean**: All changes committed

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