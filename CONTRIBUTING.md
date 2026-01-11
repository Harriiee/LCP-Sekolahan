# Contributing to LCP Sekolahan

Thank you for your interest in contributing to the LCP Sekolahan login template! We welcome contributions from the community.

## How to Contribute

### Reporting Bugs

If you find a bug, please open an issue on GitHub with:
1. Clear description of the bug
2. Steps to reproduce
3. Expected behavior
4. Actual behavior
5. Browser and OS information
6. Screenshots if applicable

Example:
```
Title: Login button doesn't respond on mobile
Description: 
- Browser: Chrome 120.0
- OS: iOS 17
- Steps: Open on mobile, enter credentials, click LOGIN button
- Expected: Form submission
- Actual: No response, button appears frozen
```

### Suggesting Enhancements

We're open to feature suggestions! Please include:
1. Feature description
2. Use case/benefit
3. Possible implementation approach
4. Any relevant examples or mockups

### Submitting Changes

1. **Fork the repository**
   ```bash
   git clone https://github.com/YOUR-USERNAME/LCP-Sekolahan.git
   cd LCP-Sekolahan
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**
   - Keep changes focused and minimal
   - Test thoroughly in multiple browsers
   - Follow existing code style

4. **Test on different devices**
   - Desktop (Chrome, Firefox, Safari, Edge)
   - Tablet (iPad, Android tablet)
   - Mobile (iPhone, Android phones)
   - Different screen sizes

5. **Commit with clear messages**
   ```bash
   git commit -m "feat: add two-factor authentication"
   git commit -m "fix: resolve button color on dark theme"
   git commit -m "docs: update README with new features"
   ```

6. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

7. **Open a Pull Request**
   - Describe your changes clearly
   - Reference any related issues
   - Include screenshots if UI changed

## Code Style Guidelines

### HTML
- Use semantic HTML5 tags
- Keep proper indentation (2 spaces)
- Add comments for complex sections
- Use meaningful IDs and classes

### CSS
- Mobile-first approach
- Use meaningful class names (BEM style)
- Group related properties
- Add comments for non-obvious styles
- Keep specificity low

### JavaScript
- Use const/let (avoid var)
- Add JSDoc comments for functions
- Keep functions focused and small
- Use meaningful variable names
- Handle errors properly

Example:
```javascript
/**
 * Validates login form input
 * @param {string} username - The username to validate
 * @param {string} password - The password to validate
 * @returns {boolean} - True if valid, false otherwise
 */
function validateForm(username, password) {
    if (!username || username.length < 3) {
        return false;
    }
    if (!password || password.length < 6) {
        return false;
    }
    return true;
}
```

## Testing Checklist

Before submitting a PR, test:
- [ ] Form validation works
- [ ] Error messages display correctly
- [ ] Success messages display correctly
- [ ] Lockout feature works after 5 attempts
- [ ] Form resets after successful login
- [ ] Responsive design on mobile (320px+)
- [ ] Responsive design on tablet (768px+)
- [ ] Responsive design on desktop (1024px+)
- [ ] Button hover states
- [ ] Input focus states
- [ ] No console errors
- [ ] No broken links
- [ ] Logo displays correctly
- [ ] Copyright text is visible

## Documentation

When adding new features, please update:
- `README_TEMPLATE.md` - Add feature description
- Add code comments
- Update this file if needed
- Add examples for backend integration if applicable

## Branch Naming

Use descriptive branch names:
- `feature/add-two-fa` - New feature
- `fix/button-color-issue` - Bug fix
- `docs/update-readme` - Documentation
- `refactor/improve-validation` - Code improvement

## Commit Message Convention

```
<type>: <subject>

<body>

<footer>
```

Types:
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation
- `style:` Code style (formatting, etc.)
- `refactor:` Code refactoring
- `perf:` Performance improvement
- `test:` Tests
- `chore:` Build, dependencies, etc.

Example:
```
feat: add email verification for login

- Implement email OTP verification
- Add 5-minute expiration for codes
- Update form to include email field
- Add backend endpoint documentation

Closes #123
```

## Pull Request Process

1. Update documentation if needed
2. Add any new features to README
3. Ensure all tests pass
4. Request review from maintainers
5. Address review feedback
6. Squash commits if needed (we prefer clean history)

## Areas for Contribution

### High Priority
- Accessibility improvements (WCAG 2.1)
- Security enhancements
- Performance optimization
- Browser compatibility fixes
- Mobile responsiveness

### Medium Priority
- Additional language translations
- Dark theme support
- Enhanced error messages
- Improved validation
- Code documentation

### Lower Priority
- Visual improvements
- Optional features
- Example integrations

## Questions?

- Check existing issues and discussions
- Read the main README.md
- Open a GitHub issue with your question

## Code of Conduct

Please be respectful and constructive in all interactions. We welcome all contributions regardless of experience level.

---

Thank you for helping make LCP Sekolahan better! 🎓
