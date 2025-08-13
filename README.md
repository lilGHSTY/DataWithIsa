# DataWithIsa

> Custom market intelligence dashboards built **FOR you**, not **BY you**. Affordable data insights for small businesses.

[![GitHub](https://img.shields.io/badge/GitHub-DataWithIsa-blue.svg)](https://github.com/lilGHSTY/DataWithIsa)
[![Docker](https://img.shields.io/badge/Docker-Ready-blue.svg)](https://docker.com)
[![Python](https://img.shields.io/badge/Python-3.11+-green.svg)](https://python.org)
[![Flask](https://img.shields.io/badge/Flask-3.0.3-red.svg)](https://flask.palletsprojects.com)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-blue.svg)](https://postgresql.org)

## 🎯 What DataWithIsa Offers

### **💡 The Problem We Solve**

Small businesses need data insights but lack:
- Time to learn complex analytics tools
- Budget for expensive enterprise solutions
- Technical skills to build custom dashboards
- Resources to hire data analysts

### **✅ Our Solution: Done-For-You Dashboards**

#### **📊 Custom Dashboard Creation**
- **Personalized consultation** to understand your specific needs
- **Hand-crafted dashboards** tailored to your industry
- **24-48 hour delivery** from consultation to working dashboard
- **No technical skills required** - just access your insights

#### **🔄 Intelligent Data Collection** 
- **AI-powered data extraction** using Jina.ai technology
- **Multiple data sources** integrated seamlessly
- **Automatic updates** (weekly, bi-weekly, or monthly)
- **Clean, structured insights** ready for decision-making

#### **🎨 Severance-Inspired Design**
- **Cozy office aesthetic** - warm and approachable, not cold corporate
- **Olivine green theme** (#8EAB81) for a calming, professional look
- **Mobile-responsive** for checking insights on the go
- **Intuitive navigation** designed for busy business owners

#### **💰 Transparent, Affordable Pricing**
- **Foundation Package**: $300/month for essential dashboards
- **Modular add-ons** starting at $50-150/month per widget
- **No hidden fees** or enterprise pricing games
- **Cancel anytime** with no long-term contracts

---

## 🏢 Perfect For These Businesses

### **🍽️ Local Service Businesses**
- **Restaurants** tracking reviews, foot traffic, and menu performance
- **Salons & Fitness Studios** monitoring customer satisfaction and bookings
- **Medical Practices** analyzing patient flow and service metrics

### **💼 Professional Consultants**
- **Marketing Consultants** tracking campaign performance and ROI
- **Financial Advisors** monitoring client portfolio performance
- **Business Consultants** demonstrating impact to clients

### **🛍️ E-commerce & Retail**
- **Amazon Sellers** tracking sales, inventory, and competition
- **Shopify Stores** monitoring conversion rates and customer behavior
- **Local Retailers** analyzing foot traffic and sales trends

### **🏠 Real Estate Professionals**
- **Agents** tracking market trends and property performance
- **Property Managers** monitoring rental metrics and maintenance
- **Investors** analyzing property ROI and market opportunities

---

## 🚀 Development Setup (For Contributors)

This application runs on **port 5689** and uses Docker for consistent development.

### Quick Start
```bash
git clone https://github.com/lilGHSTY/DataWithIsa.git
cd DataWithIsa
docker-compose up --build
```

Visit **http://localhost:5689** to see the landing page.

### Development Commands
```bash
# Start development server
docker-compose up

# Run in background
docker-compose up -d

# Stop containers
docker-compose down

# View logs
docker-compose logs -f web

# Check health
curl http://localhost:5689/health
```

---

## 🛠️ Technology Stack

### **Frontend**
- **HTML/CSS/JavaScript**: Vanilla approach for fast loading and simplicity
- **Design System**: Severance-inspired with Olivine green (#8EAB81) theme
- **Charts**: Chart.js for data visualizations
- **Responsive**: Mobile-first design for business owners on the go

### **Backend**
- **Python 3.11+**: Modern Python with type hints
- **Flask 3.0.3**: Lightweight web framework perfect for dashboards
- **SQLAlchemy**: Database ORM with migration support
- **Magic Links**: Password-free authentication via email

### **Data & Integrations**
- **Jina.ai**: AI-powered web scraping and data extraction
- **SendGrid**: Transactional email for magic links
- **PostgreSQL 15**: Production-ready database with JSON support
- **Chart.js**: Interactive dashboard visualizations

### **Infrastructure**
- **Docker**: Containerized development and deployment
- **Nginx**: Web server and reverse proxy (production)
- **Let's Encrypt**: SSL certificates for security
- **Digital Ocean**: Hosting platform (when ready)

### **Development**
- **Port 5689**: Dedicated port for this project
- **Docker Compose**: Development environment
- **GitHub**: Version control and collaboration
- **Claude Code**: AI-assisted development

---

## 📁 Project Structure

```
DataWithIsa/
├── .claude/              # 🤖 Claude Code configuration and decisions
│   ├── DECISIONS.md     # Technical choices and rationale
│   ├── CONVENTIONS.md   # Coding standards and best practices
│   └── modes/           # Phase control (setup vs development)
├── drafts/               # 📝 Project planning documents and wireframes
├── src/                  # 💻 Main application code
│   ├── app.py           # Flask application entry point (port 5689)
│   ├── port_utils.py    # Consistent port selection system
│   ├── requirements.txt # Pinned Python dependencies
│   ├── templates/       # HTML templates with Severance aesthetic
│   │   ├── base.html    # Base template with navigation
│   │   ├── index.html   # Landing page with value proposition
│   │   ├── about.html   # About Isa page
│   │   ├── examples.html # Dashboard examples
│   │   └── contact.html # Contact form for consultations
│   └── static/          # Static assets
│       ├── css/main.css # Olivine green theme styles
│       └── js/main.js   # Vanilla JavaScript functionality
├── scripts/              # 🔧 Utility and troubleshooting scripts
├── migrations/           # 🗄️ Database schema evolution
├── tests/                # 🧪 Testing files (manual initially)
├── docker-compose.yml    # 🐳 Development environment
├── Dockerfile           # 🐳 Application container
├── .env                 # ⚙️ Environment configuration (not committed)
├── .dockerignore        # Docker build exclusions
├── .gitignore           # Git exclusions
├── CLAUDE.md            # 🧠 Claude's project instructions
└── README.md            # 📖 This file
```

---

## 🎯 Current Status

### **✅ Completed (MVP Foundation)**
- **Professional landing page** with clear value proposition
- **Severance-inspired design** with Olivine green theme
- **Docker development environment** on port 5689
- **Page structure** (Home, About, Examples, Contact)
- **Mobile-responsive design** for business owners
- **Health check endpoint** for monitoring

### **🚧 In Development**
- Magic link authentication system
- SendGrid email integration
- Dashboard builder interface
- Jina.ai data extraction
- PostgreSQL database models

### **📋 Planned Features**
- Client dashboard viewer
- Data widget library
- Automated update scheduling
- Payment processing (Stripe)
- 3D Spline.design enhancements

---

## 💼 Business Model

### **Service Philosophy**
**Done-FOR-you**, not **BY-you**. We create custom dashboards rather than giving you tools to build your own.

### **Pricing Structure**
- **Foundation Package**: $300/month
  - 1 custom dashboard
  - Monthly data updates
  - Email support
- **Additional Widgets**: $50-150/month each
- **Update Frequency**: 1.5x-2x multiplier for more frequent updates

### **Target Customers**
Small businesses ($100K-$2M revenue) who need data insights but lack:
- Time to learn complex tools
- Budget for enterprise solutions  
- Technical skills for DIY approaches

---

## 🆘 Troubleshooting

### **Docker Issues**
```bash
# Restart containers
docker-compose down && docker-compose up --build

# Check if port 5689 is in use
lsof -i :5689

# View application logs
docker-compose logs -f web

# PostgreSQL connection issues
docker-compose logs -f db
```

### **Port Conflicts**
This project uses port 5689. To verify:
```bash
cd src && python port_utils.py
```

### **Environment Issues**
```bash
# Verify environment variables
cat .env

# Check Docker health
docker-compose ps

# Test database connection
docker exec -it dwi-webv2-db-1 psql -U dataisa -d datawithisa
```

---

## 👥 Getting Started as a Client

### **How It Works**
1. **Book a consultation** via the contact form
2. **15-minute discovery call** to understand your needs
3. **Custom dashboard creation** within 24-48 hours
4. **Receive magic link** for secure dashboard access
5. **Review and iterate** until you love your insights

### **What To Prepare**
- **Business goals** you want to track
- **Data sources** you currently use (websites, tools, spreadsheets)
- **Key decisions** these insights will help you make
- **Budget range** for ongoing dashboard maintenance

---

## 🤝 Contributing

This is a business application, but contributions are welcome for:

- **Bug fixes** and performance improvements
- **Security enhancements** 
- **Documentation** improvements
- **Testing** automation

### Development Setup
```bash
git clone https://github.com/lilGHSTY/DataWithIsa.git
cd DataWithIsa
cp .env.example .env
docker-compose up --build
```

---

## 📞 Contact

### **For Business Inquiries**
- **Website**: http://localhost:5689 (development)
- **Email**: hello@datawithisa.com
- **Consultation**: Book via contact form

### **For Technical Issues**
- **GitHub Issues**: [Report bugs](https://github.com/lilGHSTY/DataWithIsa/issues)
- **Documentation**: Check `.claude/` directory for technical details

---

## 📜 License

**Private Repository** - This is proprietary business software.

For licensing inquiries, contact the repository owner.

---

**🚀 Ready to get clear insights into your business data?**

Visit **http://localhost:5689** to see the landing page, or book a consultation to get your custom dashboard built!

*Turning complex data into clear decisions for small businesses since 2025.*