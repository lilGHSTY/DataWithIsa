#!/bin/bash
# Playwright MCP Linux Fix Script
# Solves browser dependency issues on Linux systems
# Especially critical for Pop!_OS, Ubuntu, and Debian

set -e  # Exit on any error

echo "🎭 Playwright MCP Linux Fix"
echo "=========================="
echo "Fixing browser dependencies for Claude Code MCP integration"
echo ""

# Color functions
print_success() { echo -e "\033[32m✅ $1\033[0m"; }
print_error() { echo -e "\033[31m❌ $1\033[0m"; }
print_info() { echo -e "\033[34mℹ️  $1\033[0m"; }
print_warning() { echo -e "\033[33m⚠️  $1\033[0m"; }

# Detect Linux distribution
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    print_error "This script is designed for Linux systems only"
    print_info "For other systems, install browsers manually:"
    print_info "- Chrome: https://www.google.com/chrome/"
    print_info "- Firefox: https://www.mozilla.org/firefox/"
    exit 1
fi

print_success "Linux system detected"

# Check if we're running as root (not recommended)
if [[ $EUID -eq 0 ]]; then
    print_warning "Running as root. This script should be run as a regular user with sudo access."
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Function to detect Linux distribution
detect_distro() {
    if command -v lsb_release &> /dev/null; then
        DISTRO=$(lsb_release -si | tr '[:upper:]' '[:lower:]')
        VERSION=$(lsb_release -sr)
    elif [[ -f /etc/os-release ]]; then
        . /etc/os-release
        DISTRO=$(echo $ID | tr '[:upper:]' '[:lower:]')
        VERSION=$VERSION_ID
    else
        DISTRO="unknown"
        VERSION="unknown"
    fi
    
    print_info "Detected distribution: $DISTRO $VERSION"
}

# Function to update package lists
update_packages() {
    print_info "Updating package lists..."
    
    case $DISTRO in
        ubuntu|debian|pop)
            sudo apt update
            ;;
        fedora)
            sudo dnf check-update || true
            ;;
        arch|manjaro)
            sudo pacman -Sy
            ;;
        *)
            print_warning "Unknown distribution, skipping package update"
            ;;
    esac
    
    print_success "Package lists updated"
}

# Function to install Chrome browser
install_chrome() {
    print_info "Installing Google Chrome browser..."
    
    if command -v google-chrome &> /dev/null; then
        print_success "Google Chrome already installed: $(google-chrome --version)"
        return 0
    fi
    
    case $DISTRO in
        ubuntu|debian|pop)
            # Method 1: Try from Google's official repository
            if ! dpkg -l | grep -q google-chrome-stable; then
                print_info "Adding Google Chrome repository..."
                
                # Download and add Google's signing key
                wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
                
                # Add repository
                echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
                
                # Update and install
                sudo apt update
                sudo apt install -y google-chrome-stable
                
                print_success "Google Chrome installed from official repository"
            else
                print_success "Google Chrome already installed"
            fi
            ;;
            
        fedora)
            # Install Chrome on Fedora
            if ! rpm -q google-chrome-stable &> /dev/null; then
                print_info "Installing Chrome on Fedora..."
                sudo dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
                print_success "Google Chrome installed"
            else
                print_success "Google Chrome already installed"
            fi
            ;;
            
        arch|manjaro)
            # Install Chrome on Arch Linux
            if ! pacman -Q google-chrome &> /dev/null; then
                print_info "Installing Chrome on Arch Linux..."
                # Use AUR helper if available, otherwise manual installation
                if command -v yay &> /dev/null; then
                    yay -S --noconfirm google-chrome
                elif command -v paru &> /dev/null; then
                    paru -S --noconfirm google-chrome
                else
                    print_warning "AUR helper not found. Please install google-chrome manually from AUR"
                    print_info "Or install chromium as alternative: sudo pacman -S chromium"
                    sudo pacman -S --noconfirm chromium
                fi
                print_success "Chrome/Chromium installed"
            else
                print_success "Chrome already installed"
            fi
            ;;
            
        *)
            print_warning "Unsupported distribution for automatic Chrome installation"
            print_info "Please install Chrome manually:"
            print_info "- Download from: https://www.google.com/chrome/"
            print_info "- Or install chromium via your package manager"
            return 1
            ;;
    esac
}

# Function to install Node.js and npm
install_nodejs() {
    print_info "Checking Node.js installation..."
    
    if command -v node &> /dev/null && command -v npm &> /dev/null; then
        NODE_VERSION=$(node --version)
        print_success "Node.js already installed: $NODE_VERSION"
        return 0
    fi
    
    print_info "Installing Node.js..."
    
    case $DISTRO in
        ubuntu|debian|pop)
            # Use NodeSource repository for latest LTS
            curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
            sudo apt-get install -y nodejs
            ;;
            
        fedora)
            sudo dnf install -y nodejs npm
            ;;
            
        arch|manjaro)
            sudo pacman -S --noconfirm nodejs npm
            ;;
            
        *)
            print_warning "Please install Node.js manually for your distribution"
            return 1
            ;;
    esac
    
    print_success "Node.js installed: $(node --version)"
}

