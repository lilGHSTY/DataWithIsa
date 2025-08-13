# DataWithIsa - Quick Start Guide

> **For working on this project from ANY computer, anywhere.**

## 🚀 30-Second Setup (New Computer)

```bash
# 1. Clone the project
git clone https://github.com/lilGHSTY/DataWithIsa.git
cd DataWithIsa

# 2. Copy environment template
cp .env.example .env

# 3. Start everything
docker-compose up --build
```

**That's it!** Visit http://localhost:5689 to see your site.

---

## 📋 Prerequisites

### **Required Software**
- **Git** (for cloning)
- **Docker & Docker Compose** (for running the app)
- **Text Editor** (VS Code, etc.)

### **Optional but Recommended**
- **GitHub CLI** (`gh`) for repository management
- **Claude Code** for AI-assisted development

### **System Requirements**
- **OS**: Linux, macOS, or Windows with WSL2
- **RAM**: 4GB minimum (8GB recommended)
- **Storage**: 2GB free space
- **Network**: Internet for Docker image downloads

---

## 🛠️ Detailed Setup Steps

### **Step 1: Install Prerequisites**

#### **Docker (Required)**
```bash
# Ubuntu/Pop!_OS
sudo apt update && sudo apt install docker.io docker-compose

# macOS (with Homebrew)
brew install docker docker-compose

# Windows
# Download Docker Desktop from docker.com
```

#### **GitHub CLI (Optional)**
```bash
# Ubuntu/Pop!_OS  
sudo apt install gh

# macOS
brew install gh

# Authenticate
gh auth login
```

### **Step 2: Clone and Setup**
```bash
# Clone the repository
git clone https://github.com/lilGHSTY/DataWithIsa.git
cd DataWithIsa

# Copy environment template
cp .env.example .env

# Edit .env with your actual values (optional for development)
nano .env  # or use your preferred editor
```

### **Step 3: Start Development**
```bash
# Build and start all services
docker-compose up --build

# Or run in background
docker-compose up -d --build

# View logs
docker-compose logs -f web
```

### **Step 4: Verify Everything Works**
- **Website**: http://localhost:5689
- **Health Check**: http://localhost:5689/health
- **Database**: `docker-compose logs db` (should show PostgreSQL ready)

---

## 🧭 Understanding the Project

### **What You're Running**
- **Web App**: Flask application on port 5689
- **Database**: PostgreSQL container with persistent data
- **Static Assets**: CSS/JS served directly by Flask

### **Key Files**
- **`src/app.py`**: Main Flask application
- **`src/templates/`**: HTML pages (Jinja2 templates)
- **`src/static/`**: CSS, JavaScript, images
- **`docker-compose.yml`**: Development environment
- **`.env`**: Your local configuration

### **Important Directories**
- **`.claude/`**: Claude Code configuration and decisions
- **`drafts/`**: Project planning documents
- **`src/`**: All application code

---

## 🎯 Development Workflow

### **Making Changes**
1. **Edit files** in `src/` directory
2. **Refresh browser** - changes appear immediately
3. **Commit frequently** to save progress
4. **Push to GitHub** to backup work

### **Common Commands**
```bash
# Start development
docker-compose up

# Stop everything
docker-compose down

# Rebuild after changing requirements.txt
docker-compose up --build

# View logs
docker-compose logs -f web

# Check what's running
docker-compose ps

# Reset database (if needed)
docker-compose down -v && docker-compose up --build
```

### **Working with Claude Code**
```bash
# Start Claude Code in project directory
claude

# First thing to say in any session:
# "Please read CLAUDE.md and follow the Session Startup Checklist"

# Key Claude commands:
# /research [topic] - Research before implementing
# /context verify - Show loaded documentation
```

---

## 🚨 Troubleshooting

### **Port 5689 Already in Use**
```bash
# Find what's using the port
lsof -i :5689

# Kill the process
sudo kill -9 <PID>

# Or change port in .env file
echo "PORT=5690" >> .env
```

### **Docker Issues**
```bash
# Restart Docker daemon
sudo systemctl restart docker

# Clean up Docker (removes unused containers/images)
docker system prune

# Rebuild everything from scratch
docker-compose down -v
docker-compose up --build
```

### **Permission Issues (Linux)**
```bash
# Add user to docker group
sudo usermod -aG docker $USER
newgrp docker

# Test Docker without sudo
docker run hello-world
```

### **Database Connection Problems**
```bash
# Check if PostgreSQL container is running
docker-compose ps

# Connect to database directly
docker exec -it datawithisa-db-1 psql -U dataisa -d datawithisa

# Reset database
docker-compose down -v && docker-compose up --build
```

---

## 📱 Mobile Development

### **Accessing from Phone/Tablet**
1. **Find your computer's IP**: `ip addr show` (Linux) or `ipconfig` (Windows)
2. **Visit**: `http://YOUR_IP:5689` from mobile browser
3. **Useful for**: Testing mobile responsiveness

### **Ngrok (For External Access)**
```bash
# Install ngrok
# Then expose your local server
ngrok http 5689

# Share the generated URL with clients for testing
```

---

## 🔐 Security Notes

### **Never Commit These Files**
- **`.env`** - Contains secrets and API keys
- **`*.log`** - May contain sensitive information
- **`database.db`** - Local database files

### **Safe to Commit**
- **`.env.example`** - Template without real secrets
- **All code** in `src/` directory
- **Documentation** and configuration files

### **Production Considerations**
- **Change default passwords** in `.env`
- **Use strong SECRET_KEY** (generate with `openssl rand -hex 32`)
- **Update database credentials** for production

---

## 🎯 What's Next?

### **Immediate Development Tasks**
1. **Magic link authentication** - Password-free client login
2. **Dashboard builder** - Admin interface for creating dashboards
3. **Jina.ai integration** - AI-powered data extraction
4. **Contact form processing** - Email handling for consultations

### **Business Tasks**
1. **Content creation** - Write about page, example dashboards
2. **Email setup** - Configure SendGrid with isa@datawithisa.com
3. **Client acquisition** - Start reaching out to potential clients
4. **Pricing optimization** - Test different pricing strategies

### **Deployment Tasks**
1. **Domain setup** - Point datawithisa.com to server
2. **Digital Ocean deployment** - Move to production hosting
3. **SSL certificates** - Secure connections with Let's Encrypt
4. **Monitoring** - Set up health checks and alerts

---

## 📞 Getting Help

### **Documentation**
- **README.md** - Full project overview
- **CLAUDE.md** - Claude Code instructions
- **.claude/DECISIONS.md** - Technical decisions
- **.claude/CONVENTIONS.md** - Coding standards

### **Support**
- **GitHub Issues** - Report bugs or problems
- **Claude Code** - Ask questions during development
- **Project Files** - All context is in the repository

---

**🚀 Happy coding from anywhere! The project is fully portable and ready for development.**