---
applyTo: '**'
title: Git Commit Messages
description: Framework for constructing git commit messages
author: "Jared Bloomer"
creation_date: "2025-08-22"
version: "1.0.0"
type: ai-interaction
---

# Git Commit Messages

## Goal
To Create clean, short, and desciptive git commit messages

## Contraints
- Describe what the commit does without explaining the steps taken
- Use Conventional Commits for all commit messages. See https://www.conventionalcommits.org/ for detailed information.
- Use proper case and punctuation
- Limit the line length of messages to 72 characters

### Extended Commit Message
- What is in the commit and it's expected outcome
- Prefix the message with an emjoi for specific situations such as a Bug fix, or a breaking change. Otherwise do not use emojis in commit messages
- If your change fixes an issue, you can reference it using `Fixes #issue_number`.
- If there are breaking changes, denote them with `BREAKING CHANGE:`.

## Conventional Commits

Creating clear and effective Git commit messages is essential for maintaining a robust version control history. Using the Conventional Commits specification helps standardize commit messages, making them easier to read and understand. Here’s a step-by-step guide to writing Git commit messages using Conventional Commits:

### Step 1: Understand the Structure of Conventional Commits

The structure of a Conventional Commit message typically follows this format:

<type>(<scope>): <description>

[optional body]

[optional footer]

- **type**: A noun that describes the type of change made (e.g., `feat`, `fix`, `docs`, `style`, `refactor`, etc.).
- **scope**: An optional area of the codebase affected by the change (e.g., `ui`, `api`, `database`, etc.).
- **description**: A short summary of the changes (preferably 72 characters or less).
- **optional body**: Additional information about the changes (if necessary).
- **optional footer**: Can include references to issues or breaking changes.

### Step 2: Determine the Type of Change

Identify the category of your change from the following common types:

- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation changes
- `style`: Changes that don't affect the meaning of the code (white-space, formatting)
- `refactor`: Code changes that neither fix a bug nor add a feature
- `perf`: A code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `chore`: Changes to the build process or auxiliary tools and libraries

### Step 3: Define the Scope (If Applicable)

If the change affects a specific part of the project, specify the scope. For example, if you’re working on the user interface, you can use `ui` as the scope.

### Step 4: Write the Commit Message

Start crafting your commit message:
1. Begin with the `type`, followed by the `scope` in parentheses if applicable.
2. Then, add a colon and a space.
3. Follow this with a concise `description` of the change.

**Example Commit Message:**
feat(ui): add new button component

**Example with Footer:**
feat(ui): add new button component

- Fixes #42

### Step 5: Use Good Practices

- **Keep messages clear and concise.** Avoid vague language.
- **Use the imperative mood.** Write as if you’re giving commands (e.g., "add", "fix", "implement").
- **Limit line length** (preferably 72 characters for the description).

By following these steps, your Git commit messages will be standardized, clear, and informative, facilitating better collaboration and understanding among team members.
