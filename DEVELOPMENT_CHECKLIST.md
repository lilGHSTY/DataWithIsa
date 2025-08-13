# DataWithIsa - Development Checklist

> **Portable development checklist for working from anywhere**

## ✅ New Machine Setup (5 minutes)

### **Prerequisites Check**
- [ ] **Docker installed**: `docker --version`
- [ ] **Docker Compose installed**: `docker-compose --version` 
- [ ] **Git installed**: `git --version`
- [ ] **Internet connection**: For Docker image downloads

### **Project Setup**
- [ ] **Clone repository**: `git clone https://github.com/lilGHSTY/DataWithIsa.git`
- [ ] **Navigate to directory**: `cd DataWithIsa`
- [ ] **Copy environment**: `cp .env.example .env`
- [ ] **Start application**: `docker-compose up --build`
- [ ] **Test website**: Visit http://localhost:5689
- [ ] **Test health check**: Visit http://localhost:5689/health

### **Claude Code Setup**
- [ ] **Start Claude Code**: `claude` (in project directory)
- [ ] **Load context**: Say "Please read CLAUDE.md and follow the Session Startup Checklist"
- [ ] **Verify phase**: No SETUP.lock should exist (development mode)
- [ ] **Check documentation**: `.claude/DECISIONS.md` and `.claude/CONVENTIONS.md` loaded

---

## 🎯 Development Session Checklist

### **Every Time You Start Working**
- [ ] **Pull latest changes**: `git pull origin main`
- [ ] **Check running services**: `docker-compose ps`
- [ ] **Start if needed**: `docker-compose up -d`
- [ ] **Verify site loads**: http://localhost:5689
- [ ] **Start Claude Code**: Load with CLAUDE.md context

### **Before Making Changes**
- [ ] **Create feature branch**: `git checkout -b feature/description`
- [ ] **Understand current state**: Check recent commits with `git log --oneline -5`
- [ ] **Review docs**: Check `.claude/DECISIONS.md` for technical decisions
- [ ] **Test current state**: Ensure everything works before changes

### **During Development**
- [ ] **Commit frequently**: Small, focused commits with clear messages
- [ ] **Test changes**: Refresh browser and verify functionality
- [ ] **Follow conventions**: Use `.claude/CONVENTIONS.md` for code style
- [ ] **Document decisions**: Update `.claude/DECISIONS.md` for major choices

### **Before Finishing Session**
- [ ] **Test everything**: Full site functionality check
- [ ] **Commit all work**: `git add -A && git commit -m "description"`
- [ ] **Push to GitHub**: `git push origin branch-name`
- [ ] **Merge to main** (if feature complete): Create PR or merge directly
- [ ] **Update progress**: Note what was accomplished

---

## 🚀 Feature Development Checklist

### **Magic Link Authentication** (Next Priority)
- [ ] **Research**: Study Flask-Login alternatives for magic links
- [ ] **Database**: Create users, magic_links tables
- [ ] **Email service**: Configure SendGrid with isa@datawithisa.com
- [ ] **Routes**: Login, logout, verify-link endpoints
- [ ] **Templates**: Login form, check-email pages
- [ ] **Testing**: Full authentication flow

### **Dashboard Builder** (Admin Interface)
- [ ] **Authentication**: Admin-only access protection
- [ ] **Database**: Clients, dashboards, widgets tables
- [ ] **Interface**: Create/edit dashboard forms
- [ ] **Preview**: Live dashboard preview
- [ ] **Templates**: Admin interface pages

### **Data Integration** (Jina.ai)
- [ ] **API setup**: Jina.ai account and API key
- [ ] **Service layer**: Data extraction functions
- [ ] **Widget system**: Different chart types
- [ ] **Scheduling**: Automated data updates
- [ ] **Error handling**: Failed scraping recovery

### **Client Onboarding**
- [ ] **Contact form**: Process consultation requests
- [ ] **Email workflow**: Automated responses
- [ ] **Dashboard delivery**: Magic link email system
- [ ] **Client portal**: Dashboard access and navigation

