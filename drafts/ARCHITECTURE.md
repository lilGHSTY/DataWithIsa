# DataWithIsa - System Architecture

## Overview
Simple, maintainable architecture focused on rapid delivery and scalability. AI-powered with Jina.ai integration for intelligent data extraction.

## Architecture Diagram
```
[Business Owner] → [Web Browser] → [Nginx] → [Flask App] → [PostgreSQL]
                         ↓                         ↓              ↓
                 [Static Assets]            [Jina.ai API]    [File Storage]
                 [Spline 3D Assets]         [Google APIs]
                                           [SendGrid]
```

## Technology Stack

### Frontend
- **HTML/CSS/JavaScript** (vanilla) - No complex frameworks
- **CSS Framework**: None - custom CSS with variables
- **Build Tools**: None initially - raw files for simplicity
- **Icons**: SVG icons inline
- **Charts**: Chart.js for data visualization
- **3D Assets**: Spline.design (post-MVP enhancement)

### Backend
- **Language**: Python 3.9+
- **Framework**: Flask 2.0+
- **Database ORM**: SQLAlchemy
- **Authentication**: Custom magic links (no passwords)
- **Task Queue**: None initially (synchronous operations)
- **Caching**: Flask-Caching with simple backend

### Database
- **Development**: SQLite
- **Production**: PostgreSQL 13+
- **Migrations**: Alembic
- **Backup**: pg_dump daily

### Infrastructure
- **Development**: Local machine
- **Production**: Digital Ocean Droplet (Ubuntu)
- **Web Server**: Nginx + Gunicorn
- **SSL**: Let's Encrypt
- **Monitoring**: Basic health checks
- **Logging**: Python logging to files

## Project Structure
```
DWI-Web/
├── src/
│   ├── app.py                 # Flask application entry
│   ├── config.py              # Configuration management
│   ├── models.py              # Database models
│   ├── auth.py                # Magic link authentication
│   ├── dashboard.py           # Dashboard business logic
│   ├── jina_client.py         # Jina.ai integration
│   ├── static/
│   │   ├── css/
│   │   │   └── main.css       # All styles (Severance-inspired)
│   │   ├── js/
│   │   │   ├── main.js        # Core functionality
│   │   │   ├── calculator.js  # Price calculator
│   │   │   ├── dashboard.js   # Dashboard viewer
│   │   │   └── spline.js      # 3D asset integration (post-MVP)
│   │   └── img/               # Images and icons
│   ├── templates/
│   │   ├── base.html          # Base template
│   │   ├── index.html         # Homepage with 3D placeholders
│   │   ├── about.html         # About Isa page
│   │   ├── examples.html      # Example dashboards
│   │   ├── contact.html       # Contact form (conference room style)
│   │   ├── dashboard.html     # Client dashboard view
│   │   └── admin/
│   │       ├── clients.html   # Client management
│   │       └── builder.html   # Dashboard builder
│   └── requirements.txt       # Python dependencies
├── migrations/                # Database migrations
├── scripts/                   # Utility scripts
├── tests/                     # Test files
├── docs/                      # Documentation
└── .env.example              # Environment variables template
```

## Database Schema

### Core Tables

```sql
-- Clients table
CREATE TABLE clients (
    id INTEGER PRIMARY KEY,
    business_name TEXT NOT NULL,
    contact_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT,
    industry TEXT,
    pricing_tier TEXT DEFAULT 'foundation', -- foundation, premium
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status TEXT DEFAULT 'active'
);

-- Dashboards table
CREATE TABLE dashboards (
    id INTEGER PRIMARY KEY,
    client_id INTEGER REFERENCES clients(id),
    name TEXT NOT NULL,
    slug TEXT UNIQUE NOT NULL,
    config JSON NOT NULL,  -- Widget configuration
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Magic links table
CREATE TABLE magic_links (
    id INTEGER PRIMARY KEY,
    client_id INTEGER REFERENCES clients(id),
    token TEXT UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP NOT NULL,
    used_at TIMESTAMP
);

-- Widgets table
CREATE TABLE widgets (
    id INTEGER PRIMARY KEY,
    dashboard_id INTEGER REFERENCES dashboards(id),
    type TEXT NOT NULL,  -- 'chart', 'table', 'metric', etc.
    position INTEGER NOT NULL,
    config JSON NOT NULL,
    data JSON,
    last_updated TIMESTAMP,
    data_source TEXT -- 'jina', 'google-analytics', 'csv', etc.
);

-- Data sources table (for Jina.ai scraping)
CREATE TABLE data_sources (
    id INTEGER PRIMARY KEY,
    widget_id INTEGER REFERENCES widgets(id),
    source_type TEXT NOT NULL, -- 'jina-scrape', 'google-api', 'csv'
    source_url TEXT,
    jina_query TEXT, -- AI query for data extraction
    update_frequency TEXT DEFAULT 'weekly',
    last_scraped TIMESTAMP,
    status TEXT DEFAULT 'active'
);
```

## Data Flow Examples

### Client Onboarding Flow
1. Isa receives consultation request
2. Creates client record in admin
3. Builds dashboard configuration with Jina.ai data sources
4. System sends magic link email
5. Client clicks link to access dashboard
6. Dashboard loads with AI-extracted data

### Jina.ai Data Update Flow
1. Scheduled job triggers widget update
2. System retrieves Jina.ai query from widget config
3. Calls Jina.ai API with target URLs and extraction queries
4. Processes AI-structured response
5. Updates widget data in database
6. Client sees fresh insights on next visit

