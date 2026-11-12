---
name: stitch
description: Commands and workflows for interacting with the Stitch Design System MCP server to fetch, create, and implement UI screens directly from chat.
---

# Stitch UI Generation Skill

This skill helps you leverage the **Stitch MCP Server** to build, fetch, and implement user interfaces natively in Flutter or web projects.

## How to Use Stitch

When the user requests to "build a screen with Stitch", "fetch from Stitch", or simply uses the `/stitch` command followed by a description, follow these steps:

### 1. Find the Project and Screens
If the user provides a project ID (e.g., `14615119299658956047`), use it directly. Otherwise, you can list projects:
- Tool: `call_mcp_tool`
- ServerName: `stitch`
- ToolName: `list_projects`

To list all screens in a project:
- ToolName: `list_screens`
- Arguments: `{"project_id": "YOUR_PROJECT_ID"}`

### 2. Get Screen Details
To implement a screen perfectly, fetch its JSON and HTML representation:
- ToolName: `get_screen`
- Arguments: `{"name": "projects/PROJECT_ID/screens/SCREEN_ID"}`

The returned HTML code defines the structure, layout, padding, colors (from the Material Design 3 tokens), and typography.

### 3. Implement the Design
When strictly implementing a screen:
- Recreate the structure in Flutter or the target framework using the EXACT same hierarchy (Rows, Columns, Grids, Stacks).
- Use the theme's `colorScheme` to match the background surfaces (`surface`, `surfaceContainerHighest`, `primary`, `secondary`, `tertiary` etc.).
- Use the theme's `textTheme` to match the typography (`titleLarge`, `bodyMedium`, `labelSmall`).
- If there are standard material icons, map them directly (e.g. `Icons.assignment` for homework).
- Create custom components/widgets for repeated elements like "Bento Grid Cards" or "Alerts".

### 4. Create or Edit Screens (Generative UI)
If the user asks to generate a **NEW** screen in Stitch from a prompt:
- ToolName: `generate_screen_from_text`
- Arguments: `{"project_id": "...", "prompt": "..."}`

If the user asks to edit an existing screen:
- ToolName: `edit_screens`
- Arguments: `{"project_id": "...", "screen_ids": ["..."], "prompt": "..."}`

### 5. Download Assets
If the user requests to download the design assets locally:
- ToolName: `download_assets`
- Arguments: `{"projectId": "...", "outputDir": "/absolute/path/to/assets"}`
(Remember to add the downloaded assets directory to `pubspec.yaml`).
