# Web Starter Kit

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

### 🎯 Working Application Delivery
- **Setup Phase**: Delivers a **working Flask application** with professional documentation
- **Environment Verified**: Dependencies installed, server tested, Playwright MCP ready
- **Development Ready**: Other developers can clone and run immediately
- **Research Mode**: Gather official docs before implementing new features

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

1. **Get the starter kit:**
   ```bash
   git clone https://github.com/lilGHSTY/web-starter-kit.git my-project
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

### 🚀 Working Application
- **Localhost:PORT** loads your project homepage immediately (port auto-selected per project)
- **Interactive features** work out of the box
- **Professional appearance** matches your brand guidelines
- **Developer-ready** environment with all dependencies installed

**Result**: Not just documentation - a **working web application** tailored to your project!

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
├── requirements-core.txt # 📋 Core dependency reference
├── CLAUDE.md            # 🧠 Claude's instructions
├── README.md            # 📖 This file
├── .env.example         # 🔧 Environment variables template
├── .gitignore           # 📁 Git ignore patterns
└── Makefile             # ⚙️ Development commands
```

## How It Works

### 1. Working Application Delivery
```
TEMPLATES → COLLABORATIVE SETUP → WORKING APPLICATION
```
1. **Professional templates** provide structure
2. **Setup phase** creates working Flask app with your project details
3. **Verification steps** ensure everything works before completion

### 2. Phase-Based Development
```
SETUP → DEVELOPMENT → DEPLOYMENT
```
- `/setup start`: Create **working application** with documentation
- `/setup complete`: Begin building new features
- `/research [topic]`: Gather official documentation anytime

### 3. Quality Verification
- **Dependencies installed**: All Python packages with exact versions
- **Server tested**: Flask application starts and responds
- **MCP ready**: Playwright installed for testing
- **Git committed**: All setup work properly version controlled

### 4. Progressive Enhancement
Start with:
- Simple HTML/CSS/JS
- Python Flask backend
- SQLite database

Enhance only when needed!

## Default Stack

The starter kit suggests but doesn't enforce:
- **Frontend**: Vanilla HTML/CSS/JavaScript
- **Backend**: Python Flask (minimal)
- **Database**: SQLite → PostgreSQL
- **Hosting**: Local → Digital Ocean

You can change any of these - just update DECISIONS.md!

## What Makes It Different

- **Working Application**: Setup delivers a functional Flask app, not just documents
- **Quality Verified**: Dependencies, server, and testing tools all confirmed working
- **Professional Templates**: 9 business-ready documentation templates
- **Collaborative Setup**: Claude Code works WITH you, not FOR you
- **Complete Context**: Every file tells Claude Code exactly what your project needs
- **No Framework Lock-in**: Use what you need, when you need it
- **AI-First Design**: Built specifically for Claude Code workflow  
- **Actually Simple**: No webpack, no npm scripts, no complexity
- **Smart Port Selection**: Each project gets its own consistent port to prevent conflicts
- **Immediate Results**: See your project running on localhost:PORT after setup

## Need Help?

1. **Start with USER_GUIDE/** - Everything is explained there
2. **Use troubleshooting guide** - Common issues solved
3. **Ask Claude Code** - It knows this system inside out

## License & Contributing

**Public Domain** - Use this however you like! Found an issue? [Open one here](https://github.com/lilGHSTY/web-starter-kit/issues).

*Created to solve the "blank page problem" for AI-assisted web development.*
