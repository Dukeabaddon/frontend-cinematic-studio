# Frontend Cinematic Studio

Installable Agent Skill for award-level cinematic web design — goals-first workflow, anti-AI-slop doctrine, Graphify + Gate-MCP token stack, caveman agent narration with accessible user briefs.

## Quick install

### 1. Tools (this repo)

```powershell
cd c:\Users\Aaron\Documents\n8n\skill-creation
.\install.ps1
```

Or manually:

```powershell
pip install graphifyy
python -m graphify cursor install
cd tools\Gate-MCP
npm install --legacy-peer-deps
npm run build
```

Restart Cursor after MCP config is written.

### 2. Skill (pick one)

**Project (recommended):**

```powershell
Copy-Item -Recurse frontend-cinematic-studio .cursor\skills\frontend-cinematic-studio
```

**Global (all projects):**

```powershell
Copy-Item -Recurse frontend-cinematic-studio $env:USERPROFILE\.cursor\skills\frontend-cinematic-studio
```

**Antigravity:**

```powershell
Copy-Item -Recurse frontend-cinematic-studio .agent\skills\frontend-cinematic-studio
```

**VS Code Copilot:**

```powershell
Copy-Item -Recurse frontend-cinematic-studio .github\skills\frontend-cinematic-studio
```

### 3. Use

In Agent chat: `/frontend-cinematic-studio`

Then describe the site (reference image, mood, stack). Agent writes **goals** before code.

## Verify

- [ ] `python -m graphify --version`
- [ ] Cursor → MCP → `gatemcp` connected
- [ ] Skill appears in Cursor Settings → Rules
- [ ] Invoke `/frontend-cinematic-studio` — agent outputs goals + aesthetic tuple

## Structure

```
frontend-cinematic-studio/
├── SKILL.md              # Control plane
├── README.md
├── references/           # Handbook (progressive disclosure)
├── checklists/
├── prompts/
└── install.ps1 (repo root)
```

## Links

- [Graphify](https://github.com/safishamsi/graphify) — PyPI: `graphifyy`
- [Gate-MCP](https://github.com/Dukeabaddon/Gate-MCP) — cloned to `tools/Gate-MCP`
- [Agent Skills spec](https://agentskills.io/specification)