## API Design

### Public Endpoints
```
GET  /                      # Homepage (with 3D placeholders)
GET  /about                 # About Isa page
GET  /examples              # Example dashboards showcase
POST /contact               # Contact form submission
GET  /dashboard/:token      # Client dashboard (magic link)
GET  /calculator            # Interactive pricing calculator
```

### Admin Endpoints
```
GET  /admin/clients         # List all clients
POST /admin/clients         # Create new client
GET  /admin/dashboard/:id   # Dashboard builder
POST /admin/dashboard/:id   # Save dashboard config
POST /admin/send-link/:id   # Send magic link
POST /admin/jina-test       # Test Jina.ai queries
```

### Jina.ai Integration Endpoints
```
POST /api/jina/scrape       # Test data scraping
POST /api/jina/extract      # Extract structured data
GET  /api/widgets/:id/update # Trigger widget data refresh
```

## Jina.ai Integration Architecture

### Data Extraction Strategy
```python
# Example Jina.ai integration
class JinaClient:
    def extract_business_data(self, url, query_type):
        # Use Jina.ai Reader API for clean data extraction
        jina_query = f"https://r.jina.ai/{url}"
        headers = {
            'X-Return-Format': 'json',
            'X-AI-Query': self.get_extraction_query(query_type)
        }
        
        response = requests.get(jina_query, headers=headers)
        return self.process_ai_response(response.json())
    
    def get_extraction_query(self, query_type):
        queries = {
            'reviews': "Extract all customer reviews with ratings and dates",
            'pricing': "Find all product prices and service costs",
            'competitors': "List competitor businesses and their key metrics"
        }
        return queries.get(query_type)
```

### Cost-Effective Scaling
- Use Jina.ai free tier for development and testing
- Token-based pricing scales with actual usage
- 50-80% cost savings vs traditional scraping services
- AI preprocessing reduces server-side data processing load

## Security Architecture

### Authentication Flow
1. No passwords - magic links only
2. Admin has environment variable credentials
3. Clients access via time-limited magic links (1 hour)
4. Links expire and invalidate previous ones
5. New link generation requires admin action

### Data Protection
- CSRF tokens on all forms
- Input sanitization with bleach
- Parameterized SQL queries (SQLAlchemy)
- Content Security Policy headers
- Rate limiting: 10 requests/minute per IP
- Jina.ai API key stored securely in environment variables

### Client Isolation
- Unique tokens per client
- Database-level access control
- No shared cache keys
- Separate dashboard URLs
- Data source configurations isolated per client

## Performance Strategy

### Caching Layers
1. **Browser**: Static assets cached 1 year
2. **Application**: Dashboard data cached 1 hour
3. **Jina.ai**: AI-extracted data cached per update frequency
4. **Database**: Query result caching for complex analytics

### 3D Asset Optimization (Post-MVP)
- Spline assets lazy-loaded below fold
- Compressed 3D scenes (4x size reduction)
- Progressive enhancement approach
- Static image fallbacks for older browsers
- WebGL detection and graceful degradation

### Optimization Targets
- Homepage: <1s load time (including 3D placeholders)
- Dashboard: <2s load time (with 3D elements)
- API responses: <500ms
- Jina.ai queries: <3s (acceptable for background updates)

## Deployment Architecture

### Development Setup
```bash
cd src
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
export FLASK_ENV=development
export JINA_API_KEY=your_key_here
python app.py
```

### Production Deployment
```bash
# Digital Ocean Droplet
git pull origin main
pip install -r requirements.txt
alembic upgrade head
sudo systemctl restart gunicorn
sudo systemctl reload nginx
```

### Environment Variables
```
FLASK_SECRET_KEY=       # Session encryption
DATABASE_URL=           # PostgreSQL connection
ADMIN_EMAIL=           # Admin login
ADMIN_PASSWORD=        # Admin password
SENDGRID_API_KEY=      # Email sending
JINA_API_KEY=          # AI data extraction
SPLINE_ASSETS_CDN=     # 3D asset hosting (post-MVP)
```

## Scaling Roadmap

### Phase 1: MVP (0-10 clients)
- Single server handles everything
- SQLite database
- Manual dashboard updates
- Basic Jina.ai integration
- CSS placeholders for 3D elements

### Phase 2: Growth (10-50 clients)
- Migrate to PostgreSQL
- Automated Jina.ai data updates
- Add Redis for caching
- Spline.design 3D asset integration
- Enhanced monitoring

### Phase 3: Scale (50+ clients)
- Load balancer + multiple app servers
- Read replica database
- Background job queue for data updates
- CDN for static and 3D assets
- Full observability with error tracking

## Integration Architecture

### Jina.ai (AI-Powered Data Extraction)
- Replace traditional web scraping with AI queries
- Cost-effective token-based pricing
- LLM-friendly structured output
- Built-in anti-detection and proxy management
- Real-time and scheduled data extraction

### Spline.design (3D Asset Pipeline)
- Post-MVP enhancement for cozy Severance aesthetic
- Vanilla JS export maintains tech stack compatibility
- Professional $20/month plan for commercial use
- Progressive enhancement approach
- Performance monitoring to maintain <3s load times

### SendGrid (Email Delivery)
- Magic link delivery with 99%+ reliability
- Transactional email templates
- Error notifications for failed deliveries
- Analytics for client engagement tracking

---

**Remember**: Start simple with AI enhancement. The Jina.ai integration provides intelligent data extraction while Spline.design enables the unique Severance-inspired user experience post-MVP.