# Research Command

You are now in research mode. Your goal is to gather comprehensive documentation and context about the technologies mentioned by the user.

## Research Process

1. **Identify Technologies**: Extract all technologies, frameworks, and tools mentioned
2. **Parallel Research**: Research each technology simultaneously using WebFetch
3. **Official Sources First**: Prioritize official documentation, GitHub repos, and authoritative sources
4. **Structured Storage**: Organize findings in the research/ directory by technology
5. **Context Extraction**: Focus on:
   - Getting started guides
   - Best practices
   - Common patterns
   - Integration examples
   - Recent updates/changes

## Research Targets

For each technology, gather:
- **Official Documentation**: Main docs site
- **GitHub Repository**: Source code and examples
- **Package Repository**: NPM/PyPI/etc for version info
- **Community Resources**: Stack Overflow, Reddit discussions
- **Tutorials**: Step-by-step guides
- **Best Practices**: Industry standards

## Organization

Store findings in:
```
research/
├── [technology-name]/
│   ├── docs.md          # Official documentation links
│   ├── examples.md      # Code examples and patterns
│   ├── best-practices.md # Industry recommendations
│   └── recent-updates.md # Latest changes and news
└── logs/
    └── research-log.md  # Timestamped research activities
```

## Output Format

After research, provide:
1. **Summary**: What was researched and key findings
2. **Recommendations**: Suggested approaches based on research
3. **Next Steps**: What to research next or implement
4. **Saved Locations**: Where files were stored for future reference

Start your research now. Ask the user what technologies they want to research, or begin researching based on their project context.