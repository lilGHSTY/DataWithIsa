# Documentation Templates

This folder contains professional documentation templates that Claude Code uses during the setup phase to create comprehensive, business-ready project documentation.

## 📋 Available Templates

### **Core Project Documentation**
- **`REQUIREMENTS.md.template`** - Comprehensive project requirements with user stories, business model, and development phases
- **`ARCHITECTURE.md.template`** - Technical architecture, database schema, and system design decisions
- **`README.md.template`** - Professional project README with all essential sections
- **`PROGRESS.md.template`** - Development roadmap, milestones, and progress tracking

### **Business Documentation**
- **`BUSINESS_PLAN.md.template`** - Market analysis, financial projections, and business strategy
- **`BRAND_GUIDELINES.md.template`** - Brand identity, voice, tone, visual design, and implementation guidelines
- **`SECURITY_PLAN.md.template`** - Security requirements, authentication, and compliance planning

### **Technical Documentation**
- **`API_REFERENCE.md.template`** - API endpoint documentation and integration guides
- **`TESTING_STRATEGY.md.template`** - Quality assurance approach and testing methodologies

### **Specialized Templates**
- **`BRAND_PRINCIPLES.md.template`** - Quick-start brand principles and personality framework
- **`STYLE_GUIDE.md.template`** - Visual style guide and design system documentation
- **`SAAS_REQUIREMENTS.md.template`** - SaaS-specific requirements including subscription models and user management

## 🎯 How Templates Work

### During Setup Phase (`/setup start`)
1. **Claude reads all templates** to understand the structure and requirements
2. **User collaboration** - Claude asks discovery questions based on template sections
3. **Professional output** - Templates are copied to `docs/` folder and filled with project-specific content
4. **No placeholders** - All template content is replaced with real, actionable information

### Template Enhancement Features
- **Real-world examples** included in template structure
- **Implementation checklists** for quality assurance
- **Professional standards** that meet business requirements
- **Comprehensive coverage** of all project aspects

## ✨ Key Benefits

### **Professional Standards**
- Industry-standard documentation structure
- Business-ready content from day one
- Complete coverage of project planning needs
- Quality assurance checklists

### **Time Savings**
- No need to research documentation best practices
- Structured approach to project planning
- Consistent format across all projects
- Automated generation through Claude Code

### **Business Readiness**
- Investor-ready business plans
- Professional brand guidelines
- Comprehensive security planning
- Technical architecture documentation

## 🔧 Customization

### **For Template Maintainers**
- Follow the `.template` naming convention
- Include real examples and guidance within templates
- Maintain professional structure and comprehensive coverage
- Test templates with actual projects to ensure completeness

### **For Project Users**
- Templates are automatically used during `/setup start`
- No direct editing required - Claude handles the collaboration
- Final documentation appears in your `docs/` folder
- All template placeholders replaced with project-specific content

## 📁 Output Location

Generated documentation is placed in:
```
your-project/
├── docs/
│   ├── REQUIREMENTS.md      # From REQUIREMENTS.md.template
│   ├── ARCHITECTURE.md      # From ARCHITECTURE.md.template
│   ├── BUSINESS_PLAN.md     # From BUSINESS_PLAN.md.template
│   ├── BRAND_GUIDELINES.md  # From BRAND_GUIDELINES.md.template
│   ├── SECURITY_PLAN.md     # From SECURITY_PLAN.md.template
│   ├── API_REFERENCE.md     # From API_REFERENCE.md.template
│   ├── TESTING_STRATEGY.md  # From TESTING_STRATEGY.md.template
│   └── PROGRESS.md          # From PROGRESS.md.template
└── README.md                # From README.md.template
```

---

**These templates transform the Web Starter Kit from a basic skeleton into a professional development foundation that produces business-ready documentation consistently.**