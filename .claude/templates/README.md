# Progressive Documentation Templates

This directory can contain additional templates for specialized documentation needs.

## How Progressive Documentation Works

The main templates are in the `docs/` folder:
- `docs/REQUIREMENTS.md`
- `docs/ARCHITECTURE.md` 
- `docs/API_REFERENCE.md`
- etc.

During setup phase, Claude Code:
1. Reads these template files
2. Asks discovery questions
3. Progressively fills out the templates with project-specific content
4. Continues adding detail through the conversation

## This Directory's Purpose

Use this directory for:
- Industry-specific templates
- Custom documentation formats
- Additional template variations
- Project type templates (e.g., e-commerce, SaaS, blog)

## Example Custom Template

`ecommerce-requirements.md`:
```markdown
# E-Commerce Specific Requirements

## Payment Processing
- [ ] Payment methods accepted
- [ ] Currency support
- [ ] Tax calculation needs

## Inventory Management
- [ ] Stock tracking requirements
- [ ] Multi-warehouse support
- [ ] Low stock alerts

[etc...]
```

## Note

The core templates in `docs/` are the primary ones used during setup phase.