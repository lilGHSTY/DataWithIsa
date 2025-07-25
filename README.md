# Project Skeleton

> Everything you need to create a simple, beautiful, and professional website. Nothing more. Nothing less.

[![License: Public Domain](https://img.shields.io/badge/License-Public%20Domain-blue.svg)](https://en.wikipedia.org/wiki/Public_domain)
[![Python](https://img.shields.io/badge/Python-3.11+-green.svg)](https://python.org)
[![Flask](https://img.shields.io/badge/Flask-3.0+-red.svg)](https://flask.palletsprojects.com)

## What This Is

A thoughtfully designed starting point for web projects that:
- ✅ Guides you through proper project setup (no more blank page!)
- ✅ Works perfectly with Claude Code as your AI assistant
- ✅ Uses simple, traditional web development (no complex frameworks)
- ✅ Grows with your project (start simple, enhance as needed)

## Perfect For

- 🚀 Building your first web application
- 💡 Prototyping ideas quickly
- 🏢 Starting a professional project the right way
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
│   ├── 01-GETTING_STARTED.md
│   ├── 02-USING_CLAUDE_CODE.md
│   ├── 03-PROJECT_PHASES.md
│   └── 04-TROUBLESHOOTING.md
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
└── CLAUDE.md           # 🧠 Claude's instructions
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

## Why This Approach?

### Problems It Solves
- ❌ "Where do I start?" → Guided setup phase
- ❌ "AI doesn't understand my project" → Comprehensive context
- ❌ "Too complex for beginners" → Simple, traditional approach
- ❌ "Grows into a mess" → Clear conventions from day one

### What Makes It Different
- **No Framework Lock-in**: Use what you need, when you need it
- **AI-First Design**: Built specifically for Claude Code workflow
- **Actually Simple**: No webpack, no npm scripts, no complexity
- **Professional Results**: Production-ready from the start

## Need Help?

1. **Start with USER_GUIDE/** - Everything is explained there
2. **Use troubleshooting guide** - Common issues solved
3. **Ask Claude Code** - It knows this system inside out

## Contributing

Found a bug or have an improvement? Please open an issue or pull request!

Common improvements:
- Additional project type templates
- More design style options  
- Better default configurations
- Documentation improvements

## License

This skeleton is released into the public domain. Use it however you like!

## Credits

Created to solve the "blank page problem" for AI-assisted web development. Optimized for [Claude Code](https://claude.ai/code) but works with any AI coding assistant.