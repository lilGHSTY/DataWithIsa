# Technical Decisions - DataWithIsa

This document captures all major technical decisions made for the DataWithIsa project, including the rationale behind each choice.

## ⚠️ CORE STACK (DO NOT CHANGE)
These are fundamental decisions that should NOT be changed without explicit user approval:
- **Backend**: Flask (not Django, FastAPI, or others)
- **Frontend**: Vanilla HTML/CSS/JS (not React, Vue, Angular)
- **Database**: SQLite/PostgreSQL (not MongoDB, Firebase)
- **Language**: Python 3.11+ (not Node.js, Ruby, etc.)
- **Development**: Docker-first approach with port 5689

**Rationale**: Simplicity, maintainability, and fast time-to-market for a dashboard service business.

## Frontend
- **Framework**: Vanilla HTML/CSS/JS - no build complexity, faster loads
- **Styling**: Custom CSS with Severance-inspired design (Olivine #8EAB81 theme)
- **Interactivity**: Vanilla JavaScript for dashboards, Chart.js for visualizations
- **Build Tool**: None - static files served directly
- **Icons**: SVG inline icons for performance
- **Fonts**: System fonts for fast loading
- **Design Philosophy**: Cozy office aesthetic, not cold corporate

## Backend  
- **Language**: Python 3.11+
- **Framework**: Flask 3.0.3 - lightweight, perfect for dashboards
- **API Style**: Server-side rendering first, JSON API for dynamic updates
- **Template Engine**: Jinja2 for dashboard rendering
- **Error Handling**: User-friendly error pages with support options

## Database
- **Development**: SQLite for rapid prototyping
- **Production**: PostgreSQL 15 (already in Docker setup)
- **ORM**: SQLAlchemy 2.0 for type safety and migrations
- **Migrations**: Alembic for version control
- **Widget Storage**: JSON columns for flexible dashboard configs
- **Backups**: Daily pg_dump when in production

## Authentication
- **Method**: Magic links only - NO passwords
- **Delivery**: SendGrid transactional emails
- **Expiration**: 1-hour magic links
- **Admin**: Environment variable credentials only
- **Client Access**: Unique dashboard URLs with tokens

## Infrastructure
- **Version Control**: Git + GitHub (private repo)
- **Hosting**: Digital Ocean Droplet with Nginx
- **File Storage**: Local initially, DO Spaces for client assets
- **CDN**: Cloudflare for 3D assets (post-MVP)
- **Domain**: datawithisa.com (when registered)
- **SSL**: Let's Encrypt from day one

## Development Workflow
- **Environment**: Docker Compose (web + PostgreSQL)
- **Dependencies**: requirements.txt with pinned versions
- **Secrets**: .env files (never committed)
- **Port**: 5689 (project-specific, consistent)
- **Testing**: Manual validation, add tests after first client

## Security
- **HTTPS**: Always, even in development
- **CORS**: Restricted to specific domains
- **Rate Limiting**: 10 requests/minute for forms
- **Input Validation**: Bleach for sanitization, server-side always
- **Client Data**: Isolated by database schemas
- **No Passwords**: Magic links eliminate password vulnerabilities

## Performance Targets
- **Landing Page**: Under 2 seconds (critical for conversion)
- **Dashboard Load**: Under 3 seconds (including data)
- **API Response**: Under 500ms
- **Concurrent Users**: 100 initially, scale at 50 clients

## Third-Party Services
- **Email**: SendGrid for magic links and notifications
- **Payment**: Stripe (when ready for payments)
- **Data Extraction**: Jina.ai for intelligent web scraping
- **Analytics**: Google Analytics for client dashboards
- **3D Assets**: Spline.design (post-MVP enhancement)
- **Error Tracking**: Keep it simple with logs initially

## DataWithIsa-Specific Decisions

### Business Model
- **Service Type**: Done-for-you, NOT self-service
- **Dashboard Creation**: Manual by Isa, not automated
- **Pricing**: $300/month foundation, modular add-ons
- **Target**: Small businesses ($100K-$2M revenue)

### Data Strategy
- **Collection**: Jina.ai for AI-powered extraction
- **Updates**: Weekly default, configurable per client
- **Storage**: JSON in PostgreSQL for flexibility
- **Visualization**: Chart.js for all graphs

### Scaling Strategy
- **0-10 clients**: Single server, manual updates
- **10-50 clients**: Add Redis, automate updates
- **50+ clients**: Multiple servers, dedicated database
- **100+ clients**: Consider hiring, API development

## Decisions NOT Made Yet
- Mobile app (validate web-first approach)
- White-labeling (focus on DataWithIsa brand)
- API access for clients (gauge demand first)
- Internationalization (US market first)

---

**Last Updated**: 2025-08-13
**Review Schedule**: After first 5 paying clients