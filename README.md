# Project Skeleton

> A minimal, intelligent skeleton for web development projects optimized for AI-assisted development with Claude Code.

[![License: Public Domain](https://img.shields.io/badge/License-Public%20Domain-blue.svg)](https://en.wikipedia.org/wiki/Public_domain)
[![Python](https://img.shields.io/badge/Python-3.11+-green.svg)](https://python.org)
[![Flask](https://img.shields.io/badge/Flask-3.0+-red.svg)](https://flask.palletsprojects.com)

## Why This Skeleton?

This skeleton solves the **"blank page problem"** for web development. Instead of starting from scratch every time, you get:

- **Smart Setup Wizard** that customizes everything for your specific project
- **AI-Optimized Documentation** that gives Claude Code perfect context
- **Production-Ready Conventions** without overwhelming complexity
- **One-Command Setup** that handles dependencies, Git, and GitHub automatically

## Features

- ✅ **Interactive Setup Wizard** - Customizes project files based on your requirements
- ✅ **Minimal Structure** - No unnecessary complexity or bloat
- ✅ **AI-Optimized** - Generates perfect first prompts for Claude Code
- ✅ **Auto-Dependencies** - Checks and installs missing tools automatically
- ✅ **GitHub Integration** - Automatic repository creation and setup
- ✅ **Production-Ready** - Security-first conventions and best practices
- ✅ **Progressive Enhancement** - Start simple, add complexity as needed

## Quick Start

1. **Clone or copy the skeleton:**
   ```bash
   # From GitHub (once published):
   git clone https://github.com/lilGHSTY/project-skeleton.git my-new-project
   cd my-new-project
   
   # Or copy locally:
   cp -r project-skeleton/ my-new-project/
   cd my-new-project/
   ```

2. **Run the setup script:**
   ```bash
   ./scripts/setup.sh
   ```
   This will:
   - Check and install dependencies
   - Set up Git and GitHub
   - Run the project customization wizard
   - Generate your first Claude prompt

3. **Start developing with Claude Code:**
   ```bash
   claude
   # Paste the generated prompt from first-prompt.txt
   ```

## Example: What You Get

After running the wizard, instead of a generic template, you get:

- **Customized REQUIREMENTS.md** with your specific project needs
- **AI-optimized CLAUDE.md** with your design preferences and business context  
- **Tailored first prompt** like this:

```
Read CLAUDE.md and docs/REQUIREMENTS.md to understand the [YourProject] project.

I need you to create a professional landing page with:
- Corporate visual style with primary color: #007bff
- Focus on [your target audience]
- Goal: [your specific business goal]

Start with a wireframe layout so I can review before implementation.
```

**Result**: Claude Code has perfect context to build exactly what you need!

## Directory Structure

```
.
├── .claude/               # AI-specific configurations
│   ├── CONVENTIONS.md     # Development standards
│   ├── DECISIONS.md       # Technical choices log
│   ├── RESEARCH.md        # Research methodology
│   ├── HOOKS_GUIDE.md     # Hook system documentation
│   └── hooks.json         # Automated development hooks
├── docs/                  # Project documentation
│   ├── REQUIREMENTS.md    # What we're building (auto-generated)
│   ├── ARCHITECTURE.md    # System design
│   └── PROGRESS.md        # Development log
├── research/              # Research findings
├── src/                   # Source code
│   ├── static/           # CSS, JS, images
│   ├── templates/        # HTML templates  
│   └── app.py            # Main application (created by setup)
├── tests/                 # Test files
├── scripts/               # Setup and utility scripts
│   ├── setup.sh          # Complete environment setup
│   ├── project-wizard.py # Interactive customization wizard
│   └── validate-skeleton.sh # Skeleton validation
├── config/                # Configuration files
├── CLAUDE.md             # AI assistant instructions
├── Makefile              # Common development commands
├── .env.example          # Environment variables template
├── .gitignore            # Git ignore patterns
└── README.md             # This file
```

## Key Concepts

### 1. Decisions First
All technical decisions are documented in `.claude/DECISIONS.md`. Check here before implementing anything new.

### 2. Research Driven
Follow the methodology in `.claude/RESEARCH.md` to ensure thorough understanding before coding.

### 3. Convention Over Configuration
Use the conventions in `.claude/CONVENTIONS.md` to maintain consistency across the project.

### 4. Progressive Enhancement
Start simple:
- HTML/CSS/JS frontend
- Python Flask backend  
- SQLite database
- Local development

Then enhance as needed:
- Add frameworks when complexity demands
- Upgrade to PostgreSQL for production
- Add caching when performance requires
- Deploy when ready

## Default Stack

The skeleton suggests but doesn't enforce:
- **Frontend**: Vanilla HTML/CSS/JavaScript
- **Backend**: Python Flask (minimal)
- **Database**: SQLite → PostgreSQL
- **Hosting**: Local → Digital Ocean

You can change any of these - just update DECISIONS.md!

## Security Built In

- Environment variables for secrets
- Input validation reminders
- SQL injection prevention
- CSRF protection ready
- HTTPS enforcement notes

## Working with Claude Code

This skeleton is optimized for AI-assisted development:

1. **Clear Context**: All necessary information in documented locations
2. **Research First**: Built-in methodology for thorough preparation  
3. **Decision Tracking**: Your choices are remembered and followed
4. **Progressive Disclosure**: Complexity added only when needed

## Customization

To adapt for your project:

1. Update `docs/REQUIREMENTS.md` with your specific needs
2. Modify `.claude/DECISIONS.md` with your technical choices
3. Add project-specific notes to `CLAUDE.md`
4. Extend the folder structure as needed

## Philosophy

"Start simple, enhance as needed, maintain control throughout."

This skeleton solves the common problems of:
- Starting from absolute scratch
- Forgetting security basics
- Losing track of decisions
- Inconsistent development patterns
- Insufficient research before coding

Without forcing you into:
- Specific frameworks
- Complex architectures  
- Unnecessary abstractions
- One-size-fits-all solutions

## Contributing

Found a bug or have an improvement? Please open an issue or pull request!

Common improvements:
- Additional project types in the wizard
- More design style options  
- Better default configurations
- Documentation improvements

## License

This skeleton is released into the public domain. Use it however you like!

## Credits

Created to solve the "blank page problem" for AI-assisted web development. Optimized for [Claude Code](https://claude.ai/code) but works with any AI coding assistant.