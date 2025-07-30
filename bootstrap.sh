#!/bin/bash

# Project Setup Script - Improved Version
# This script checks all dependencies and can auto-install missing ones

echo "🚀 Project Setup Script"
echo "======================"

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
    echo "   - Node.js: https://nodejs.org/"
else
    echo "❌ Unsupported OS: $OSTYPE"
    exit 1
fi

echo "✓ Detected OS: $OS"

# Check Python (special handling for version)
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
    if [ "$OS" == "linux" ] && [ "$DISTRO" == "debian" ]; then
        MISSING_DEPS+=("python3.11 python3.11-venv")
    elif [ "$OS" == "mac" ]; then
        MISSING_DEPS+=("python@3.11")
    fi
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

# Check SQLite
echo -n "Checking SQLite3... "
if command -v sqlite3 &> /dev/null; then
    SQLITE_VERSION=$(sqlite3 --version | cut -d' ' -f1)
    echo "✓ Found SQLite $SQLITE_VERSION"
else
    echo "❌ SQLite3 not found"
    MISSING_DEPS+=("sqlite3")
    ERRORS=$((ERRORS + 1))
fi

# Check Node.js (optional)
echo -n "Checking Node.js (optional)... "
if command -v node &> /dev/null; then
    NODE_VERSION=$(node -v)
    echo "✓ Found Node.js $NODE_VERSION"
else
    echo "⚠️  Node.js not found"
    if [ -n "$INSTALL_CMD" ]; then
        # Note it but don't add to required deps since it's optional
        echo "   (Can be installed with: $INSTALL_CMD nodejs)"
    fi
    WARNINGS=$((WARNINGS + 1))
fi

# Summary of checks
echo ""
echo "======================"
echo "Check Summary:"
echo "✓ Checks passed: $((4 - ERRORS - WARNINGS))"
if [ $ERRORS -gt 0 ]; then
    echo "❌ Required missing: $ERRORS"
fi
if [ $WARNINGS -gt 0 ]; then
    echo "⚠️  Optional missing: $WARNINGS"
fi

