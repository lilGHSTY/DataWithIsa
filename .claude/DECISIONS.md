# Project Decisions

This file documents all technical decisions for this project. Check here first before making implementation choices.

## Frontend
- **Framework**: Vanilla HTML/CSS/JS (no framework)
- **Styling**: Custom CSS with utility classes
- **Interactivity**: Vanilla JavaScript, add HTMX if needed later
- **Build Tool**: None initially (static files)
- **Icons**: [TBD - ask user when needed]
- **Fonts**: [TBD - ask user when needed]

## Backend  
- **Language**: Python 3.11+
- **Framework**: Flask (minimal mode)
- **API Style**: RESTful JSON endpoints
- **Template Engine**: Jinja2 (comes with Flask)
- **Error Handling**: JSON responses with appropriate HTTP codes

## Database
- **Development**: SQLite (file-based, zero config)
- **Production**: PostgreSQL (when ready to scale)
- **ORM**: Raw SQL initially, add SQLAlchemy when needed
- **Migrations**: Track changes in migrations/ folder
- **Backups**: [TBD - implement when going to production]

## Authentication
- **Method**: Session-based (Flask-Session)
- **Storage**: Server-side sessions
- **Password Hashing**: Werkzeug (comes with Flask)
- **Remember Me**: Optional 30-day cookie
- **Password Reset**: [TBD - add when needed]

## Infrastructure
- **Version Control**: Git + GitHub
- **Hosting**: Digital Ocean App Platform (when ready)
- **File Storage**: Local → Digital Ocean Spaces (when needed)
- **CDN**: [TBD - add if performance requires]
- **Domain**: [TBD - user will provide]

## Development Workflow
- **Environment**: Virtual environment (venv)
- **Dependencies**: requirements.txt
- **Secrets**: .env files (python-dotenv)
- **Docker**: Not initially (add if deployment requires)
- **Testing**: Manual first, automated later

## Security
- **HTTPS**: Required in production
- **CORS**: Configure as needed for API
- **Rate Limiting**: [TBD - add when public]
- **Input Validation**: Server-side always, client optional
- **File Uploads**: Whitelist extensions, scan for malware

## Performance Targets
- **Page Load**: Under 3 seconds
- **API Response**: Under 500ms
- **Database Queries**: Under 100ms
- **Concurrent Users**: Start with 100, scale as needed

## Third-Party Services
- **Email**: [TBD - ask user when needed]
- **Payment Processing**: [TBD - ask user when needed]
- **Analytics**: [TBD - ask user when needed]
- **Error Tracking**: [TBD - consider Sentry when live]

## Future Considerations
As the project grows, consider:
- Redis for caching (when response times slow)
- Celery for background jobs (when tasks take >5 seconds)
- CDN for static assets (when global users increase)
- Load balancer (when single server maxes out)

---

**Note**: Update this file whenever a new technical decision is made. Format: 
- **Category**: Decision (reason if not obvious)