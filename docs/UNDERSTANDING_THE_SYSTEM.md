# Understanding the System

A simple guide to how this project skeleton works, written for non-technical users.

## The Big Picture

Think of this skeleton like a smart template that:
1. **Sets up your workspace** (like organizing a desk before starting work)
2. **Learns about your project** (through friendly conversation)
3. **Gathers helpful information** (research, examples, best practices)
4. **Helps you build** (with Claude Code as your coding partner)

## Key Components Explained

### 1. The Bootstrap Script (`scripts/bootstrap.sh`)

**What it does:**
- Checks if you have the right tools installed (Python, Git, etc.)
- Creates a safe, isolated coding environment (virtual environment)
- Sets up basic files and folders
- Prepares everything for Claude Code

**Think of it like:** Setting up a new kitchen - checking you have the right appliances, organizing cabinets, and getting everything ready to cook.

**Why this matters:** Without proper setup, code won't run correctly. This handles all the boring technical stuff automatically.

### 2. Claude Hooks System

**What hooks are:**
Hooks are like "automatic helpers" that run when Claude does certain things.

**Example:** When Claude researches something online, a hook automatically:
- Saves the research to the right folder
- Organizes it by technology (Python, Flask, etc.)
- Logs what was researched and when

**Think of it like:** Having an assistant who automatically files paperwork when you make a phone call.

**Why this is powerful:** Claude gets smarter about your project over time because it remembers and organizes everything it learns.

### 3. Documentation Templates

**What they are:**
Pre-written outlines for important project documents:
- **Requirements**: What you're building
- **Style Guide**: How it should look
- **API Reference**: How different parts talk to each other
- **Testing Strategy**: How to make sure it works

**Think of it like:** Having templates for a business plan, marketing strategy, and budget - you fill in your specific details.

**Why they help:** Professional projects need professional documentation. These templates ensure you don't forget important things.

### 4. Intelligent Research System

**How it works:**
1. **Throughout development**, when Claude researches official documentation
2. **Smart filtering**: Only captures docs/guides/tutorials (not random sites)
3. **No duplicates**: Skips URLs already researched
4. **Auto-organization**: Sorts by technology (Flask, PostgreSQL, etc.)
5. **Progressive learning**: Claude gets smarter about your stack over time

**Examples of what gets captured:**
- ✅ `flask.palletsprojects.com/en/3.0.x/quickstart/` → `research/flask/docs.md`
- ✅ `stripe.com/docs/api` → `research/stripe/docs.md`
- ❌ `stackoverflow.com/questions/...` → (ignored - not official docs)
- ❌ Already researched URLs → (skipped)

**Think of it like:** Having a research assistant who automatically files away official manuals when they're mentioned, so Claude can reference them later.

**What makes it special:** 
- **Passive**: Happens automatically without slowing you down
- **Smart**: Only saves valuable official documentation  
- **Persistent**: Research accumulates across all sessions
- **Contextual**: Claude uses this knowledge to give better advice

### 5. Slash Commands

**What they are:**
Special commands you can give Claude to activate different modes:
- `/research` - Makes Claude focus on gathering information
- `/setup-project` - Activates the setup conversation mode
- `/validate-setup` - Checks that everything is working correctly

**Think of it like:** Having different "modes" on a Swiss Army knife - each tool for a specific job.

**When to use them:** 
- If you want Claude to research something specific: `/research`
- If you're starting a new project: `/setup-project`
- If something seems broken: `/validate-setup`

## The Setup Flow Explained

### Phase 1: Environment Setup (5 minutes)
**What happens:** Claude runs commands to set up your coding environment
**Your role:** Just watch and answer any questions
**Behind the scenes:** Creating folders, installing tools, copying files

### Phase 2: Project Discovery (15 minutes)
**What happens:** Claude asks about your project through friendly conversation
**Your role:** Describe what you want to build, share any ideas or documents
**Behind the scenes:** Claude is learning about your needs and taking notes

### Phase 3: Documentation (10 minutes)
**What happens:** Claude fills out professional templates based on your conversation
**Your role:** Review what Claude wrote and suggest changes
**Behind the scenes:** Creating Requirements, Style Guide, Technical Decisions

### Phase 4: Research (15 minutes)
**What happens:** Claude researches the technologies you'll need
**Your role:** Minimal - maybe answer clarifying questions
**Behind the scenes:** Finding official docs, examples, best practices, organizing everything

### Phase 5: Ready to Build (5 minutes)
**What happens:** Claude creates a development plan and first tasks
**Your role:** Approve the plan or request changes
**Behind the scenes:** Setting up the initial code structure

## Why This Approach Works

### For Non-Technical Users:
- **Conversational:** Feels like talking to a knowledgeable friend
- **Educational:** You learn as you go
- **No intimidation:** Claude handles the technical complexity
- **Stay in control:** You make all the important decisions

### For Claude Code:
- **Rich context:** Knows your business goals, not just technical requirements
- **Research foundation:** Has access to current best practices and examples
- **Decision history:** Remembers why choices were made
- **Quality guidelines:** Follows professional standards automatically

