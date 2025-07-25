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
- **Setup Phase**: Claude Code asks about your project and creates documentation
- **Development Phase**: Build features with full context
- **Research Mode**: Gather official docs before implementing

### 🛠️ Smart Bootstrap
- One command checks and installs everything
- Sets up Git and can create GitHub repos
- Prepares environment (you control the phases)

### 📚 User-Friendly Documentation
- All guides in `USER_GUIDE/` folder
- Progressive templates (start simple, expand later)
- Clear slash commands for control

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
   Then run: `/setup start`
   
   Claude will guide you through project discovery!

## Example: What You Get

After setup conversation with Claude Code, you get:

- **Customized REQUIREMENTS.md** based on your project description
- **Technical decisions** documented in `.claude/DECISIONS.md`
- **Style guide** reflecting your design preferences
- **Research context** for your chosen technologies
- **Development environment** ready to go

**Result**: Claude Code understands your project and is ready to build exactly what you need!

## What's Inside

```
your-project/
├── USER_GUIDE/           # 📚 Start here! All user documentation
│   ├── 01-USING_CLAUDE_CODE.md
│   ├── 02-PROJECT_PHASES.md
│   └── 03-TROUBLESHOOTING.md
├── .claude/              # 🤖 Claude Code configuration
│   ├── modes/            # Phase lock files
│   ├── commands/         # Slash command definitions
│   └── templates/        # Progressive templates
├── src/                  # 💻 Your code goes here
│   ├── app.py           # Flask application
│   ├── templates/       # HTML templates
│   └── static/          # CSS, JS, images
├── docs/                # 📋 Project documentation
├── research/            # 🔍 Technology research
├── bootstrap.sh         # 🚀 One-command setup
├── CLAUDE.md           # 🧠 Claude's instructions
├── README.md           # 📖 This file
├── .env.example        # 🔧 Environment variables template
├── .gitignore          # 📁 Git ignore patterns
└── Makefile            # ⚙️ Development commands
```

## How It Works

### 1. Phase-Based Workflow
```
SETUP → DEVELOPMENT → DEPLOYMENT
```
- `/setup start`: Enter planning mode
- `/setup complete`: Start building  
- `/research [topic]`: Gather docs anytime

### 2. Slash Commands Give You Control
- `/setup start` - Begin setup phase
- `/setup complete` - Exit to development
- `/research flask auth` - Research before building
- `/context verify` - Check loaded documentation

### 3. Progressive Enhancement
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

- **No Framework Lock-in**: Use what you need, when you need it
- **AI-First Design**: Built specifically for Claude Code workflow  
- **Actually Simple**: No webpack, no npm scripts, no complexity
- **Professional Results**: Production-ready from the start

## Need Help?

1. **Start with USER_GUIDE/** - Everything is explained there
2. **Use troubleshooting guide** - Common issues solved
3. **Ask Claude Code** - It knows this system inside out

## License & Contributing

**Public Domain** - Use this however you like! Found an issue? [Open one here](https://github.com/lilGHSTY/project-skeleton/issues).

*Created to solve the "blank page problem" for AI-assisted web development.*
