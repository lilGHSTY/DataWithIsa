#!/bin/bash

# Environment Preparation Script
# Handles system-level setup, leaves project setup to Claude Code

echo "🚀 Environment Preparation"
echo "========================="

# Initialize variables
ERRORS=0
WARNINGS=0
OS=""
PYTHON_CMD=""
INSTALL_CMD=""
MISSING_DEPS=()

# Detect OS and package manager
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
    if command -v apt-get &> /dev/null; then
        INSTALL_CMD="sudo apt-get install -y"
        DISTRO="debian"
    elif command -v dnf &> /dev/null; then
        INSTALL_CMD="sudo dnf install -y"
        DISTRO="fedora"
    elif command -v pacman &> /dev/null; then
        INSTALL_CMD="sudo pacman -S --noconfirm"
        DISTRO="arch"
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="mac"
    if command -v brew &> /dev/null; then
        INSTALL_CMD="brew install"
    else
        echo "⚠️  Homebrew not found. Install from https://brew.sh"
        WARNINGS=$((WARNINGS + 1))
    fi
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    OS="windows"
    echo "⚠️  Windows detected. Please install dependencies manually:"
    echo "   - Python 3.11+: https://www.python.org/downloads/"
    echo "   - Git: https://git-scm.com/download/win"
else
    echo "❌ Unsupported OS: $OSTYPE"
    exit 1
fi

echo "✓ Detected OS: $OS"

# Check Python
echo -n "Checking Python 3.11+... "
PYTHON_FOUND=false
for py_cmd in python3.13 python3.12 python3.11 python3 python; do
    if command -v $py_cmd &> /dev/null; then
        PYTHON_VERSION=$($py_cmd -c 'import sys; print(".".join(map(str, sys.version_info[:2])))' 2>/dev/null || echo "0.0")
        if [[ "$PYTHON_VERSION" == "3.11" ]] || [[ "$PYTHON_VERSION" == "3.12" ]] || [[ "$PYTHON_VERSION" == "3.13" ]]; then
            echo "✓ Found Python $PYTHON_VERSION"
            PYTHON_CMD="$py_cmd"
            PYTHON_FOUND=true
            break
        fi
    fi
done

if [ "$PYTHON_FOUND" = false ]; then
    echo "❌ Python 3.11+ required"
    ERRORS=$((ERRORS + 1))
fi

# Check Git
echo -n "Checking Git... "
if command -v git &> /dev/null; then
    GIT_VERSION=$(git --version)
    echo "✓ Found $GIT_VERSION"
else
    echo "❌ Git not found"
    MISSING_DEPS+=("git")
    ERRORS=$((ERRORS + 1))
fi

# Summary
echo ""
echo "========================="
echo "Check Summary:"
echo "✓ Checks passed: $((2 - ERRORS))"
if [ $ERRORS -gt 0 ]; then
    echo "❌ Required missing: $ERRORS"
fi

# Exit if missing dependencies
if [ $ERRORS -gt 0 ]; then
    echo ""
    echo "❌ Cannot continue without required dependencies."
    echo "Please install them and run this script again."
    exit 1
fi

# Create virtual environment
echo ""
echo "Creating Python virtual environment..."
mkdir -p src
cd src

if [ ! -d "venv" ]; then
    $PYTHON_CMD -m venv venv
    echo "✓ Virtual environment created"
else
    echo "✓ Virtual environment already exists"
fi

cd ..

# Create minimal .gitignore
if [ ! -f ".gitignore" ]; then
    echo "Creating .gitignore..."
    cat > .gitignore << EOF
# Python
__pycache__/
*.py[cod]
venv/
.Python

# Environment
.env
.env.local

# IDE
.vscode/
.idea/
*.swp

# OS
.DS_Store
Thumbs.db

# Database
*.db
*.sqlite

# Logs
*.log

# Testing
.pytest_cache/
.coverage
EOF
    echo "✓ Created .gitignore"
fi

# Initialize Git
echo ""
echo "Initializing Git repository..."
if [ -d ".git" ]; then
    echo "✓ Git repository already exists"
else
    git init
    echo "✓ Git repository initialized"
fi

# Check Git configuration
if ! git config --global user.email &> /dev/null; then
    echo ""
    echo "Git user email not configured."
    read -p "Enter your email for Git commits: " git_email
    git config --global user.email "$git_email"
fi

if ! git config --global user.name &> /dev/null; then
    echo "Git user name not configured."
    read -p "Enter your name for Git commits: " git_name
    git config --global user.name "$git_name"
fi

# Final message
echo ""
echo "✅ Environment Ready!"
echo ""
echo "Your development environment is prepared. Next steps:"
echo ""
echo "1. Start Claude Code:"
echo "   claude"
echo ""
echo "2. Say to Claude:"
echo "   'Please help me set up this project'"
echo ""
echo "Claude will:"
echo " • Learn about your project through conversation"
echo " • Create the right file structure"
echo " • Install appropriate dependencies"
echo " • Set up your development environment"
echo " • Help you start building"
echo ""
echo "Ready to begin! 🚀"