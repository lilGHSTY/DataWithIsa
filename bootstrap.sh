#!/bin/bash
# Web Starter Kit - Docker-First Bootstrap Script
# Installs system dependencies and Docker setup only
# Claude Code handles all Python dependencies during setup phase

set -e  # Exit on any error

echo "🚀 Web Starter Kit - Docker-First Bootstrap"
echo "============================================"
echo "Installing system dependencies and Docker setup"
echo "Claude Code will handle Python packages during setup phase"
echo ""

# Color functions
print_success() { echo -e "\033[32m✅ $1\033[0m"; }
print_error() { echo -e "\033[31m❌ $1\033[0m"; }
print_info() { echo -e "\033[34mℹ️  $1\033[0m"; }
print_warning() { echo -e "\033[33m⚠️  $1\033[0m"; }

# Detect Linux distribution (focusing on Linux as requested)
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    print_error "This script is designed for Linux systems only"
    print_info "For other systems, please install dependencies manually:"
    print_info "- Docker: https://docs.docker.com/get-docker/"
    print_info "- Node.js: https://nodejs.org/"
    print_info "- Git: Available through system package manager"
    exit 1
fi

print_success "Linux system detected"

# Check for required system commands
check_system_deps() {
    print_info "Checking system dependencies..."
    
    local missing_deps=()
    
    # Check curl (needed for installations)
    if ! command -v curl &> /dev/null; then
        missing_deps+=("curl")
    fi
    
    # Check Git
    if ! command -v git &> /dev/null; then
        missing_deps+=("git")
    fi
    
    if [ ${#missing_deps[@]} -gt 0 ]; then
        print_warning "Installing missing system dependencies: ${missing_deps[*]}"
        sudo apt update
        sudo apt install -y "${missing_deps[@]}"
        print_success "System dependencies installed"
    else
        print_success "All system dependencies present"
    fi
}

# Install Docker (various methods for reliability)
install_docker() {
    print_info "Checking Docker installation..."
    
    if command -v docker &> /dev/null; then
        print_success "Docker already installed: $(docker --version)"
        return
    fi
    
    print_info "Installing Docker..."
    
    # Method 1: Try snap (most reliable on many Linux distros)
    if command -v snap &> /dev/null; then
        print_info "Installing Docker via snap..."
        sudo snap install docker
        sudo snap start docker
        
        # Add user to docker group
        sudo groupadd docker 2>/dev/null || true
        sudo usermod -a -G docker $USER
        
        print_success "Docker installed via snap"
    else
        # Method 2: Official Docker installation
        print_info "Installing Docker via official script..."
        curl -fsSL https://get.docker.com -o get-docker.sh
        sudo sh get-docker.sh
        sudo usermod -a -G docker $USER
        sudo systemctl start docker
        sudo systemctl enable docker
        rm get-docker.sh
        
        print_success "Docker installed via official script"
    fi
    
    print_warning "You may need to log out and back in for Docker permissions to take effect"
}

# Test Docker installation
test_docker() {
    print_info "Testing Docker installation..."
    
    # Test if Docker daemon is running
    if ! docker info &> /dev/null; then
        print_warning "Docker daemon not running, attempting to start..."
        
        # Try different methods to start Docker
        if command -v snap &> /dev/null && snap list docker &> /dev/null; then
            sudo snap start docker
        else
            sudo systemctl start docker
        fi
        
        sleep 3
    fi
    
    # Test with hello-world (suppress output)
    if docker run --rm hello-world &> /dev/null; then
        print_success "Docker working correctly"
    else
        print_error "Docker test failed - may need manual configuration"
        print_info "Try running: sudo docker run hello-world"
        print_info "If that fails, you may need to log out and back in"
    fi
}

# Install Node.js and npm (for Playwright MCP)
install_node() {
    print_info "Checking Node.js installation..."
    
    if command -v node &> /dev/null && command -v npm &> /dev/null; then
        print_success "Node.js already installed: $(node --version)"
        return
    fi
    
    print_info "Installing Node.js..."
    
    # Use NodeSource repository for latest stable
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
    
    print_success "Node.js installed: $(node --version)"
}

# Fix Playwright MCP for Linux (critical improvement)
fix_playwright_linux() {
    print_info "Configuring Playwright MCP for Linux..."
    
    # Install Chrome browser dependencies
    print_info "Installing Google Chrome for Playwright..."
    
    # Add Google's signing key and repository
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    
    sudo apt update
    sudo apt install -y google-chrome-stable
    
    print_success "Chrome installed for Playwright browser automation"
    
    # Install Playwright MCP globally
    print_info "Installing Playwright MCP..."
    npm install -g @playwright/mcp
    
    # Install browser binaries
    npx playwright install chromium firefox webkit
    
    print_success "Playwright MCP configured for Linux"
    print_warning "Restart Claude Code after setup to activate Playwright MCP"
}

# Create project structure
create_project_structure() {
    print_info "Creating enhanced project structure..."
    
    # Create directories
    mkdir -p src/{static/{css,js,images},templates/{layouts,pages,partials}}
    mkdir -p docs migrations tests research config
    
    # Create .gitignore if it doesn't exist
    if [ ! -f ".gitignore" ]; then
        cat > .gitignore << 'EOF'
# Environment
.env
.env.local
*.env

# Python
__pycache__/
*.pyc
*.pyo
venv/
*.egg-info/

# Database
*.db
*.sqlite*

# Docker
.dockerignore

# IDE
.vscode/
.idea/
*.swp

# OS
.DS_Store
Thumbs.db

# Logs
*.log
logs/

# Testing
.pytest_cache/
.coverage
htmlcov/
EOF
        print_success "Created .gitignore"
    fi
    
    # Copy port_utils.py if it exists, otherwise create it
    if [ -f "src/port_utils.py" ]; then
        print_success "Port selection system already exists"
    else
        cat > src/port_utils.py << 'EOF'
"""
Port selection utilities for Web Starter Kit projects.
Ensures each project gets a consistent, conflict-free port.
"""

import hashlib
import socket
import os


def select_project_port(project_name=None):
    """Smart port selection for the project."""
    if project_name is None:
        project_name = os.path.basename(os.getcwd())
    
    # Deterministic based on project name
    base_hash = int(hashlib.md5(project_name.lower().encode()).hexdigest()[:4], 16)
    suggested_port = 5000 + (base_hash % 1000)
    
    # Check if suggested port is available
    if is_port_available(suggested_port):
        return suggested_port
    
    # Find next available port in range
    for offset in range(1, 100):
        alternative_port = 5000 + ((base_hash + offset) % 1000)
        if is_port_available(alternative_port):
            return alternative_port
    
    # Fallback: Find any available port
    return find_random_available_port()


def is_port_available(port):
    """Check if a port is available for binding."""
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.bind(('localhost', port))
            return True
    except OSError:
        return False


def find_random_available_port(start_port=5000, max_attempts=100):
    """Find any available port starting from start_port."""
    for port in range(start_port, start_port + max_attempts):
        if is_port_available(port):
            return port
    
    raise RuntimeError(f"No free ports found in range {start_port}-{start_port + max_attempts}")


def get_project_port_from_env():
    """Get port from environment variable, with fallback to auto-selection."""
    port_env = os.getenv('PORT')
    if port_env:
        try:
            port = int(port_env)
            if is_port_available(port):
                return port
            else:
                print(f"Warning: Port {port} from environment is not available")
        except ValueError:
            print(f"Warning: Invalid port in environment: {port_env}")
    
    return select_project_port()


if __name__ == "__main__":
    project_name = os.path.basename(os.getcwd())
    port = select_project_port()
    print(f"Selected port {port} for project '{project_name}'")
    print(f"Port {port} available: {is_port_available(port)}")
EOF
        print_success "Created port selection system"
    fi
    
    print_success "Enhanced project structure created"
}

# Create basic requirements template (Claude will populate with latest versions)
create_requirements_template() {
    if [ ! -f "src/requirements.txt" ]; then
        cat > src/requirements.txt << 'EOF'
# Core Flask Dependencies
# NOTE: Claude Code will install LATEST versions during setup phase
# This file serves as a template for dependency categories

# Core Flask stack
Flask
python-dotenv
Werkzeug

# Database (PostgreSQL for production)
SQLAlchemy
Flask-SQLAlchemy
psycopg2-binary

# Forms and validation
Flask-WTF
WTForms

# Development tools
autopep8

# Production server
gunicorn

# Project-specific dependencies will be added by Claude based on project needs
EOF
        print_success "Created requirements template (Claude will install latest versions)"
    fi
}

# Git configuration
configure_git() {
    print_info "Checking Git configuration..."
    
    # Check if user.email is set
    if ! git config --global user.email &> /dev/null; then
        print_warning "Git user email not configured"
        read -p "Enter your email for Git commits: " git_email
        git config --global user.email "$git_email"
        print_success "Git email configured"
    else
        print_success "Git email already configured: $(git config --global user.email)"
    fi
    
    # Check if user.name is set
    if ! git config --global user.name &> /dev/null; then
        print_warning "Git user name not configured"
        read -p "Enter your name for Git commits: " git_name
        git config --global user.name "$git_name"
        print_success "Git name configured"
    else
        print_success "Git name already configured: $(git config --global user.name)"
    fi
    
    # Set default branch to main
    git config --global init.defaultBranch main 2>/dev/null || true
    
    print_success "Git configuration complete"
}

# Initialize Git repository
init_git_repo() {
    if [ ! -d ".git" ]; then
        print_info "Initializing Git repository..."
        git init
        print_success "Git repository initialized"
    else
        print_success "Git repository already exists"
    fi
}

# Main execution
main() {
    echo "🔧 System Dependency Installation"
    echo "================================="
    
    check_system_deps
    install_docker
    test_docker
    install_node
    fix_playwright_linux
    
    echo ""
    echo "📁 Project Structure Setup"
    echo "=========================="
    
    create_project_structure
    create_requirements_template
    configure_git
    init_git_repo
    
    echo ""
    print_success "🎉 Bootstrap Complete!"
    echo ""
    echo "✅ System dependencies installed:"
    echo "   • Docker with container support"
    echo "   • Node.js with Playwright MCP"
    echo "   • Chrome browser for automation"
    echo "   • Git version control"
    echo ""
    echo "📁 Project structure created:"
    echo "   • Enhanced directory layout"
    echo "   • Requirements template"
    echo "   • Port selection system"
    echo ""
    echo "🚀 Next Steps:"
    echo "1. Start Claude Code:"
    echo "   claude"
    echo ""
    echo "2. Begin setup phase:"
    echo "   /setup start"
    echo ""
    echo "3. Claude will:"
    echo "   • Install latest Python dependencies"
    echo "   • Create Docker configuration"
    echo "   • Build professional documentation"
    echo "   • Set up database containers"
    echo "   • Verify Playwright MCP functionality"
    echo ""
    echo "4. Complete setup:"
    echo "   /setup complete"
    echo ""
    print_warning "Remember to restart Claude Code after setup to activate Playwright MCP"
    echo ""
    echo "Happy building! 🎉"
}

# Run main function
main "$@"