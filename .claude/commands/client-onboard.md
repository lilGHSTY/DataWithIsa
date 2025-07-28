# /client-onboard

Onboard a new client to the system.

## Description
This command guides through the complete client onboarding process.

## Usage
```
/client-onboard "Business Name" email@example.com
```

## Steps
1. Create client record in database
2. Set up initial dashboard configuration
3. Send magic link welcome email
4. Create first month's invoice (if applicable)
5. Schedule follow-up call
6. Add to CRM system

## Checklist
- [ ] Client information collected
- [ ] Dashboard type selected
- [ ] Data sources identified
- [ ] Pricing tier confirmed
- [ ] Welcome email sent
- [ ] Access verified

## Notes
- Always verify email address before sending magic link
- Default to Foundation tier unless specified
- Set reminder for 48-hour follow-up