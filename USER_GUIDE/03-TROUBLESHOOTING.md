# Troubleshooting

## Philosophy: Use Claude Code First

For most technical issues, **describe the problem to Claude Code**. It has full context of your project and can provide targeted solutions.

## Quick Fixes

**Bootstrap script won't run:**
```bash
chmod +x bootstrap.sh
./bootstrap.sh
```

**Slash commands not working:**
- Put slash commands at the start of your message
- Correct: `/setup start`
- Wrong: `Can you /setup start`

## When to Ask Claude Code

**✅ ASK CLAUDE CODE:**
- Flask app won't start
- Database errors
- Import/dependency issues  
- Code not working as expected
- Performance problems
- Deployment issues
- Git problems

**Example:**
```
"My Flask app shows a 500 error when I try to login. 
Here's the error message: [paste error]"
```

Claude Code will:
- Analyze the error with your project context
- Check your code for issues
- Provide specific fixes
- Update files if needed

## When to Handle Yourself

**❌ SIMPLE CONFIG:**
- Make bootstrap executable: `chmod +x bootstrap.sh`
- Restart development server: `Ctrl+C` then restart
- Clear browser cache: `Cmd+Shift+R` (Mac) or `Ctrl+Shift+R`

## Remember

Claude Code knows:
- Your project structure
- Your technology stack  
- Your specific code
- Common patterns that work

Use this knowledge! Describe problems clearly and let Claude Code solve them.