### For the Project:
- **Professional foundation:** Proper documentation from day one
- **Scalable structure:** Can grow from MVP to full product
- **Knowledge retention:** Nothing gets lost between sessions
- **Best practices:** Built-in security, testing, and deployment considerations

## Git and GitHub Explained

### What is Git?
**Git** is like a "save system" for your code that remembers every change you make.

**Think of it like:** A word processor that automatically saves every version of your document, so you can go back to any previous version, see exactly what changed, and even work on different versions at the same time.

**Why it's essential:** 
- Never lose work (everything is saved)
- See exactly what changed when
- Work with others without conflicts
- Go back to working versions if something breaks

### What is GitHub?
**GitHub** is like "Google Drive for code" - it stores your Git projects online and lets you collaborate.

**Think of it like:** A combination of:
- **Dropbox** (stores your files in the cloud)
- **Google Docs** (lets multiple people work together)
- **Portfolio website** (shows off your work)

### How We Use It For This Project

#### The Skeleton Repository
Your project skeleton lives on GitHub as a "template" that anyone can copy:
1. **You copy (clone) the skeleton** to your computer
2. **You customize it** for your specific project
3. **You push your version** back to GitHub under your account
4. **Others can see and contribute** to your project

#### The Development Flow
```
GitHub (cloud) ←→ Your Computer (local)
     ↑                    ↓
   Push changes      Pull changes
   (upload)          (download)
```

**Daily workflow:**
1. **Pull** - Get latest changes from GitHub
2. **Work** - Make changes on your computer
3. **Commit** - Save a "checkpoint" with Git
4. **Push** - Upload your changes to GitHub

#### Key Concepts

**Repository (Repo):**
- A folder that contains your project + all its history
- Lives both on your computer and on GitHub

**Clone:**
- Make a copy of a GitHub repository on your computer
- Like "Download as folder" but with full history

**Commit:**
- A saved checkpoint of your work
- Includes a message describing what you changed
- Example: "Added user login feature"

**Push:**
- Upload your commits from your computer to GitHub
- Like "Save to cloud"

**Pull:**
- Download new changes from GitHub to your computer
- Like "Sync from cloud"

**Branch:**
- A separate "timeline" for working on features
- Like working on a copy while keeping the original safe
- Example: Have a "main" branch and an "add-shopping-cart" branch

#### For Our Project Skeleton

**What the bootstrap script does:**
1. **Initializes Git** - Sets up the save system
2. **Creates first commit** - Makes an initial checkpoint
3. **Optionally creates GitHub repo** - Sets up cloud storage
4. **Connects them** - Links your local and cloud versions

**What this means for you:**
- ✅ **Automatic backup** - Your work is safely stored online
- ✅ **Version history** - You can see every change you've made
- ✅ **Collaboration ready** - Others can help with your project
- ✅ **Professional setup** - Follows industry standards

#### Common Git Commands You'll See

```bash
# See what's changed
git status

# Save changes to Git
git add .
git commit -m "Description of what you changed"

# Upload to GitHub
git push

# Download from GitHub
git pull

# See history of changes
git log
```

**Claude Code will handle most of this for you**, but it's good to understand what's happening.

#### Why This Matters

**Professional development** always uses Git and GitHub. By starting with this system:
- **You learn industry standards** from day one
- **Your work is protected** against loss
- **You can collaborate** with other developers
- **You build a portfolio** of your projects

**Even if you're non-technical**, understanding this system helps you:
- Communicate better with developers
- Understand project history and changes
- Make informed decisions about project management
- Feel confident about code safety and backup

## Common Questions

**Q: What if I don't know the answers to Claude's questions?**
A: That's normal! Claude can help you figure out the answers or make recommendations based on similar projects.

**Q: Can I change decisions later?**
A: Absolutely! Everything is documented, so you can update requirements, change technologies, or modify the approach anytime.

**Q: What if I already have some code or designs?**
A: Perfect! Share them with Claude during setup. It can work with existing materials and build from there.

**Q: How technical do I need to be?**
A: Not very! The system is designed so Claude handles the technical details while you focus on what you want to build and why.

**Q: What if something breaks?**
A: Use `/validate-setup` to check what's wrong, or just ask Claude "something seems broken" and it will help troubleshoot.

## Success Tips

1. **Be specific about your vision:** The more you share about what you want, the better Claude can help
2. **Ask questions:** If you don't understand something, ask! Claude is great at explaining
3. **Review the documentation:** After setup, read through what Claude created to make sure it matches your vision
4. **Trust the process:** The system is designed to handle complexity, so you can focus on the creative parts
5. **Iterate:** It's OK to change your mind as you learn more about what's possible

## What Makes This Different

**Traditional approach:**
1. Developer sets up blank project
2. Spends hours researching technologies
3. Writes basic documentation
4. Starts coding without clear requirements
5. Discovers problems later

**This approach:**
1. Automated setup with conversation
2. Automatic research and organization
3. Professional documentation from day one
4. Clear requirements before any coding
5. Continuous learning and adaptation

The result: You get to focus on your vision while Claude handles the technical complexity, but you stay in control of all important decisions.