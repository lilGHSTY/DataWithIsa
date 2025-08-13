# Coding Conventions - DataWithIsa

## Python Conventions

### General Rules
- Python 3.11+ features are allowed
- Use type hints for function parameters and returns
- Keep functions under 50 lines
- One class per file for models
- Group imports: standard library, third-party, local

### Naming
```python
# Variables and functions: snake_case
user_email = "hello@datawithisa.com"
def get_dashboard_data():
    pass

# Classes: PascalCase
class DashboardWidget:
    pass

# Constants: UPPER_SNAKE_CASE
MAX_WIDGETS_PER_DASHBOARD = 12
DEFAULT_UPDATE_FREQUENCY = "weekly"

# Private methods: leading underscore
def _validate_magic_link(token):
    pass
```

### Flask Specific
```python
# Route naming: RESTful conventions
@app.route('/dashboards')  # Collection
@app.route('/dashboard/<slug>')  # Individual resource

# View functions: descriptive names
def show_dashboard(slug):  # Not just "dashboard"
    pass

# Template context: explicit dictionary
return render_template('dashboard.html', {
    'dashboard': dashboard,
    'widgets': widgets,
    'last_updated': last_updated
})
```

## HTML/CSS Conventions

### HTML Structure
```html
<!-- Semantic HTML5 elements -->
<nav class="main-nav">
<main class="dashboard-container">
<section class="widget-grid">

<!-- Data attributes for JavaScript -->
<div data-widget-id="123" data-update-frequency="daily">

<!-- Accessibility always -->
<img src="chart.png" alt="Revenue trend showing 15% growth">
<button aria-label="Refresh dashboard data">
```

### CSS Organization
```css
/* Follow this order in main.css */

/* 1. CSS Variables */
:root {
    --olivine: #8EAB81;
    --dark-green: #26392C;
}

/* 2. Reset/Base */
* { box-sizing: border-box; }

/* 3. Typography */
h1, h2, h3 { }

/* 4. Layout Components */
.container { }
.grid { }

/* 5. UI Components */
.btn { }
.card { }

/* 6. Page Specific */
.dashboard-header { }

/* 7. Utilities */
.text-center { }

/* 8. Media Queries at the end */
@media (max-width: 768px) { }
```

### CSS Naming
```css
/* BEM-inspired but simplified */
.dashboard { }           /* Block */
.dashboard-header { }    /* Element */
.dashboard--locked { }   /* Modifier */

/* Utility classes */
.text-center { }
.mt-2 { }  /* margin-top: 2rem */

/* State classes */
.is-loading { }
.is-active { }
.has-error { }
```

## JavaScript Conventions

### Modern ES6+
```javascript
// Use const/let, never var
const API_ENDPOINT = '/api/dashboard';
let widgetCount = 0;

// Arrow functions for callbacks
widgets.forEach(widget => {
    renderWidget(widget);
});

// Destructuring
const { id, name, data } = dashboard;

// Template literals
const message = `Dashboard ${name} updated successfully`;

// Async/await over promises
async function updateDashboard(id) {
    const response = await fetch(`/api/dashboard/${id}`);
    const data = await response.json();
    return data;
}
```

### DOM Manipulation
```javascript
// Cache DOM queries
const dashboardEl = document.querySelector('.dashboard');

// Event delegation
document.addEventListener('click', (e) => {
    if (e.target.matches('.refresh-btn')) {
        refreshWidget(e.target.dataset.widgetId);
    }
});

// Data attributes for configuration
const updateFreq = widgetEl.dataset.updateFrequency;
```

## Database Conventions

### Table Naming
```sql
-- Plural for tables
CREATE TABLE clients (
CREATE TABLE dashboards (
CREATE TABLE widgets (

-- Singular for columns
client_id INTEGER
dashboard_name TEXT
```

### Column Conventions
```sql
-- Always include these
id INTEGER PRIMARY KEY
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

-- Foreign keys: table_id
client_id INTEGER REFERENCES clients(id)

-- Booleans: is_ or has_ prefix
is_active BOOLEAN DEFAULT true
has_premium_features BOOLEAN DEFAULT false

-- JSON columns for flexible data
widget_config JSON
dashboard_data JSON
```

