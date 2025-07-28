# Project Skeleton

> Everything you need to create a simple, beautiful, and professional website. Nothing more. Nothing less.

[![License: Public Domain](https://img.shields.io/badge/License-Public%20Domain-blue.svg)](https://en.wikipedia.org/wiki/Public_domain)
[![Python](https://img.shields.io/badge/Python-3.11+-green.svg)](https://python.org)
[![Flask](https://img.shields.io/badge/Flask-3.0+-red.svg)](https://flask.palletsprojects.com)

## Problems This Solves

- ❌ **"Where do I start?"** → Guided setup phase with Claude Code
- ❌ **"AI doesn't understand my project"** → Comprehensive context system
- ❌ **"Too complex for beginners"** → Simple, traditional web development
- ❌ **"Projects grow into a mess"** → Clear conventions from day one

## Perfect For

- 🚀 Building your first web application
- 💡 Prototyping ideas quickly  
- 🏢 Starting a professional project
- 🤖 Learning AI-assisted development

## Key Features

### 🎯 Phase-Based Development
- **Setup Phase**: **Collaborative** project discovery - Claude Code works WITH you to create documentation
- **Development Phase**: Build features with full context
- **Research Mode**: Gather official docs before implementing

### 🛠️ Smart Bootstrap
- One command checks and installs everything
- Sets up Git and can create GitHub repos
- Prepares environment (you control the phases)

### 📚 Professional Documentation System
- **Template-based**: 9 professional templates in `templates/` directory
- **Collaborative creation**: Claude Code works with you to fill templates
- **Complete coverage**: Requirements, Architecture, Business Plan, Brand Guidelines, Security Plan
- **User guides**: All guides in `USER_GUIDE/` folder
- **Clear controls**: Slash commands give you full control

## Quick Start (3 Steps)

1. **Get the skeleton:**
   ```bash
   git clone https://github.com/lilGHSTY/project-skeleton.git my-project
   cd my-project
   ```

2. **Run bootstrap:**
   ```bash
   ./bootstrap.sh
   ```
   This automatically:
   - ✓ Checks your system
   - ✓ Installs missing tools
   - ✓ Creates virtual environment
   - ✓ Prepares project structure

3. **Start Claude Code and setup:**
   ```bash
   claude
   ```
   
   **First, tell Claude Code to read the project context:**
   ```
   Please read CLAUDE.md and follow the Session Startup Checklist before we begin.
   ```
   
   **Then run the setup:**
   ```
   /setup start
   ```
   
   Claude will guide you through project discovery!

## Example: What You Get

After **collaborative** setup conversation with Claude Code, you get:

### 📋 Complete Professional Documentation
- **REQUIREMENTS.md** - Your specific project details and user stories
- **ARCHITECTURE.md** - Technical design decisions and database schema
- **BUSINESS_PLAN.md** - Market analysis and financial projections
- **BRAND_GUIDELINES.md** - Voice, tone, and visual identity
- **SECURITY_PLAN.md** - Authentication, data protection, and compliance
- **API_REFERENCE.md** - Endpoint documentation
- **TESTING_STRATEGY.md** - Quality assurance approach
- **PROGRESS.md** - Development roadmap and milestones

### 🤖 Claude Code Context
- **Technical decisions** documented in `.claude/DECISIONS.md`
- **Development conventions** in `.claude/CONVENTIONS.md`
- **Custom slash commands** for your project workflow

**Result**: Claude Code has deep understanding of your project goals, technical decisions, and business context!

## What's Inside

```
your-project/
├── USER_GUIDE/           # 📚 Start here! All user documentation
│   ├── 01-USING_CLAUDE_CODE.md
│   ├── 02-PROJECT_PHASES.md
│   └── 03-TROUBLESHOOTING.md
├── .claude/              # 🤖 Claude Code configuration
│   ├── modes/            # Phase lock files (SETUP.lock, RESEARCH.lock)
│   ├── commands/         # Custom slash command definitions
│   └── templates/        # Additional template variations
├── templates/            # 📝 Professional documentation templates
│   ├── REQUIREMENTS.md   # Project requirements template
│   ├── ARCHITECTURE.md   # System architecture template
│   ├── BUSINESS_PLAN.md  # Business strategy template
│   ├── BRAND_GUIDELINES.md # Brand identity template
│   ├── SECURITY_PLAN.md  # Security requirements template
│   ├── API_REFERENCE.md  # API documentation template
│   ├── TESTING_STRATEGY.md # Testing approach template
│   └── PROGRESS.md       # Development tracking template
├── docs/                 # 📋 Project documentation (created during setup)
├── src/                  # 💻 Your code goes here
│   ├── app.py           # Flask application (created during development)
│   ├── templates/       # HTML templates
│   └── static/          # CSS, JS, images
├── migrations/           # 🗄️ Database schema and migrations
├── scripts/              # 🔧 Utility scripts (backup, deploy, etc.)
├── config/               # ⚙️ Environment-specific configurations
├── research/             # 🔍 Technology research and findings
├── tests/                # 🧪 Test files
├── bootstrap.sh          # 🚀 One-command setup
├── CLAUDE.md            # 🧠 Claude's instructions
├── README.md            # 📖 This file
├── .env.example         # 🔧 Environment variables template
├── .gitignore           # 📁 Git ignore patterns
└── Makefile             # ⚙️ Development commands
```

## How It Works

### 1. Template-to-Documentation Workflow
```
TEMPLATES → COLLABORATIVE SETUP → PROJECT DOCS
```
1. **Templates exist** in `templates/` directory (never change)
2. **Setup phase** collaboratively fills templates with your project details
3. **Documentation created** in `docs/` directory with your specific content

### 2. Phase-Based Development
```
SETUP → DEVELOPMENT → DEPLOYMENT
```
- `/setup start`: Enter **collaborative** planning mode
- `/setup complete`: Begin building with full context
- `/research [topic]`: Gather official documentation anytime

### 3. Collaborative Setup Process
- Claude Code **asks questions** about your project
- **You provide input** and confirm decisions
- **Together you fill** professional templates
- **Result**: Complete documentation tailored to your project

### 4. Progressive Enhancement
Start with:
- Simple HTML/CSS/JS
- Python Flask backend
- SQLite database

Enhance only when needed!

## Default Stack

The skeleton suggests but doesn't enforce:
- **Frontend**: Vanilla HTML/CSS/JavaScript
- **Backend**: Python Flask (minimal)
- **Database**: SQLite → PostgreSQL
- **Hosting**: Local → Digital Ocean

You can change any of these - just update DECISIONS.md!

## What Makes It Different

- **Template-Based Documentation**: 9 professional templates create comprehensive project docs
- **Collaborative Setup**: Claude Code works WITH you, not FOR you
- **Complete Context**: Every file tells Claude Code exactly what your project needs
- **No Framework Lock-in**: Use what you need, when you need it
- **AI-First Design**: Built specifically for Claude Code workflow  
- **Actually Simple**: No webpack, no npm scripts, no complexity
- **Professional Results**: Business-ready documentation from day one

## Need Help?

1. **Start with USER_GUIDE/** - Everything is explained there
2. **Use troubleshooting guide** - Common issues solved
3. **Ask Claude Code** - It knows this system inside out

## License & Contributing

**Public Domain** - Use this however you like! Found an issue? [Open one here](https://github.com/lilGHSTY/project-skeleton/issues).

*Created to solve the "blank page problem" for AI-assisted web development.*
