---
applyTo: "**"
title: Assumption Guidelines
description: Guidlelines on when and when not to make assumptions as well as how to make assumptions.
author: "Jared Bloomer"
creation_date: "2025-08-22"
version: "1.0.0"
type: ai-interaction
---

# Assumptions

## Overview

When working within a project/feature, some details may not be clear. This document serves as a guide of how to handle these situations

## Constraints
- DO NOT under any circumstances make any assumptions, unless there is no path forward. 
  - When no path forward is clear, follow the process defined below in the [When Assumptions MUST be made](#When-Assumptions-MUST-be-made) section of this document.
- If details are not clear, prompt the user for additional detail/context, or to provide an example.
  - An Example of this would be
    - Scenario: Code is calling an external API
    - What not to do: Assumpt the structure of the response payload from the external API
    - What to do: Prompt the user to provide a sample response from the API and derrive the structure of the response from the provided sample. 

## When Assumptions MUST be made

In the event the user is unable to answer a question or provide a sample and assumptions MUST be made because there is no other solution the following criteria should be followed

1. Generate multiple solutions.
2. Rank the solutions based on the temperature of success.
3. Take the top 3 highest ranking solutions based on the temperature of success and present them to the user as proposed solutions.
4. Wait for guidance from the user before proceeding.

---
_Adhering to these guidelines ensures clarity, reduces errors, and fosters effective communication within the team._