## File Organization

### Directory Structure
```
src/
├── app.py              # Application entry point
├── config.py           # Configuration management
├── models/             # Database models
│   ├── __init__.py
│   ├── client.py
│   └── dashboard.py
├── routes/             # Route handlers
│   ├── __init__.py
│   ├── public.py      # Landing, about, etc.
│   └── dashboard.py   # Dashboard routes
├── services/           # Business logic
│   ├── __init__.py
│   ├── jina_service.py
│   └── email_service.py
├── static/
│   ├── css/
│   ├── js/
│   └── images/
└── templates/
    ├── layouts/        # Base templates
    ├── components/     # Reusable parts
    └── pages/          # Full pages
```

## Git Conventions

### Commit Messages
```
# Format: <type>: <subject>

feat: Add magic link authentication
fix: Correct dashboard loading timeout
style: Update landing page with Olivine theme
docs: Add API documentation for widgets
chore: Update dependencies to latest versions
refactor: Simplify dashboard data structure

# Scope (optional)
feat(dashboard): Add real-time updates
fix(auth): Resolve magic link expiration issue
```

### Branch Naming
```
main                    # Production-ready code
develop                 # Integration branch
feature/dashboard-builder
bugfix/magic-link-timeout
hotfix/critical-security-issue
```

## Error Handling

### User-Facing Errors
```python
# Always provide helpful messages
if not dashboard:
    flash("Dashboard not found. Please check your link or contact support.", "error")
    return redirect(url_for('index'))

# Log the technical details
app.logger.error(f"Dashboard lookup failed: {dashboard_id}")
```

### API Errors
```python
# Consistent JSON structure
{
    "error": "Dashboard not found",
    "message": "The requested dashboard does not exist",
    "code": "DASHBOARD_NOT_FOUND",
    "status": 404
}
```

## Security Conventions

### Never Trust User Input
```python
# Always sanitize
from bleach import clean
cleaned_input = clean(user_input)

# Parameterized queries
cursor.execute(
    "SELECT * FROM dashboards WHERE id = ?",
    (dashboard_id,)
)

# Validate everything
if not is_valid_email(email):
    return error_response("Invalid email format")
```

### Environment Variables
```python
# Never hardcode secrets
SENDGRID_KEY = os.getenv('SENDGRID_API_KEY')

# Provide defaults for development
DEBUG = os.getenv('DEBUG', 'False') == 'True'
```

## Testing Conventions (Future)

### Test Naming
```python
def test_dashboard_creation_with_valid_data():
    """Dashboard should be created with all required fields."""
    pass

def test_magic_link_expires_after_one_hour():
    """Magic links should return 401 after expiration."""
    pass
```

### Test Organization
```
tests/
├── unit/           # Isolated function tests
├── integration/    # Component interaction tests
└── fixtures/       # Test data
```

## Documentation

### Docstrings
```python
def create_dashboard(client_id: int, config: dict) -> Dashboard:
    """
    Create a new dashboard for a client.
    
    Args:
        client_id: The ID of the client
        config: Dashboard configuration dictionary
        
    Returns:
        The created Dashboard object
        
    Raises:
        ValueError: If client doesn't exist
        ValidationError: If config is invalid
    """
    pass
```

### Inline Comments
```python
# Explain WHY, not WHAT
# Calculate hash for consistent port selection
port_hash = hashlib.md5(project_name.encode()).hexdigest()

# NOT: # Set port to 5689
port = 5689
```

## Performance Guidelines

1. **Database**: Index foreign keys and frequently queried columns
2. **Caching**: Cache dashboard data for 1 hour minimum
3. **Images**: Use WebP format, lazy load below fold
4. **CSS**: Critical CSS inline, rest async
5. **JavaScript**: Defer non-critical scripts

## Accessibility Standards

1. **Contrast**: Minimum 4.5:1 for normal text
2. **Keyboard**: All interactive elements keyboard accessible
3. **ARIA**: Use semantic HTML first, ARIA only when needed
4. **Alt Text**: Meaningful descriptions for all images
5. **Focus**: Visible focus indicators

---

**Remember**: These conventions ensure consistency and maintainability. When in doubt, prioritize readability and simplicity over clever solutions.