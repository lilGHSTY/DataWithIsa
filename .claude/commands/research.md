# /research Command

Activates research mode for comprehensive documentation gathering.

## Usage

```
/research [topic]
```

## Examples
- `/research flask user authentication`
- `/research stripe python integration`
- `/research responsive css grid`
- `/research postgresql flask sqlalchemy`

## Actions

1. **Create Lock File**
   - Create `.claude/modes/RESEARCH.lock` with content:
     ```
     # RESEARCH MODE ACTIVE
     # Topic: [user topic]
     # Created by /research at [timestamp]
     ```
   - Enter research mode

2. **Multi-Agent Research** (inspired by context engineering)
   - Search for official documentation
   - Find llm.txt files if available
   - Gather best practices
   - Analyze security considerations
   - Review common patterns

3. **Store Context**
   ```
   research/
   ├── [timestamp]_[topic]/
   │   ├── summary.md
   │   ├── official_docs.md
   │   ├── patterns.md
   │   ├── security.md
   │   └── implementation_guide.md
   ```

4. **Clean Up**
   - Remove `.claude/modes/RESEARCH.lock`
   - Summarize findings
   - Confirm context is loaded

## Research Strategy

### Phase 1: Discovery
- Official documentation sites
- GitHub repositories
- Framework guides
- API references

### Phase 2: Analysis
- Common patterns
- Best practices
- Performance tips
- Security guidelines

### Phase 3: Synthesis
- Create implementation guide
- Note important warnings
- Prepare code templates
- Document decision points

## Context Usage

After research, Claude Code will:
- Reference stored documentation
- Use official patterns
- Apply security best practices
- Implement proper error handling

## Example Flow

```
User: /research flask-login user authentication

CC: Researching Flask-Login authentication...

[Creates RESEARCH.lock]
[Searches multiple sources]
[Stores in research/20240125_flask-login/]

Found comprehensive documentation:
- Official Flask-Login docs
- Secure password hashing with Werkzeug
- Session management best practices
- Common patterns for user models

Context stored and loaded. Ready to implement authentication!

[Removes RESEARCH.lock]
```

## Best Practices

1. **Be Specific**: "flask authentication" > "authentication"
2. **Research Before Building**: Gather context for unfamiliar features
3. **Chain Research**: Can research multiple related topics
4. **Verify Context**: Use `/context verify` to check loaded docs

## Auto-Triggers

Research may auto-trigger when:
- Implementing new features
- Using unfamiliar libraries
- Security-sensitive operations
- Performance optimizations