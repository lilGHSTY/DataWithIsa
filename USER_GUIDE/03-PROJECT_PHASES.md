# Understanding Project Phases

Your project moves through distinct phases, each with a specific purpose. Claude Code adapts its behavior to match the current phase.

## Phase Overview

```
SETUP → DEVELOPMENT → DEPLOYMENT
  ↓           ↓           ↓
Planning   Building   Launching
```

## 1. Setup Phase 🎯

**Purpose**: Discovery, planning, and documentation

**Triggered by**: `/setup start` command only

**What happens**:
- Claude Code asks about your project
- You discuss requirements and goals
- Documentation is created
- Technical decisions are made
- File structure is planned

**What DOESN'T happen**:
- No code is written
- No actual files are created (except docs)
- No implementation begins

**Complete with**: `/setup complete`

### Setup Checklist
- [ ] Project requirements documented
- [ ] Target audience defined
- [ ] Brand principles established
- [ ] Technical stack confirmed
- [ ] Initial wireframes/flow discussed
- [ ] Success metrics defined

## 2. Development Phase 💻

**Purpose**: Building your project

**Active when**: No phase locks present

**What happens**:
- Code implementation
- Feature development
- Testing and debugging
- Iterative improvements
- Documentation updates

**Best practices**:
- Start with MVP features
- Test as you go
- Commit working code
- Keep documentation updated

### Development Workflow
1. Pick a feature from requirements
2. `/research` if needed
3. Implement with Claude Code
4. Test the implementation
5. Update progress documentation
6. Repeat

## 3. Research Mode 🔍

**Purpose**: Gathering context and best practices

**Triggered by**: `/research [topic]`

**What happens**:
- Searches for official documentation
- Finds best practices
- Stores context for later use
- Analyzes implementation approaches

**When to use**:
- Before implementing new features
- When using unfamiliar libraries
- To find optimal solutions
- To understand security implications

### Research Examples
- `/research flask user authentication`
- `/research stripe integration`
- `/research responsive design patterns`
- `/research postgresql optimization`

## 4. Deployment Phase 🚀

**Purpose**: Preparing for production

**Triggered by**: `/deploy` (when available)

**What happens**:
- Environment configuration
- Security hardening
- Performance optimization
- Deployment scripts
- Monitoring setup

## Phase Indicators

You can always check the current phase by looking at:

```
.claude/modes/
├── SETUP.lock      # If present = Setup phase
├── RESEARCH.lock   # If present = Research mode
└── DEPLOY.lock     # If present = Deploy phase
```

## Switching Phases

### Manual Control (YOU control everything)
- `/setup start` - Enter setup phase
- `/setup complete` - Exit setup phase
- `/research [topic]` - Enter research mode
- Research auto-completes when done

### No Automatic Transitions
- You must explicitly start and end each phase
- Bootstrap script does NOT create any lock files
- Development is the default when no locks exist

## Phase-Specific Behaviors

### Setup Phase
- Asks many questions
- Creates documentation
- Suggests approaches
- Plans architecture

### Development Phase
- Writes code
- Implements features
- Fixes bugs
- Normal coding tasks

### Research Mode
- Finds documentation
- Analyzes approaches
- Stores findings
- Prepares context

## Common Questions

**Q: Can I skip setup phase?**
A: Not recommended. Proper setup ensures CC understands your project.

**Q: Can I return to setup phase later?**
A: Yes! Use `/setup start` anytime to update project direction.

**Q: What if I'm in the wrong phase?**
A: Check `.claude/modes/` and delete unwanted lock files.

**Q: How long should each phase take?**
A: Setup: 15-30 min, Research: 5-10 min per topic, Development: Ongoing

---

Remember: Phases help Claude Code give you the right help at the right time!