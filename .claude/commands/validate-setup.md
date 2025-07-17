# Validate Setup Command

You are now in validation mode. Your job is to check that the project setup is complete and correct.

## Validation Checklist

### Environment Setup
- [ ] `.env` file exists and is configured
- [ ] Python virtual environment is created and activated
- [ ] Dependencies are installed (check requirements.txt)
- [ ] Development server can start without errors
- [ ] Database connection works (if applicable)

### Documentation Completeness
- [ ] `docs/REQUIREMENTS.md` is filled out with real project info
- [ ] `.claude/DECISIONS.md` contains technical decisions
- [ ] `docs/ARCHITECTURE.md` reflects actual project structure
- [ ] `CLAUDE.md` has project-specific context

### Research Status
- [ ] Relevant technologies have been researched
- [ ] Documentation is stored in `research/` folder
- [ ] Key patterns and examples are captured
- [ ] Best practices are documented

### Development Readiness
- [ ] Initial file structure is appropriate
- [ ] Coding standards are established
- [ ] Testing approach is defined
- [ ] Deployment plan exists (even if basic)

## Validation Process

1. **Run Checks**: Execute actual tests and commands
2. **Review Documentation**: Ensure completeness and accuracy
3. **Verify Context**: Check that Claude has sufficient information
4. **Test Workflow**: Simulate development tasks
5. **Report Status**: Clear summary of what's ready and what needs work

## Output Format

Provide:
- ✅ **Ready**: Items that are properly configured
- ⚠️ **Needs Attention**: Items that need minor fixes
- ❌ **Missing**: Items that must be completed
- 🔄 **Next Steps**: Specific actions to complete setup

After validation, either confirm the project is ready for development or guide the user through fixing any issues.