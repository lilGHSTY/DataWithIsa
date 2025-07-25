# Troubleshooting Guide

Common issues and their solutions.

## Setup Issues

### "Command not found" when running bootstrap.sh
```bash
# Make the script executable
chmod +x bootstrap.sh

# Then run it
./bootstrap.sh
```

### Python/pip not found
The bootstrap script should install Python. If it fails:
- **Mac**: Install Python from python.org or use Homebrew
- **Linux**: Use your package manager (`apt`, `yum`, etc.)
- **Windows**: Install Python from python.org, use WSL, or Git Bash

### Virtual environment issues
```bash
# Remove and recreate
rm -rf src/venv
cd src
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

## Claude Code Issues

### CC is trying to code during setup
- Check if SETUP.lock exists: `ls .claude/modes/`
- If missing, run: `/setup start`
- Make sure CLAUDE.md has the phase checking logic

### Slash commands not working
- Commands must be the first thing in your message
- Correct: `/research flask authentication`
- Wrong: `Can you /research flask authentication`

### CC not using researched context
1. Verify research was stored: `ls research/`
2. Run `/context verify` to check loaded docs
3. Remind CC about the research when asking for implementation

### Wrong phase active
```bash
# Check current phases
ls .claude/modes/

# Remove unwanted phase
rm .claude/modes/SETUP.lock  # or whichever is wrong
```

## Development Issues

### Flask app won't start
```bash
# Check you're in virtual environment
which python  # Should show venv path

# Reinstall requirements
pip install -r requirements.txt

# Check for port conflicts
lsof -i :5000  # Mac/Linux
netstat -ano | findstr :5000  # Windows
```

### Database errors
```bash
# Reset database
rm instance/app.db  # or your database file
python
>>> from app import db
>>> db.create_all()
>>> exit()
```

### Static files not loading
- Check file paths in templates
- Ensure files exist in `src/static/`
- Use Flask's `url_for('static', filename='...')`

## Git Issues

### Accidentally committed .env or secrets
```bash
# Remove from history (careful!)
git rm --cached .env
git commit -m "Remove .env from tracking"

# Add to .gitignore
echo ".env" >> .gitignore
```

### Want to start over
```bash
# Save your work first!
git stash

# Reset to initial commit
git reset --hard initial-commit-hash

# Or create a fresh branch
git checkout -b fresh-start
```

## Performance Issues

### Slow page loads
1. Check browser developer tools Network tab
2. Look for large images or many requests
3. Optimize images and combine CSS/JS files
4. Enable Flask caching for static content

### High memory usage
- Check for infinite loops
- Look for large data in session/memory
- Use pagination for large datasets
- Profile with Flask-DebugToolbar

## Deployment Issues

### Works locally but not in production
Common causes:
- Missing environment variables
- Different Python versions
- Database connection strings
- File paths (use relative paths)
- Debug mode left on

### Static files 404 in production
- Configure web server to serve static files
- Check file permissions
- Verify paths in production config

## Getting More Help

1. **Check the docs**
   - `USER_GUIDE/` - This guide
   - `docs/` - Project documentation
   - `.claude/` - Technical details

2. **Ask Claude Code**
   - Be specific about the error
   - Share error messages
   - Describe what you've tried

3. **Common fixes**
   - Restart the development server
   - Clear browser cache
   - Check the terminal for errors
   - Verify file permissions

## Prevention Tips

1. **Use the setup phase** - Proper planning prevents problems
2. **Test incrementally** - Don't write too much before testing
3. **Keep it simple** - Complexity introduces bugs
4. **Document as you go** - Future you will thank present you
5. **Commit working code** - Easy rollback if things break

---

Remember: Every developer faces issues. The key is systematic debugging!