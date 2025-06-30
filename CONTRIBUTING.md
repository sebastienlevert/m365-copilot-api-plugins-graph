# Contributing to Microsoft Graph API Plugins

Thank you for your interest in contributing to this project! This document outlines the guidelines for contributing.

## Conventional Commits

This project follows [Conventional Commits](https://www.conventionalcommits.org/) specification. All commit messages must follow this format:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Commit Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **build**: Changes that affect the build system or external dependencies
- **ci**: Changes to our CI configuration files and scripts
- **chore**: Other changes that don't modify src or test files
- **revert**: Reverts a previous commit

### Examples

```bash
feat: add email sending functionality
fix: resolve authentication token expiration
docs: update API documentation for task operations
refactor: simplify error handling in mail service
perf: optimize Graph API response parsing
test: add unit tests for task creation
build: update TypeSpec dependencies
ci: add conventional commit validation
chore: update package dependencies
```

### Using Commitizen (Recommended)

To make creating conventional commits easier, you can use commitizen:

```bash
# Install dependencies
npm install

# Use commitizen to create commits interactively
npm run commit
```

This will guide you through creating a properly formatted conventional commit.

### Manual Commit Guidelines

If you prefer to write commits manually, ensure they follow these rules:

1. **Type**: Must be one of the allowed types (see above)
2. **Scope**: Optional, should be lowercase (e.g., `mail`, `tasks`, `auth`)
3. **Description**: Should be lowercase, no trailing period, max 100 characters
4. **Body**: Optional, should be separated by a blank line
5. **Footer**: Optional, should be separated by a blank line

### Examples with Scope

```bash
feat(mail): add support for CC recipients
fix(tasks): resolve task deletion error
docs(api): add authentication examples
```

### Breaking Changes

For breaking changes, add `!` after the type/scope and include `BREAKING CHANGE:` in the footer:

```bash
feat!: remove deprecated sendEmail method

BREAKING CHANGE: The sendEmail method has been removed. Use sendMessage instead.
```

## Development Workflow

1. Fork the repository
2. Create a feature branch: `git checkout -b feat/my-new-feature`
3. Make your changes
4. Run tests: `npm test`
5. Run linting: `npm run lint`
6. Format code: `npm run format`
7. Commit using conventional commits: `npm run commit`
8. Push to your fork: `git push origin feat/my-new-feature`
9. Create a Pull Request

## Validation

All commits are validated using commitlint. The validation runs:

- **Locally**: Via husky pre-commit hooks (after running `npm run prepare`)
- **CI**: On all pull requests via GitHub Actions

If your commit message doesn't follow the conventional format, it will be rejected.

## Release Process

This project uses [Release Please](https://github.com/googleapis/release-please) for automated releases:

- Conventional commits automatically generate changelog entries
- Semantic versioning is handled automatically based on commit types
- Releases are created when changes are merged to the main branch
- NPM publishing happens automatically on release

## Questions?

If you have questions about contributing, please open an issue or start a discussion in the repository.