# Offer to install missing dependencies
if [ ${#MISSING_DEPS[@]} -gt 0 ] && [ -n "$INSTALL_CMD" ] && [ "$OS" != "windows" ]; then
    echo ""
    echo "Missing dependencies: ${MISSING_DEPS[*]}"
    echo ""
    read -p "Would you like to install missing dependencies? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Installing dependencies..."
        
        # Special handling for Python on Ubuntu/Debian
        if [[ "$OS" == "linux" ]] && [[ "$DISTRO" == "debian" ]] && [[ " ${MISSING_DEPS[@]} " =~ " python3.11 " ]]; then
            echo "Adding Python repository..."
            sudo add-apt-repository ppa:deadsnakes/ppa -y
            sudo apt-get update
        fi
        
        # Install all missing dependencies
        $INSTALL_CMD ${MISSING_DEPS[*]}
        
        echo "✓ Dependencies installed. Please run this script again."
        exit 0
    fi
fi

# Exit if required dependencies are missing
if [ $ERRORS -gt 0 ]; then
    echo ""
    echo "❌ Cannot continue without required dependencies."
    echo "Please install them manually or re-run with 'y' to auto-install."
    echo ""
    echo "Manual installation commands:"
    if [ "$OS" == "linux" ]; then
        echo "  Ubuntu/Debian: sudo apt-get install python3.11 python3.11-venv git sqlite3"
        echo "  Fedora: sudo dnf install python3.11 git sqlite"
        echo "  Arch: sudo pacman -S python git sqlite"
    elif [ "$OS" == "mac" ]; then
        echo "  macOS: brew install python@3.11 git sqlite3"
    fi
    exit 1
fi

# Continue with setup if all required dependencies are present
echo ""
echo "✓ All required dependencies found!"
echo ""

# Ensure project directories exist (most should already exist)
echo "Checking project directories..."
mkdir -p src/venv 2>/dev/null || true
echo "✓ Project directories verified"

echo "Setting up Python environment..."

cd src 2>/dev/null || { echo "Creating src directory..."; mkdir -p src && cd src; }

if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    $PYTHON_CMD -m venv venv
    echo "✓ Virtual environment created"
else
    echo "✓ Virtual environment already exists"
fi

# Activate virtual environment and install dependencies
echo "Installing Python dependencies..."
if [[ "$OS" == "windows" ]]; then
    source venv/Scripts/activate
else
    source venv/bin/activate
fi

# Create requirements.txt if it doesn't exist
if [ ! -f "requirements.txt" ]; then
    echo "Creating requirements.txt..."
    cat > requirements.txt << EOF
# Core Flask Dependencies - INSTALLED BY CLAUDE DURING SETUP
# Claude will replace comments with exact versions during setup phase

# Core Flask stack
Flask
python-dotenv
Werkzeug

# Development tools
autopep8
pylint

# Project-specific dependencies will be added by Claude based on project needs:
# Database: SQLAlchemy, Flask-SQLAlchemy
# Auth: Flask-WTF, Flask-Login
# APIs: requests
# Production: gunicorn, psycopg2-binary
# etc.
EOF
    echo "✓ Created requirements.txt template"
    echo ""
    echo "Note: Claude Code will install dependencies with exact versions during setup"
fi

# Create .env template
cd ..
if [ ! -f ".env.example" ]; then
    echo "Creating .env.example..."
    cat > .env.example << EOF
# Environment Configuration
FLASK_APP=app.py
FLASK_ENV=development
SECRET_KEY=your-secret-key-here

# Database
DATABASE_URL=sqlite:///database.db

# Future configurations (uncomment when needed)
# MAIL_SERVER=smtp.gmail.com
# MAIL_PORT=587
# MAIL_USERNAME=your-email@gmail.com
# MAIL_PASSWORD=your-app-password

# API Keys (add as needed)
# OPENAI_API_KEY=sk-...
# STRIPE_SECRET_KEY=sk_test_...
EOF
    echo "✓ Created .env.example"
fi

# Create .gitignore if it doesn't exist
if [ ! -f ".gitignore" ]; then
    echo "Creating .gitignore..."
    cat > .gitignore << EOF
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
venv/
env/
ENV/

# Environment
.env
.env.local
.env.*.local

# Database
*.db
*.sqlite
*.sqlite3

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Logs
*.log

# Testing
.pytest_cache/
.coverage
htmlcov/

# Production
dist/
build/
*.egg-info/
EOF
    echo "✓ Created .gitignore"
fi

# Create initial app structure
if [ ! -f "src/app.py" ]; then
    echo "Creating basic Flask app..."
    cat > src/app.py << EOF
from flask import Flask, render_template
from dotenv import load_dotenv
from port_utils import get_project_port_from_env
import os

# Load environment variables
load_dotenv()

# Create Flask app
app = Flask(__name__)
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY', 'dev-secret-key')

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    # Get project-specific port (from .env or auto-selected)
    port = get_project_port_from_env()
    project_name = os.path.basename(os.getcwd())
    
    print(f"Starting {project_name} on http://localhost:{port}")
    print(f"Press CTRL+C to quit")
    
    app.run(debug=True, host='0.0.0.0', port=port)
EOF
    echo "✓ Created app.py with intelligent port selection"
fi

# Create basic templates
mkdir -p src/templates
if [ ! -f "src/templates/base.html" ]; then
    cat > src/templates/base.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{% block title %}My App{% endblock %}</title>
    <link rel="stylesheet" href="{{ url_for('static', filename='css/style.css') }}">
    {% block extra_head %}{% endblock %}
</head>
<body>
    <header>
        <nav>
            <a href="/">Home</a>
        </nav>
    </header>
    
    <main>
        {% block content %}{% endblock %}
    </main>
    
    <footer>
        <p>&copy; 2024 My App. All rights reserved.</p>
    </footer>
    
    <script src="{{ url_for('static', filename='js/main.js') }}"></script>
    {% block extra_scripts %}{% endblock %}
</body>
</html>
EOF
    echo "✓ Created base template"
fi

if [ ! -f "src/templates/index.html" ]; then
    cat > src/templates/index.html << EOF
{% extends "base.html" %}

{% block title %}Home - My App{% endblock %}

{% block content %}
<div class="container">
    <h1>Welcome to Your New Project</h1>
    <p>This is your starting point. Begin building something amazing!</p>
</div>
{% endblock %}
EOF
    echo "✓ Created index template"
fi

# Create basic CSS
mkdir -p src/static/css
if [ ! -f "src/static/css/style.css" ]; then
    cat > src/static/css/style.css << EOF
/* Reset and Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
    line-height: 1.6;
    color: #333;
    background-color: #f8f9fa;
}

/* Utility Classes */
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.text-center { text-align: center; }
.mt-4 { margin-top: 2rem; }
.mb-4 { margin-bottom: 2rem; }
.p-4 { padding: 2rem; }

/* Layout */
header {
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    padding: 1rem 0;
}

nav a {
    text-decoration: none;
    color: #333;
    margin: 0 1rem;
}

main {
    min-height: calc(100vh - 120px);
    padding: 2rem 0;
}

footer {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 1rem 0;
}

/* Components */
.btn {
    display: inline-block;
    padding: 0.5rem 1rem;
    background-color: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 4px;
    border: none;
    cursor: pointer;
}

.btn:hover {
    background-color: #0056b3;
}
EOF
    echo "✓ Created base CSS"
fi

# Create basic JavaScript
mkdir -p src/static/js
if [ ! -f "src/static/js/main.js" ]; then
    cat > src/static/js/main.js << EOF
// Main JavaScript file
document.addEventListener('DOMContentLoaded', function() {
    console.log('App initialized');
    
    // Add your JavaScript here
});
EOF
    echo "✓ Created main.js"
fi

# Check Git configuration
echo ""
echo "Checking Git configuration..."

# Check if user.email is set
if ! git config --global user.email &> /dev/null; then
    echo "Git user email not configured."
    read -p "Enter your email for Git commits: " git_email
    git config --global user.email "$git_email"
    echo "✓ Git email set to: $git_email"
else
    echo "✓ Git email already configured: $(git config --global user.email)"
fi

# Check if user.name is set
if ! git config --global user.name &> /dev/null; then
    echo "Git user name not configured."
    read -p "Enter your name for Git commits: " git_name
    git config --global user.name "$git_name"
    echo "✓ Git name set to: $git_name"
else
    echo "✓ Git name already configured: $(git config --global user.name)"
fi

# Set default branch to main if not set
if ! git config --global init.defaultBranch &> /dev/null; then
    git config --global init.defaultBranch main
    echo "✓ Default branch set to 'main'"
fi

# Initialize Git repository
echo ""
echo "Initializing Git repository..."
if [ -d ".git" ]; then
    echo "✓ Git repository already exists"
else
    git init
    echo "✓ Git repository initialized"
    
    # Create initial commit
    read -p "Would you like to create an initial commit? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git add .
        git commit -m "Initial commit - project skeleton"
        echo "✓ Initial commit created"
        
        # Offer to create GitHub repository
        echo ""
        read -p "Would you like to create a GitHub repository? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            # Check if GitHub CLI is installed
            if command -v gh &> /dev/null; then
                echo ""
                echo "GitHub CLI detected! Let's create a repository."
                read -p "Repository name (default: ${PWD##*/}): " repo_name
                repo_name=${repo_name:-${PWD##*/}}
                
                read -p "Make repository private? (y/n) " -n 1 -r
                echo
                if [[ $REPLY =~ ^[Yy]$ ]]; then
                    visibility="--private"
                else
                    visibility="--public"
                fi
                
                echo "Creating GitHub repository..."
                if gh repo create "$repo_name" $visibility --source=. --remote=origin --push; then
                    echo "✓ GitHub repository created and code pushed!"
                    echo "✓ View your repo at: https://github.com/$(git config user.name)/$repo_name"
                else
                    echo "❌ Failed to create repository. You may need to login first:"
                    echo "   gh auth login"
                fi
            else
                echo ""
                echo "To create a GitHub repository:"
                echo "1. Go to https://github.com/new"
                echo "2. Create a new repository (don't initialize with README)"
                echo "3. Run these commands:"
                echo ""
                echo "   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git"
                echo "   git branch -M main"
                echo "   git push -u origin main"
                echo ""
                echo "💡 Tip: Install GitHub CLI for easier setup:"
                echo "   https://cli.github.com/manual/installation"
            fi
        fi
    else
        echo "⚠️  Remember to commit your initial files when ready:"
        echo "   git add ."
        echo "   git commit -m 'Initial commit'"
    fi
fi

# Guide to Claude Code setup
echo ""
echo "🤖 Project is ready for Claude Code!"
echo ""
echo "✅ Bootstrap Complete!"
echo ""
echo "Next steps:"
echo "1. Start Claude Code:"
echo "   claude"
echo ""
echo "2. Begin with setup phase:"
echo "   /setup start"
echo ""
echo "3. Claude will then:"
echo "   • Ask about your project"
echo "   • Help create documentation"
echo "   • Plan your implementation"
echo ""
echo "4. When ready to build:"
echo "   /setup complete"
echo ""
echo "📖 See USER_GUIDE/ for detailed documentation"
echo ""
echo "Happy building! 🎉"