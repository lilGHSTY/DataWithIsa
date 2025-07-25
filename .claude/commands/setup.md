# /setup Command

Controls the setup phase of the project.

## Usage

### Start Setup Phase
```
/setup start
```

**Actions:**
1. Check if `.claude/modes/SETUP.lock` already exists
2. If not, create `.claude/modes/SETUP.lock` with content:
   ```
   # SETUP PHASE ACTIVE
   # Created by /setup start at [timestamp]
   # Remove with: /setup complete
   ```
3. Enter setup/discovery mode
4. Begin asking project questions
5. Focus on documentation and planning

### Complete Setup Phase
```
/setup complete
```

**Actions:**
1. Verify key documentation exists:
   - docs/REQUIREMENTS.md has content
   - .claude/DECISIONS.md has technical choices
   - CLAUDE.md has project context
2. Remove `.claude/modes/SETUP.lock`
3. Summarize what was configured
4. Suggest first development tasks

## Setup Phase Behavior

While in setup phase:
- Ask discovery questions progressively
- Create and fill documentation templates
- Discuss technical decisions
- Plan project architecture
- NO implementation code

## Discovery Flow

1. **Project Understanding**
   - What are you building?
   - Who will use it?
   - What problem does it solve?

2. **Technical Preferences**
   - Any specific requirements?
   - Experience level?
   - Timeline and scope?

3. **Design Direction**
   - Visual style preferences?
   - Brand personality?
   - Reference sites?

4. **Documentation Creation**
   - Fill docs/REQUIREMENTS.md
   - Update .claude/DECISIONS.md
   - Create initial architecture
   - Update CLAUDE.md context

## Example Interaction

```
User: /setup start
CC: Let's set up your project! First, tell me what you're building...

[... discovery conversation ...]

User: /setup complete
CC: Great! Setup is complete. Here's what we configured:
- Project: E-commerce site for handmade crafts
- Stack: Flask, SQLite, Stripe integration
- Style: Warm, artisanal, mobile-first

Ready to start building! Would you like to begin with the homepage layout?
```