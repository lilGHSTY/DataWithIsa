# API Reference

This document describes the API endpoints for this application.

## Base URL
```
Development: http://localhost:PORT/api (PORT auto-selected during setup)
Production: https://yourdomain.com/api
```

## Authentication

### API Key Authentication
Include your API key in the request header:
```
Authorization: Bearer YOUR_API_KEY
```

### Session Authentication
For web app requests, use session-based authentication with CSRF protection.

## Common Response Format

### Success Response
```json
{
  "success": true,
  "data": {
    // Response data here
  },
  "message": "Operation completed successfully"
}
```

### Error Response
```json
{
  "success": false,
  "error": {
    "code": "ERROR_CODE",
    "message": "Human-readable error message",
    "details": {
      // Additional error context
    }
  }
}
```

## Status Codes

- `200` - OK: Request successful
- `201` - Created: Resource created successfully
- `400` - Bad Request: Invalid request data
- `401` - Unauthorized: Authentication required
- `403` - Forbidden: Insufficient permissions
- `404` - Not Found: Resource not found
- `422` - Unprocessable Entity: Validation errors
- `429` - Too Many Requests: Rate limit exceeded
- `500` - Internal Server Error: Server error

## Endpoints

### Authentication

#### POST /auth/login
Authenticate user and create session.

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "user": {
      "id": 1,
      "email": "user@example.com",
      "name": "John Doe"
    },
    "token": "jwt_token_here"
  }
}
```

**Errors:**
- `400` - Missing email or password
- `401` - Invalid credentials
- `422` - Validation errors

#### POST /auth/logout
End user session.

**Response:**
```json
{
  "success": true,
  "message": "Logged out successfully"
}
```

#### POST /auth/register
Create new user account.

**Request Body:**
```json
{
  "name": "John Doe",
  "email": "user@example.com",
  "password": "password123",
  "password_confirmation": "password123"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "user": {
      "id": 1,
      "name": "John Doe",
      "email": "user@example.com",
      "created_at": "2024-01-01T00:00:00Z"
    }
  }
}
```

### Users

#### GET /users/profile
Get current user profile.

**Authentication:** Required

**Response:**
```json
{
  "success": true,
  "data": {
    "id": 1,
    "name": "John Doe",
    "email": "user@example.com",
    "created_at": "2024-01-01T00:00:00Z",
    "updated_at": "2024-01-01T00:00:00Z"
  }
}
```

#### PUT /users/profile
Update user profile.

**Authentication:** Required

**Request Body:**
```json
{
  "name": "Jane Doe",
  "email": "jane@example.com"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "id": 1,
    "name": "Jane Doe",
    "email": "jane@example.com",
    "updated_at": "2024-01-01T12:00:00Z"
  }
}
```

### Data Endpoints

#### GET /data
List data items with pagination.

**Authentication:** Required

**Query Parameters:**
- `page` (optional): Page number (default: 1)
- `limit` (optional): Items per page (default: 20, max: 100)
- `search` (optional): Search term
- `sort` (optional): Sort field
- `order` (optional): Sort order (asc/desc)

**Response:**
```json
{
  "success": true,
  "data": {
    "items": [
      {
        "id": 1,
        "title": "Item Title",
        "description": "Item description",
        "created_at": "2024-01-01T00:00:00Z"
      }
    ],
    "pagination": {
      "current_page": 1,
      "total_pages": 5,
      "total_items": 100,
      "items_per_page": 20
    }
  }
}
```

#### POST /data
Create new data item.

**Authentication:** Required

**Request Body:**
```json
{
  "title": "New Item",
  "description": "Item description",
  "category": "category_name"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "id": 1,
    "title": "New Item",
    "description": "Item description",
    "category": "category_name",
    "created_at": "2024-01-01T00:00:00Z"
  }
}
```

#### GET /data/{id}
Get specific data item.

**Authentication:** Required

**Response:**
```json
{
  "success": true,
  "data": {
    "id": 1,
    "title": "Item Title",
    "description": "Detailed description",
    "category": "category_name",
    "created_at": "2024-01-01T00:00:00Z",
    "updated_at": "2024-01-01T00:00:00Z"
  }
}
```

#### PUT /data/{id}
Update data item.

**Authentication:** Required

**Request Body:**
```json
{
  "title": "Updated Title",
  "description": "Updated description"
}
```

#### DELETE /data/{id}
Delete data item.

**Authentication:** Required

**Response:**
```json
{
  "success": true,
  "message": "Item deleted successfully"
}
```

## Rate Limiting

API requests are limited to:
- **Authenticated users**: 1000 requests per hour
- **Anonymous users**: 100 requests per hour

Rate limit headers are included in responses:
```
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1640995200
```

## Webhook Events

### Event Types
- `user.created` - New user registration
- `data.created` - New data item created
- `data.updated` - Data item updated
- `data.deleted` - Data item deleted

### Webhook Payload
```json
{
  "event": "data.created",
  "timestamp": "2024-01-01T00:00:00Z",
  "data": {
    // Event-specific data
  }
}
```

## SDK Examples

### JavaScript/Node.js
```javascript
const api = new APIClient('your-api-key');

// Get user profile
const profile = await api.users.getProfile();

// Create data item
const item = await api.data.create({
  title: 'New Item',
  description: 'Description'
});
```

### Python
```python
from api_client import APIClient

client = APIClient('your-api-key')

# Get user profile
profile = client.users.get_profile()

# Create data item
item = client.data.create({
    'title': 'New Item',
    'description': 'Description'
})
```

### cURL
```bash
# Get user profile
curl -H "Authorization: Bearer YOUR_API_KEY" \
     https://yourdomain.com/api/users/profile

# Create data item
curl -X POST \
     -H "Authorization: Bearer YOUR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{"title":"New Item","description":"Description"}' \
     https://yourdomain.com/api/data
```

## Testing

### Test Environment
```
Base URL: https://api-test.yourdomain.com/api
```

### Test Credentials
```
Email: test@example.com
Password: testpassword123
API Key: test_key_12345
```

---

**Note**: This API is versioned. Current version is v1. Breaking changes will result in a new version.