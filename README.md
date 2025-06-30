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
5. Submit a pull request

## License

This project is licensed under the terms specified in the LICENSE file.

## Related Links

- [Microsoft Graph API Documentation](https://learn.microsoft.com/en-us/graph/)
- [TypeSpec Documentation](https://typespec.io/)
- [Microsoft 365 Copilot Plugin Development](https://learn.microsoft.com/en-us/microsoft-365-copilot/)
- [Microsoft Graph API Terms of Use](https://learn.microsoft.com/en-us/legal/microsoft-apis/terms-of-use)
