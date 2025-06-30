# Microsoft Graph API Plugins for TypeSpec

A TypeSpec library that provides pre-built Microsoft Graph API plugins for Microsoft 365 Copilot and other applications. This library includes ready-to-use API definitions for common Microsoft Graph operations like email management and task handling.

## Features

- 📧 **Mail Operations**: Send emails through Microsoft Graph API
- ✅ **Task Management**: Manage To-Do tasks and task lists
- 🔧 **TypeSpec Integration**: Built with TypeSpec for type-safe API definitions
- 🤖 **Copilot Ready**: Designed for Microsoft 365 Copilot integration
- 📊 **Adaptive Cards**: Includes pre-built adaptive card templates

## Installation

```bash
npm install m365-copilot-api-plugins-graph
```

## Peer Dependencies

Make sure you have the following TypeSpec packages installed:

```bash
npm install @typespec/http @typespec/openapi @typespec/openapi3
```

## Usage

### Basic Setup

Import the library in your TypeSpec project:

```typespec
import "m365-copilot-api-plugins-graph";
```

### Available Operations

#### Mail Operations

- **Send Email**: Send emails using the Microsoft Graph API with support for:
  - HTML and text content
  - Multiple recipients (To, CC)
  - Custom subjects and body content
  - Automatic saving to Sent Items

#### Task Operations

- **Get Task Lists**: Retrieve all To-Do task lists for the current user
- **Get Tasks**: Fetch tasks from specific task lists
- **Create Tasks**: Add new tasks to task lists
- **Update Tasks**: Modify existing tasks
- **Delete Tasks**: Remove tasks from task lists

### Authentication

This library uses Microsoft Graph API authentication. Make sure your application has the appropriate permissions:

#### Required Scopes for Mail

- `Mail.Send` - Send emails on behalf of the user
- `Mail.ReadWrite` - Read and write access to user mailboxes

#### Required Scopes for Tasks

- `Tasks.ReadWrite` - Read and write access to user tasks

### Example Usage

The library provides TypeSpec definitions that can be compiled to OpenAPI specifications for use in various applications, including Microsoft 365 Copilot plugins.

#### Sending an Email

```json
{
  "message": {
    "subject": "Hello from TypeSpec!",
    "body": {
      "contentType": "html",
      "content": "<h1>Hello World</h1>"
    },
    "toRecipients": [
      {
        "emailAddress": {
          "address": "user@example.com",
          "name": "John Doe"
        }
      }
    ]
  },
  "saveToSentItems": true
}
```

## Building

```bash
# Install dependencies
npm install

# Build the library
npm run build

# Run TypeSpec compilation
npm run build:tsp

# Run tests
npm test
```

## Development

```bash
# Watch for changes
npm run watch

# Lint code
npm run lint

# Format code
npm run format
```

## Project Structure

```
lib/
├── main.tsp      # Main TypeSpec entry point
├── mail.tsp      # Mail operations and models
├── tasks.tsp     # Task operations and models
├── models.tsp    # Shared data models
└── auth.tsp      # Authentication definitions
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and linting
5. Ensure your commit messages follow [Conventional Commits](https://www.conventionalcommits.org/)
6. Submit a pull request

### Commit Message Format

This project uses [Conventional Commits](https://www.conventionalcommits.org/) to ensure consistent and meaningful commit messages. All commits must follow this format:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

#### Supported Types

- feat: A new feature
- fix: A bug fix
- docs: Documentation only changes
- style: Changes that do not affect the meaning of the code
- refactor: A code change that neither fixes a bug nor adds a feature
- perf: A code change that improves performance
- test: Adding missing tests or correcting existing tests
- build: Changes that affect the build system or external dependencies
- ci: Changes to CI configuration files and scripts
- chore: Other changes that don't modify src or test files
- revert: Reverts a previous commit

#### Examples

```bash
feat: add email attachment support
fix(auth): resolve token refresh issue
docs: update API usage examples
test: add unit tests for task operations
```

#### Enforcement

- **Pre-commit hooks**: Commit messages are validated locally using commitlint
- **CI/CD**: Pull requests are automatically validated for conventional commit format
- **Release automation**: Semantic versioning and changelog generation depend on conventional commits

````
