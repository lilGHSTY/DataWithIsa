# Database Migrations

This directory contains database schema definitions and migration scripts.

## During Setup Phase

Claude Code should create:
- `schema.sql` - Complete database schema for the project

## During Development Phase

- Migration files for schema changes
- Numbered sequentially (001_initial.sql, 002_add_users.sql, etc.)
- Each migration should have UP and DOWN sections

## Example Structure

```
migrations/
├── README.md          # This file
├── schema.sql         # Complete schema (created during setup)
├── 001_initial.sql    # First migration
├── 002_add_feature.sql # Feature addition
└── ...
```