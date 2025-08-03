# Claude Code Setup Guide - Docker-First Approach

This guide helps Claude Code lead users through the project setup phase with our Docker-first development environment.

## Setup Flow Overview

When a user runs `/setup start`, guide them through these phases:

### Phase 1: Environment & Docker Setup (10 min)
1. Create SETUP.lock in `.claude/modes/`
2. Select project port using `python src/port_utils.py`
3. Create Docker configuration files (Dockerfile, docker-compose.yml, .dockerignore)
4. Create Flask application structure with latest dependencies
5. Set up PostgreSQL database container
6. Create .env file with project configuration
7. Test Docker setup with `docker-compose up --build`
8. Verify application loads at localhost:PORT

### Phase 2: Project Discovery (10-15 min)
1. Ask about their project idea and goals
2. Review any existing drafts/ folder contents
3. Read all .template files from templates/ directory
4. Understand target audience and user needs
5. Determine MVP scope and phasing
6. Identify business model and success metrics

### Phase 3: Documentation Generation (15-20 min)
1. Copy .template files to appropriate locations
2. Fill out docs/REQUIREMENTS.md with user stories and phases
3. Create docs/ARCHITECTURE.md with technical decisions
4. Generate docs/BUSINESS_PLAN.md with market analysis
5. Create docs/BRAND_GUIDELINES.md with voice and visual identity
6. Update README.md from template with project specifics
7. Create .claude/DECISIONS.md with technology choices
8. Generate .claude/CONVENTIONS.md with coding standards

### Phase 4: Final Setup & Verification (5 min)
1. Ensure all Docker containers are running properly
2. Take screenshot of working application (if Playwright MCP available)
3. Commit all changes with descriptive message
4. Push to GitHub repository (create if needed)
5. Remove SETUP.lock to exit setup phase

## Key Principles

1. **Docker-First**: All development happens in containers
2. **Latest Versions**: Install current stable versions with exact pinning
3. **Conversational**: Keep dialogue natural and collaborative
4. **Professional Output**: Generate business-ready documentation
5. **Auto-Commit**: Save work automatically to GitHub

## Docker Configuration Files to Create

### Dockerfile
```dockerfile
FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy and install Python dependencies
COPY src/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY src/ .

# Expose port (will be overridden by docker-compose)
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
```

### docker-compose.yml
```yaml
version: '3.8'

services:
  web:
    build: .
    ports:
      - "${PORT:-5000}:${PORT:-5000}"
    volumes:
      - ./src:/app
    environment:
      - FLASK_ENV=development
      - FLASK_DEBUG=1
      - DATABASE_URL=postgresql://postgres:postgres@db:5432/app_db
      - PORT=${PORT:-5000}
    depends_on:
      db:
        condition: service_healthy
    restart: unless-stopped

  db:
    image: postgres:15-alpine
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
      - POSTGRES_DB=app_db
    volumes:
      - postgres_data:/var/lib/postgresql/data
    ports:
      - "5432:5432"
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 5s
      timeout: 5s
      retries: 5

volumes:
  postgres_data:
```

### .dockerignore
```
__pycache__
*.pyc
*.pyo
*.pyd
.Python
env/
venv/
ENV/
.venv
pip-log.txt
pip-delete-this-directory.txt
.tox/
.coverage
.coverage.*
.cache
*.log
.git
.gitignore
.env
.DS_Store
*.sqlite3
*.db
```

## Python Application Structure

### src/app.py
```python
from flask import Flask, render_template, jsonify
from flask_sqlalchemy import SQLAlchemy
from dotenv import load_dotenv
import os
from port_utils import get_project_port_from_env

# Load environment variables
load_dotenv()

# Create Flask app
app = Flask(__name__)

# Configuration
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY', 'dev-secret-key-change-in-production')
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URL')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initialize extensions
db = SQLAlchemy(app)

# Routes
@app.route('/')
def index():
    return render_template('index.html', project_name=os.getenv('PROJECT_NAME', 'My Project'))

@app.route('/api/health')
def health():
    return jsonify({
        'status': 'healthy',
        'database': 'connected' if db.engine.execute('SELECT 1').scalar() == 1 else 'error'
    })

if __name__ == '__main__':
    # Get port from environment or smart selection
    port = get_project_port_from_env()
    print(f"Starting application on http://localhost:{port}")
    
    # Create tables if they don't exist
    with app.app_context():
        db.create_all()
    
    # Run the application
    app.run(host='0.0.0.0', port=port, debug=True)
```

### src/requirements.txt (with latest versions)
```
Flask==3.0.0
Flask-SQLAlchemy==3.1.1
SQLAlchemy==2.0.23
python-dotenv==1.0.0
psycopg2-binary==2.9.9
gunicorn==21.2.0
Werkzeug==3.0.1
# Add more based on project needs
```

### HTML Templates
Create basic templates in `src/templates/`:

**base.html**:
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{% block title %}{{ project_name }}{% endblock %}</title>
    <link rel="stylesheet" href="{{ url_for('static', filename='css/style.css') }}">
</head>
<body>
    <header>
        <h1>{{ project_name }}</h1>
    </header>
    <main>
        {% block content %}{% endblock %}
    </main>
    <footer>
        <p>&copy; 2024 {{ project_name }}. Built with Flask and Docker.</p>
    </footer>
</body>
</html>
```

**index.html**:
```html
{% extends "base.html" %}
{% block content %}
<div class="container">
    <h2>Welcome to {{ project_name }}!</h2>
    <p>Your Docker-powered Flask application is running successfully.</p>
    <p>Start building amazing features!</p>
</div>
{% endblock %}
```

## Discovery Questions - Progressive Approach

### Initial Understanding
- "What are you building? Tell me about your project idea!"
- "Who will use this and what problem does it solve for them?"
- "Do you have any sketches, notes, or documents I should look at?"

### Business Context
- "Is this a personal project, startup idea, or client work?"
- "Are you planning to charge for this? If so, what's the business model?"
- "When do you need the first version ready?"

### Technical Preferences
- "Any specific features or integrations you know you'll need?"
- "What's your experience level with web development?"
- "Are there any technologies you specifically want to use or avoid?"

### Design & User Experience
- "How should it look and feel? Modern, playful, professional?"
- "Any websites or apps you admire for inspiration?"
- "Do you have brand colors or design preferences?"

### Scale & Performance
- "How many users do you expect initially? Eventually?"
- "Will this handle sensitive data or payments?"
- "Any specific performance requirements?"

## Template Processing

When filling templates:
1. Read each .template file completely
2. Ask relevant questions for each section
3. Fill with specific, actionable content
4. No placeholders - only real project information
5. Review major sections with user before finalizing

## Auto-Commit Workflow

Throughout setup:
1. Commit after Docker configuration is created
2. Commit after Flask application is working
3. Commit after each major documentation file
4. Final commit with all setup complete
5. Push to GitHub (create repo if needed)

## Handoff to Development

After setup is complete:
1. Show summary of what was created
2. Confirm Docker containers are running
3. Display the localhost URL for testing
4. Show the development roadmap from docs/PROGRESS.md
5. Suggest first feature to implement
6. Remove SETUP.lock file

## Remember

- Docker-first approach eliminates environment issues
- Always install latest versions with exact pinning
- Professional documentation is not optional
- Auto-commit prevents lost work
- User controls all major decisions
- Start simple, enhance iteratively