# /deploy-check

Pre-deployment checklist and verification.

## Description
Run this before deploying to production to ensure everything is ready.

## Usage
```
/deploy-check
```

## Automated Checks
1. Run all tests
2. Check for console.log statements
3. Verify environment variables
4. Lint Python and JavaScript
5. Check database migrations
6. Verify static asset optimization

## Manual Checks
- [ ] All forms tested on mobile
- [ ] Magic links tested
- [ ] Dashboard loads correctly
- [ ] Email delivery verified
- [ ] SSL certificate valid
- [ ] Backup system tested
- [ ] Error pages customized
- [ ] Admin access secured

## Deploy Command
After all checks pass:
```bash
git push origin main
ssh user@server './deploy.sh'
```

## Rollback Plan
If issues occur:
```bash
git revert HEAD
git push origin main
ssh user@server './rollback.sh'
```