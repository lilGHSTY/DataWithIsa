# Visual Style Guide

## Quick Start (MVP Essentials)

### Colors
**Primary:** #[HEX] - [Main brand color for CTAs and headers]
**Text:** #333333 - Dark gray for readability
**Background:** #FFFFFF - Clean white
**Accent:** #[HEX] - [Secondary color for highlights]

### Typography
**Headings:** System font stack (Arial, Helvetica, sans-serif)
**Body:** System font stack (Arial, Helvetica, sans-serif)
**Size:** 16px base, 1.5 line height

### Basics
- **Spacing:** 8px base unit (8, 16, 24, 32, 48)
- **Buttons:** 44px minimum height, rounded corners
- **Max width:** 1200px centered container

---

<details>
<summary>🔽 Expand for Complete Style System</summary>

## Brand Identity

### Logo Usage
- **Clear space:** Equal to the height of one letter
- **Minimum size:** 120px wide (web), 80px (mobile)
- **Backgrounds:** Use on white or light colors only
- **Don'ts:** Don't stretch, rotate, or add effects

## Extended Color Palette

### Primary Colors
- **Primary:** #[HEX] - [Name] - CTAs, important actions
- **Primary Dark:** #[HEX] - Hover states
- **Primary Light:** #[HEX] - Backgrounds, tints

### Semantic Colors
- **Success:** #28a745 - Confirmations, positive feedback
- **Warning:** #ffc107 - Cautions, important info
- **Error:** #dc3545 - Errors, destructive actions
- **Info:** #17a2b8 - Informational messages

### Neutral Scale
- **Gray 900:** #212529 - Headings
- **Gray 800:** #343a40 - Body text
- **Gray 600:** #6c757d - Secondary text
- **Gray 400:** #ced4da - Borders
- **Gray 200:** #e9ecef - Backgrounds
- **Gray 100:** #f8f9fa - Light backgrounds

## Advanced Typography

### Type Scale
```css
--text-xs: 0.75rem;    /* 12px - Captions */
--text-sm: 0.875rem;   /* 14px - Small text */
--text-base: 1rem;     /* 16px - Body */
--text-lg: 1.125rem;   /* 18px - Large body */
--text-xl: 1.25rem;    /* 20px - H4 */
--text-2xl: 1.5rem;    /* 24px - H3 */
--text-3xl: 1.875rem;  /* 30px - H2 */
--text-4xl: 2.25rem;   /* 36px - H1 */
--text-5xl: 3rem;      /* 48px - Hero */
```

### Font Weights
- Light: 300 (optional - large text only)
- Regular: 400 (body text)
- Medium: 500 (emphasis)
- Bold: 700 (headings)

## Layout System

### Grid System
- **Columns:** 12 column grid
- **Gutters:** 24px (desktop), 16px (mobile)
- **Margins:** 48px (desktop), 24px (tablet), 16px (mobile)

### Breakpoints
```css
--mobile: 0-639px
--tablet: 640px-1023px
--desktop: 1024px-1279px
--wide: 1280px+
```

### Spacing Scale
```css
--space-1: 0.25rem;  /* 4px */
--space-2: 0.5rem;   /* 8px */
--space-3: 0.75rem;  /* 12px */
--space-4: 1rem;     /* 16px */
--space-6: 1.5rem;   /* 24px */
--space-8: 2rem;     /* 32px */
--space-12: 3rem;    /* 48px */
--space-16: 4rem;    /* 64px */
```

## Component Specifications

### Buttons

#### Primary Button
```css
background: var(--primary);
color: white;
padding: 12px 24px;
border-radius: 6px;
font-weight: 500;
min-height: 44px;
transition: all 0.2s ease;

:hover {
  background: var(--primary-dark);
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
}
```

#### Secondary Button
```css
background: transparent;
color: var(--primary);
border: 2px solid var(--primary);
/* Rest same as primary */
```

### Form Elements

#### Input Fields
```css
border: 1px solid var(--gray-400);
border-radius: 4px;
padding: 12px 16px;
font-size: 16px; /* Prevents zoom on mobile */
min-height: 44px;

:focus {
  border-color: var(--primary);
  outline: 2px solid var(--primary-light);
  outline-offset: 2px;
}
```

### Cards
```css
background: white;
border: 1px solid var(--gray-200);
border-radius: 8px;
padding: 24px;
box-shadow: 0 1px 3px rgba(0,0,0,0.1);
```

## Motion & Animation

### Transitions
- **Fast:** 150ms (hovers, small changes)
- **Normal:** 250ms (most transitions)
- **Slow:** 350ms (modals, page transitions)
- **Easing:** cubic-bezier(0.4, 0, 0.2, 1)

### Hover Effects
- Buttons: Slight lift + shadow
- Links: Color change + underline
- Cards: Subtle shadow increase

## Accessibility Requirements

### Color Contrast
- Normal text: 4.5:1 minimum
- Large text (18px+): 3:1 minimum
- Use WebAIM contrast checker

### Focus States
- All interactive elements need visible focus
- 2px outline minimum
- High contrast color
- Never remove focus indicators

### Touch Targets
- 44x44px minimum
- 8px spacing between targets
- Larger for primary actions

## Implementation Guidelines

### CSS Custom Properties
```css
:root {
  /* Colors */
  --primary: #[YOUR_HEX];
  --primary-dark: #[DARKER_HEX];
  
  /* Typography */
  --font-sans: -apple-system, BlinkMacSystemFont, 
               "Segoe UI", Roboto, sans-serif;
  
  /* Spacing */
  --space-unit: 8px;
}
```

### File Organization
```
static/
├── css/
│   ├── base.css      /* Reset, typography */
│   ├── layout.css    /* Grid, containers */
│   ├── components.css /* Buttons, forms */
│   └── utilities.css  /* Helpers, overrides */
```

</details>

---

💡 **Tip:** Start with the Quick Start section. Add more details as your project grows and you need more consistency.