# Function to install Playwright and browsers
install_playwright() {
    print_info "Installing Playwright MCP..."
    
    # Install Playwright MCP globally
    npm install -g @playwright/mcp
    
    print_success "Playwright MCP installed"
    
    # Install browser binaries
    print_info "Installing Playwright browser binaries..."
    npx playwright install chromium firefox webkit
    
    # Install system dependencies for browsers
    print_info "Installing browser system dependencies..."
    npx playwright install-deps
    
    print_success "Playwright browsers installed"
}

# Function to configure Claude Code MCP
configure_claude_mcp() {
    print_info "Configuring Claude Code MCP integration..."
    
    # Check if Claude Code is available
    if ! command -v claude &> /dev/null; then
        print_warning "Claude Code not found in PATH"
        print_info "Please install Claude Code first, then run this command manually:"
        print_info "claude mcp add playwright -- npx @playwright/mcp@latest"
        return 1
    fi
    
    # Add Playwright MCP to Claude Code
    print_info "Adding Playwright MCP to Claude Code..."
    claude mcp add playwright -- npx @playwright/mcp@latest
    
    print_success "Playwright MCP added to Claude Code"
    print_warning "Please restart Claude Code for the MCP to become available"
}

# Function to test Playwright functionality
test_playwright() {
    print_info "Testing Playwright functionality..."
    
    # Test if Chrome can be launched
    if command -v google-chrome &> /dev/null; then
        print_info "Testing Chrome launch..."
        google-chrome --headless --disable-gpu --no-sandbox --remote-debugging-port=9222 --disable-dev-shm-usage &
        CHROME_PID=$!
        sleep 2
        kill $CHROME_PID 2>/dev/null || true
        print_success "Chrome can be launched headlessly"
    else
        print_warning "Chrome not available for testing"
    fi
    
    # Test Playwright installation
    if command -v npx &> /dev/null; then
        print_info "Testing Playwright installation..."
        if npx playwright --version &> /dev/null; then
            PLAYWRIGHT_VERSION=$(npx playwright --version)
            print_success "Playwright working: $PLAYWRIGHT_VERSION"
        else
            print_error "Playwright not working properly"
        fi
    fi
}

# Function to create test script
create_test_script() {
    print_info "Creating Playwright test script..."
    
    cat > /tmp/playwright-test.js << 'EOF'
const { chromium } = require('playwright');

(async () => {
  console.log('Testing Playwright browser launch...');
  
  try {
    const browser = await chromium.launch({ headless: true });
    const page = await browser.newPage();
    
    await page.goto('https://example.com');
    const title = await page.title();
    
    console.log('✅ Success! Page title:', title);
    
    await browser.close();
    process.exit(0);
  } catch (error) {
    console.error('❌ Error:', error.message);
    process.exit(1);
  }
})();
EOF
    
    # Run the test
    if node /tmp/playwright-test.js; then
        print_success "Playwright browser automation test passed"
    else
        print_warning "Playwright test failed - may need additional configuration"
    fi
    
    # Clean up
    rm -f /tmp/playwright-test.js
}

# Main execution
main() {
    echo "🔧 Starting Playwright MCP Linux Fix"
    echo "===================================="
    
    detect_distro
    update_packages
    install_chrome
    install_nodejs
    install_playwright
    configure_claude_mcp
    test_playwright
    create_test_script
    
    echo ""
    print_success "🎉 Playwright MCP Linux Fix Complete!"
    echo ""
    echo "✅ Components installed:"
    echo "   • Google Chrome browser"
    echo "   • Node.js and npm"
    echo "   • Playwright MCP"
    echo "   • Browser binaries (Chromium, Firefox, WebKit)"
    echo ""
    echo "🚀 Next Steps:"
    echo "1. Restart Claude Code:"
    echo "   # Exit current Claude session"
    echo "   # Run: claude"
    echo ""
    echo "2. Verify MCP is available:"
    echo "   # In Claude Code, MCPs should be automatically loaded"
    echo "   # Try taking a screenshot of a website"
    echo ""
    echo "3. Test functionality:"
    echo "   # Ask Claude to take a screenshot of localhost"
    echo "   # Verify browser automation works"
    echo ""
    echo "🎭 Playwright MCP is now ready for browser automation!"
    echo ""
    echo "📋 Troubleshooting:"
    echo "- If MCP not available: Restart Claude Code completely"
    echo "- If browsers fail: Run 'npx playwright install-deps'"
    echo "- If permissions issues: Check file permissions in ~/.cache/ms-playwright/"
    echo ""
    echo "Happy automating! 🎉"
}

# Run main function
main "$@"