---

## 🛠️ Maintenance Checklist

### **Weekly**
- [ ] **Pull latest changes**: `git pull origin main`
- [ ] **Update dependencies**: Check for security updates
- [ ] **Test full site**: All pages and functionality
- [ ] **Backup database**: If using persistent data
- [ ] **Check domain**: Ensure datawithisa.com is ready

### **Before Major Changes**
- [ ] **Create backup branch**: `git checkout -b backup/before-major-change`
- [ ] **Document current state**: What works, what doesn't
- [ ] **Plan rollback**: Know how to revert if needed
- [ ] **Test in isolation**: Use separate branch

### **Deployment Preparation**
- [ ] **Environment variables**: All secrets configured
- [ ] **Database migrations**: Ready for production
- [ ] **SSL certificates**: Let's Encrypt or Cloudflare
- [ ] **Monitoring**: Health checks and alerts
- [ ] **Backup strategy**: Database and file backups

---

## 🔧 Troubleshooting Checklist

### **Site Won't Start**
- [ ] **Check Docker**: `docker --version` and `docker-compose --version`
- [ ] **Check port**: `lsof -i :5689` (kill process if needed)
- [ ] **Check files**: `.env` exists with correct values
- [ ] **Rebuild containers**: `docker-compose down && docker-compose up --build`
- [ ] **Check logs**: `docker-compose logs -f web`

### **Database Issues**
- [ ] **Check container**: `docker-compose ps` (db should be running)
- [ ] **Check connection**: `docker exec -it container-name psql -U dataisa -d datawithisa`
- [ ] **Reset database**: `docker-compose down -v && docker-compose up --build`
- [ ] **Check environment**: DATABASE_URL in .env

### **Code Changes Not Appearing**
- [ ] **Check volumes**: `docker-compose.yml` should mount `./src:/app`
- [ ] **Restart containers**: `docker-compose restart web`
- [ ] **Clear browser cache**: Hard refresh (Ctrl+F5)
- [ ] **Check file paths**: Ensure changes are in mounted directory

### **Git Issues**
- [ ] **Check remote**: `git remote -v` (should point to DataWithIsa repo)
- [ ] **Pull conflicts**: `git status` and resolve merge conflicts
- [ ] **Authentication**: `gh auth status` for GitHub CLI
- [ ] **Reset if needed**: `git reset --hard origin/main` (loses local changes!)

---

## 📱 Mobile/Remote Development

### **Working from Tablet/Phone**
- [ ] **Use GitHub Codespaces**: Edit directly in browser
- [ ] **Use Termux** (Android): Basic git and text editing
- [ ] **Use SSH**: Connect to development machine remotely
- [ ] **Use ngrok**: Expose localhost for remote testing

### **Slow Internet Situations**
- [ ] **Use Git sparse-checkout**: Only essential files
- [ ] **Cache Docker images**: `docker pull` commonly used images
- [ ] **Work offline**: Local changes, sync when connected
- [ ] **Compress assets**: Optimize images and files

---

## 🎯 Success Metrics

### **Development Velocity**
- [ ] **Setup time**: <5 minutes on new machine
- [ ] **First commit**: <30 minutes from clone to working change
- [ ] **Daily commits**: At least one meaningful commit per day
- [ ] **Feature completion**: Track progress against roadmap

### **Code Quality**
- [ ] **No broken links**: All pages load correctly
- [ ] **Mobile responsive**: Test on different screen sizes
- [ ] **Performance**: <3 second page loads
- [ ] **Security**: No exposed secrets or vulnerabilities

### **Business Progress**
- [ ] **Landing page ready**: Professional appearance
- [ ] **Contact form working**: Can receive inquiries
- [ ] **Domain ready**: datawithisa.com configured
- [ ] **First client**: Revenue-generating dashboard delivered

---

**🚀 This checklist ensures consistent, portable development from anywhere in the world!**