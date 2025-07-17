# Claude Code Setup Guide

This guide helps Claude Code lead users through the project setup phase.

## Setup Flow Overview

When a user starts with this skeleton, guide them through these phases:

### Phase 1: Environment Setup (5 min)
1. Copy .env.example to .env
2. Set up Python virtual environment
3. Install dependencies
4. Verify everything works by starting the dev server

### Phase 2: Project Discovery (10-15 min)
1. Ask about their project idea
2. Review any rough drafts they have
3. Understand their goals and constraints
4. Identify target audience
5. Determine MVP scope

### Phase 3: Documentation Generation (10 min)
1. Fill out docs/REQUIREMENTS.md based on discovery
2. Update .claude/DECISIONS.md with technical choices
3. Create initial docs/ARCHITECTURE.md
4. Add project context to CLAUDE.md

### Phase 4: Research & Context Gathering (15-20 min)
1. Research chosen technologies
2. Find official documentation
3. Store findings in research/ folder
4. Create technology-specific guides

### Phase 5: Development Planning (5 min)
1. Create development roadmap
2. Set up initial file structure
3. Generate first implementation tasks

## Key Principles

1. **Conversational**: Keep it natural and friendly
2. **Progressive**: Don't overwhelm with all questions at once
3. **Flexible**: Adapt to user's knowledge level
4. **Thorough**: Ensure you understand before implementing

## Setup Commands

When the user says something like "help me set up this project", start with:

```bash
# First, let's set up your development environment
cp .env.example .env

# Create and activate virtual environment
cd src
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Test that everything works
python app.py
```

## Discovery Questions

Ask these progressively, not all at once:

### Understanding the Project
- "What are you building? Give me the elevator pitch!"
- "Who will use this and what problem does it solve?"
- "Do you have any documents, sketches, or notes I should review?"

### Technical Preferences
- "Any specific technologies you want to use or avoid?"
- "What's your experience level with web development?"
- "Are you building this solo or with a team?"

### Design & Brand
- "How should it look and feel? Modern, playful, corporate?"
- "Any existing brand colors or style guides?"
- "Websites you like for inspiration?"

### Business Context
- "What's driving this project? Personal, startup, client work?"
- "When do you need the MVP ready?"
- "Will this need to handle real users/payments/data?"

## Research Triggers

When the user mentions technologies, automatically research them:
- Frontend frameworks → Research components, patterns, best practices
- Databases → Research schema design, queries, migrations
- APIs → Research authentication, rate limits, SDKs
- Payment systems → Research integration, security, compliance

## File Templates to Update

Based on discovery, update these files:

### docs/REQUIREMENTS.md
- Project overview from their description
- User stories from target audience
- Features from their needs
- Design requirements from preferences
- Success metrics from goals

### .claude/DECISIONS.md
Add decisions like:
- Database choice and why
- Frontend approach and why
- Hosting platform and why
- Key libraries and why

### CLAUDE.md
Update Project-Specific Notes with:
- Project name and description
- Key business context
- Design direction
- Priority features
- Special considerations

## Handoff to Development

After setup is complete:
1. Summarize what was configured
2. Show the development roadmap
3. Suggest the first implementation task
4. Confirm they're ready to start building

## Remember

- The user is the decision maker - always ask, don't assume
- Start simple - complexity can be added later
- Document everything for future sessions
- Make the user feel confident and supported