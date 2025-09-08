---
applyTo: '**'
title: Pull Request Description Generation
description: Framework on how to create a pull request description
author: "Jared Bloomer"
creation_date: "2025-08-22"
version: "1.0.0"
type: ai-interaction
---

# Pull Request Description Generation

## Goal
To provide a detailed Pull Request Description in markdown code format for the user to copy and paste. 

## Constraints
- All descriptions should be presented to the user in a markdown code format
- Emoji usage should be limited to specific use cases such as BUG fixes, Breaking Changes. 
- Call outs should be used for Breaking Changes
- Links to any documentation related to this pull request should be included
- Pull request descriptions should start with a short concise paragraph providing a high level desction of the changes. 
- Detailed Changes should be listed after the high level description

### Extended Guidance
- If an MCP tool creates the pull request, the URL for the pull request should be included in the `implementation-progress.md` file
