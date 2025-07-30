# Project Skeleton Improvements

**Based on DataWithIsa Development Session - July 28, 2025**

This document outlines all the improvements that should be made to the project skeleton based on lessons learned during the DataWithIsa project development.

## 1. Naming & Clarity

### Issue
- "Project Skeleton" creates confusion with actual project bones/structure
- Users aren't sure if they're working on skeleton vs real project

### Solution
- **Rename to "Project-Template"** 
- Update all documentation references
- Make it clear this is a starting template, not ongoing skeleton

## 2. Bootstrap Script Dependency Strategy

### Current Issue
- Bootstrap tries to install basic dependencies but can't get latest versions
- Creates confusion about when dependencies are installed

### Solution  
- **Bootstrap should NOT install Python dependencies**
- Bootstrap creates virtual environment only
- Bootstrap creates requirements.txt template with comments
- Claude Code installs actual dependencies during setup phase with latest versions

### Updated Bootstrap Behavior
```bash
# Create venv but don't install anything
python3 -m venv venv
echo "✓ Virtual environment created"

# Create requirements template (no actual installs)
cat > requirements.txt << 'EOF'
# Core dependencies - Claude Code will install during setup
# Flask>=2.3.0
# python-dotenv>=1.0.0
# etc.
EOF
```

## 3. Setup Phase Enhancement

### Current Issues
- Setup phase doesn't verify working environment
- No dependency installation during setup
- No MCP installation
- No verification that server works
- README remains generic template

### Required Setup Phase Workflow

**Updated CLAUDE.md Setup Checklist:**
```markdown
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
```

## 4. Claude Code Capabilities Documentation

### Issue Discovered
- Claude Code was overly cautious about capabilities
- Incorrectly stated couldn't create GitHub repos (but successfully did)
- Unclear about MCP installation abilities

### Solutions

**Update CLAUDE.md with accurate capabilities:**
```markdown
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
```

## 5. Linux Distribution Support

### Issue Discovered  
- Playwright installation fails on Pop!_OS (not recognized as Ubuntu-based)
- Error: "cannot install on pop distribution - only Ubuntu and Debian are supported"

### Solutions

**Enhanced Linux Support in Setup:**
```markdown
## Linux Distribution Handling

### Pop!_OS Specific Fixes
- Pop!_OS is Ubuntu-based but not recognized by some tools
- **Playwright**: Install Google Chrome manually before MCP installation
- **Package Installation**: Use `sudo apt` commands (works on Pop!_OS)

### Installation Sequence for Pop!_OS
1. Install Google Chrome: `sudo apt install google-chrome-stable`
2. Install Playwright MCP: `claude mcp add playwright`
3. Test functionality: Verify browser launches correctly
```

## 6. Requirements.txt Strategy

### Current Issue
- Template requirements.txt has comments and examples
- No clear distinction between core vs project-specific deps

### Solution

**Two-Tier Requirements System:**

**requirements-core.txt** (for reference):
```
# Minimal working Flask app
Flask>=2.3.0,<3.0.0
python-dotenv>=1.0.0
Werkzeug>=2.3.0,<3.0.0
```

**requirements.txt** (Claude fills during setup):
```
# Core Flask dependencies - INSTALLED BY CLAUDE DURING SETUP
Flask==2.3.3
python-dotenv==1.0.0
Werkzeug==2.3.7

# Project-specific dependencies added by Claude based on project needs:
# Database: SQLAlchemy==2.0.21, Flask-SQLAlchemy==3.0.5
# Auth: Flask-WTF==1.1.1
# APIs: requests==2.31.0
# etc.
```

## 7. Verification & Testing Integration

### Missing Capabilities
- No verification that setup actually works
- No testing of interactive features
- No validation of user workflows

### Required Additions

**Verification Checklist for Setup Complete:**
```markdown
## Pre-Setup-Complete Verification
Before running `/setup complete`, verify:

- [ ] **Dependencies Installed**: `pip list` shows all required packages
- [ ] **Flask Starts**: `python app.py` runs without errors
- [ ] **Localhost Responds**: `curl http://localhost:5000` returns 200
- [ ] **Playwright Available**: Can take screenshot of localhost (if MCP installed)
- [ ] **README Updated**: No template content remains
- [ ] **Git Status Clean**: All changes committed
```

## 8. Error Handling & Recovery

### Issues Discovered
- No guidance when things go wrong
- No recovery procedures
- No debugging help

### Solutions

**Add to CLAUDE.md:**
```markdown
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
```

## 9. Documentation Quality Standards

### Current Issue
- Generic documentation that doesn't reflect actual project
- No quality control for documentation creation

### Solutions

**Documentation Quality Checklist:**
```markdown
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
```

## 10. Template Improvements

### Issues
- Templates are too generic
- Not enough guidance for Claude Code
- Missing project-specific prompts

### Solutions

**Enhanced Template Headers:**
```markdown
# [PROJECT NAME] - [ONE LINE DESCRIPTION]

*This file was created during setup phase with Claude Code based on user input*

## Instructions for Claude Code
When filling this template:
1. Replace ALL placeholder content
2. Use specific user requirements, not generic examples
3. Confirm decisions with user before finalizing
4. Ensure consistency across all documentation files
```

## 11. Makefile Enhancements

### Missing Commands
- No easy commands for common development tasks
- No verification commands

### Required Additions
```makefile
# Development commands
setup:
	./bootstrap.sh

install:
	cd src && source venv/bin/activate && pip install -r requirements.txt

run:
	cd src && source venv/bin/activate && python app.py

test-server:
	curl -s http://localhost:5000 | head -5

test-playwright:
	@echo "Testing Playwright MCP..."
	claude mcp list | grep playwright

verify-setup:
	@echo "Verifying complete setup..."
	@$(MAKE) install
	@$(MAKE) test-server
	@$(MAKE) test-playwright

clean:
	rm -rf src/venv
	find . -name "*.pyc" -delete
	find . -name "__pycache__" -delete
```

## 12. Success Metrics

### Missing Measurement
- No way to know if setup was successful
- No validation of end result

### Required Metrics
```markdown
## Setup Success Validation

A successful setup phase should result in:
- [ ] **Working Application**: localhost:5000 loads project homepage  
- [ ] **Interactive Features**: Forms, calculators, navigation work
- [ ] **Professional Documentation**: All docs project-specific, no templates
- [ ] **Development Ready**: Other developers can clone and run immediately
- [ ] **Testing Capable**: Playwright MCP installed and functional
- [ ] **Version Controlled**: All work committed to appropriate repository
```

## Implementation Priority

### Phase 1: Critical (Implement First)
1. Rename project-template
2. Fix bootstrap dependency strategy  
3. Update CLAUDE.md setup checklist
4. Add environment verification steps

### Phase 2: Quality (Implement Second)
1. README rewriting requirement
2. Documentation quality standards
3. Error handling and recovery procedures

### Phase 3: Enhancement (Implement Third)
1. Makefile improvements
2. Linux distribution support
3. Success metrics and validation

---

**Total Impact**: These changes will transform the project skeleton from a basic template into a professional, reliable foundation that ensures every new project starts with a working environment and quality documentation.

**Key Insight**: The setup phase should deliver a **working application**, not just filled-out templates. Users should be able to see their project running immediately after setup completion.