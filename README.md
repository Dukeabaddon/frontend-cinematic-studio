# Skill Creation — Frontend Cinematic Studio

Reusable Agent Skill package for award-level cinematic web design, with Graphify + Gate-MCP token tooling.

## What's here

| Path | Purpose |
|------|---------|
| `frontend-cinematic-studio/` | Installable skill (SKILL.md + handbook) |
| `tools/Gate-MCP/` | Gate-MCP clone (built locally) |
| `reference/` | Source prompts (Kimi, Claude refine, Gemini 3.5) |
| `install.ps1` | One-shot setup |
| `.cursor/mcp.json` | Gate-MCP server config |
| `.cursor/skills/` | Cursor copy of skill (after install) |

## Setup

```powershell
.\install.ps1
```

Copies skill to `.cursor/skills/`, clones/builds Gate-MCP under `tools/` (gitignored), writes `.cursor/mcp.json`. Template: `.cursor/mcp.json.example`.

Restart Cursor. Use `/frontend-cinematic-studio` in Agent chat.

**Note:** `reference/` is local-only (sample prompts, Gemini notes) — not in git. Workflow content lives in `frontend-cinematic-studio/references/workflows/`.

## Docs

- Skill README: [frontend-cinematic-studio/README.md](frontend-cinematic-studio/README.md)
- Verify: [frontend-cinematic-studio/checklists/verify.md](frontend-cinematic-studio/checklists/verify.md)

## Graphify

```powershell
python -m graphify .
python -m graphify query "your question"
```

PyPI package: `graphifyy`. Windows: use `python -m graphify`, not `/graphify`.
