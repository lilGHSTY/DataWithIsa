# DataWithIsa - Project Requirements

## Overview
DataWithIsa is a custom market intelligence dashboard service for small businesses. We create **done-for-you** dashboards rather than self-service tools, targeting businesses with $100K-$2M revenue who need data insights but lack technical expertise.

## Core Value Proposition
- **Built FOR you, not BY you** - Complete done-for-you service
- **Affordable pricing** starting at $300/month (vs $500+ enterprise solutions)
- **Fast delivery** - 24-48 hour dashboard creation
- **Human guidance** with AI efficiency

## Target Market
- Local service businesses (restaurants, salons, fitness studios, medical practices)
- Professional consultants (marketing, financial, business consultants)  
- E-commerce sellers (Amazon, Shopify, local online stores)
- Real estate professionals (agents, property managers, investors)

## User Stories

### As a Restaurant Owner
- I want to see my online reviews across platforms in one place
- I want to track foot traffic patterns and peak hours
- I want to monitor competitor pricing and menu changes
- I want alerts when reviews drop below 4 stars

### As a Consultant
- I want to track my client pipeline and conversion rates
- I want to see industry trends for my expertise area
- I want competitor analysis for positioning
- I want to demonstrate ROI to my clients

### As an E-commerce Seller
- I want to see sales trends across all my channels
- I want inventory alerts before stockouts
- I want competitor pricing analysis
- I want to track customer acquisition costs

## Service Tiers

### Foundation Package ($300/month)
- Platform access and basic dashboard hosting
- 1 dashboard template customized for their business
- Monthly data updates
- Email support

### Scaling Components (Additional costs)
- **Data Widgets:** $50-100/month each (charts, tables, metrics)
- **Analysis Widgets:** $100-150/month each (trends, forecasts, alerts)
- **Update Frequency:**
  - Weekly: 1x multiplier (baseline)
  - 2x/week: 1.5x multiplier  
  - Daily: 2x multiplier

### Premium Tier ($800-1,300/month)
- Multiple dashboard templates
- Real-time data updates
- Priority support
- Custom data sources
- API access

## Core Features

### Phase 1 - MVP (July 28 - Aug 12, 2025)
- [x] Professional landing page with clear value proposition
- [ ] Example dashboards showcase (Severance-inspired design)
- [ ] Interactive price calculator
- [ ] Contact/consultation booking system
- [ ] About Isa page with credentials
- [ ] Magic link authentication system
- [ ] Basic client dashboard viewer
- [ ] Admin interface for dashboard creation

### Phase 2 - Validation (Aug 13 - Sep 1, 2025)
- [ ] Data widget library (charts, tables, KPIs)
- [ ] Dashboard templates for each market segment
- [ ] Client onboarding workflow
- [ ] Jina.ai data source integrations
- [ ] Email notification system
- [ ] Client feedback collection

### Phase 3 - Scale (Sep 2 - Oct 1, 2025)
- [ ] Automated data updates via Jina.ai
- [ ] Advanced analytics widgets
- [ ] Report generation and export
- [ ] Payment processing integration (Stripe)
- [ ] Spline.design 3D asset integration
- [ ] API access for clients

## User Flow

### Visitor Journey
1. Lands on homepage → Sees clear value prop with cozy Severance aesthetic
2. Views example dashboards → Understands the service quality
3. Uses 3D price calculator → Gets transparent pricing
4. Books consultation → Fills simple contact form
5. Receives confirmation → Email with next steps

### Client Journey  
1. Consultation call → Isa understands needs
2. Receives proposal → Clear scope and pricing
3. Approves and pays → Simple payment process
4. Dashboard creation → 24-48 hour turnaround
5. Receives magic link → Instant secure access
6. Views dashboard → Clean, intuitive interface with 3D elements
7. Ongoing support → Regular updates and help

## Design Requirements

### Visual Identity
- **Primary Colors**: Olivine (#8EAB81), Dark Green (#26392C)
- **Secondary Colors**: Delft Blue (#233655), Celestial Blue (#0BA3EF)
- **Aesthetic**: Cozy Severance-inspired office environment (not corporate cold)
- **Typography**: System fonts for fast loading
- **Voice**: Personal, confident, approachable ("I'll handle this for you")

### 3D Elements (Post-MVP)
- Hero section: 3D MDR cubicle models
- Scroll animations: Dark green fabric partitions rising
- Interactive elements: 3D pricing calculator
- Dashboard displays: Retro computer terminals
- Contact page: Conference room aesthetic

### Responsive Design
- Mobile-first approach (many clients check on phones)
- Tablet-optimized dashboards
- Desktop for detailed analysis
- Print-friendly reports

## Technical Requirements

### Performance Targets
- Page load: <3 seconds (including 3D elements)
- API responses: <500ms
- Dashboard render: <2 seconds
- Data update reliability: >95% successful

### Security Requirements
- Magic link authentication (1-hour expiration)
- HTTPS everywhere
- Client data isolation (separate database schemas)
- Input validation and XSS prevention
- No stored passwords
- Regular security audits

### Integration Requirements
- Web scraping via Jina.ai (AI-native, cost-effective)
- Google Analytics API
- Google My Business API
- CSV upload/import
- SendGrid for transactional emails
- Stripe for payments (Phase 3)
- Spline.design for 3D assets (Post-MVP)
- PostgreSQL for production data

## Success Metrics
- **Business**: First client by Aug 12, 2025
- **Retention**: >90% monthly retention
- **Performance**: 100% uptime during business hours
- **Quality**: <5% support tickets per client/month
- **Delivery**: 100% dashboards delivered within 48 hours

## Launch Timeline
- **July 28 - Aug 12**: MVP development and first client acquisition
- **Aug 13 - Sep 1**: Validation phase with 3-5 pilot clients
- **Sep 2 - Oct 1**: Scale features and 3D enhancement
- **Oct 1**: Target 10 clients milestone

## Out of Scope (MVP)
- Mobile native apps
- Real-time streaming data
- Complex permissions/team features
- International currency support
- Advanced ML/AI predictions beyond Jina.ai capabilities
- Social media integrations (initially)
- Video tutorials
- Affiliate program

---

**Note**: This document represents our single source of truth. Updated with research insights on Jina.ai and Spline.design integration strategy.