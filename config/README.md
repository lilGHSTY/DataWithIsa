# Configuration Files

This directory contains environment-specific configuration files.

## Common Files

During development, you might add:

- `development.py` - Development environment settings
- `production.py` - Production environment settings
- `testing.py` - Test environment settings
- `nginx.conf` - Web server configuration
- `gunicorn.py` - Application server configuration
- `supervisor.conf` - Process management

## Usage Example

```python
# config/development.py
DEBUG = True
DATABASE_URL = "sqlite:///dev.db"
SECRET_KEY = "dev-secret-key"

# config/production.py
DEBUG = False
DATABASE_URL = os.environ.get('DATABASE_URL')
SECRET_KEY = os.environ.get('SECRET_KEY')
```

## Best Practices

- Never commit sensitive data (use environment variables)
- Keep configuration DRY with base configs
- Document all configuration options
- Use sensible defaults