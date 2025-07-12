#!/bin/bash

# Skeleton Validation Script
# Ensures all files are present and properly configured

echo "🔍 Validating Project Skeleton"
echo "============================="

ERRORS=0

# Check required files
REQUIRED_FILES=(
    ".claude/CONVENTIONS.md"
    ".claude/DECISIONS.md" 
    ".claude/RESEARCH.md"
    ".claude/HOOKS_GUIDE.md"
    ".claude/hooks.json"
    "CLAUDE.md"
    "README.md"
    "Makefile"
    ".env.example"
    ".gitignore"
    "docs/REQUIREMENTS.md"
    "docs/ARCHITECTURE.md"
    "docs/PROGRESS.md"
    "research/README.md"
    "scripts/setup.sh"
    "scripts/project-wizard.py"
)

echo "Checking required files..."
for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "✓ $file"
    else
        echo "❌ Missing: $file"
        ERRORS=$((ERRORS + 1))
    fi
done

# Check required directories
REQUIRED_DIRS=(
    ".claude"
    "docs"
    "research" 
    "scripts"
    "src"
    "src/static/css"
    "src/static/js"
    "src/static/images"
    "src/templates"
    "tests"
    "config"
)

echo ""
echo "Checking directory structure..."
for dir in "${REQUIRED_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "✓ $dir/"
    else
        echo "❌ Missing directory: $dir/"
        ERRORS=$((ERRORS + 1))
    fi
done

# Check script permissions
echo ""
echo "Checking script permissions..."
if [ -x "scripts/setup.sh" ]; then
    echo "✓ setup.sh is executable"
else
    echo "❌ setup.sh is not executable"
    ERRORS=$((ERRORS + 1))
fi

if [ -x "scripts/project-wizard.py" ]; then
    echo "✓ project-wizard.py is executable"
else
    echo "❌ project-wizard.py is not executable"
    ERRORS=$((ERRORS + 1))
fi

# Check Python syntax
echo ""
echo "Checking Python syntax..."
if python3 -m py_compile scripts/project-wizard.py 2>/dev/null; then
    echo "✓ project-wizard.py syntax valid"
else
    echo "❌ project-wizard.py has syntax errors"
    ERRORS=$((ERRORS + 1))
fi

# Check for common issues
echo ""
echo "Checking for common issues..."

# Check if .env is accidentally included
if [ -f ".env" ]; then
    echo "⚠️  .env file found - this should not be in the skeleton"
    ERRORS=$((ERRORS + 1))
else
    echo "✓ No .env file (good)"
fi

# Check if venv is accidentally included
if [ -d "src/venv" ]; then
    echo "⚠️  venv directory found - this should not be in the skeleton"
    ERRORS=$((ERRORS + 1))
else
    echo "✓ No venv directory (good)"
fi

# Check if .git is accidentally included (for skeleton distribution)
if [ -d ".git" ]; then
    echo "⚠️  .git directory found - remove before distributing skeleton"
else
    echo "✓ No .git directory (good for distribution)"
fi

# Summary
echo ""
echo "============================="
if [ $ERRORS -eq 0 ]; then
    echo "✅ Skeleton validation passed!"
    echo "Ready for distribution."
else
    echo "❌ Found $ERRORS issues that need to be fixed."
    exit 1
fi