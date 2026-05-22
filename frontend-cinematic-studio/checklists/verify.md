# Verification Checklist

## Infra (once per machine)

- [ ] `python -m graphify --version` prints version
- [ ] `python -m graphify cursor install` ran for Cursor projects
- [ ] Gate-MCP built: `tools/Gate-MCP/dist/main.js` exists
- [ ] `.cursor/mcp.json` points to Gate with `GATE_PROJECT_ROOT`
- [ ] Cursor MCP panel: `gatemcp` connected
- [ ] Skill at `.cursor/skills/frontend-cinematic-studio/SKILL.md`

## Skill smoke test

- [ ] `/frontend-cinematic-studio` invokes skill
- [ ] Agent produces aesthetic tuple + **goals** before tasks
- [ ] Agent mentions graphify/gate when repo is large
- [ ] User brief appears after tool bursts (plain English)

## Per-change (cinematic project)

- [ ] Read/lint touched files
- [ ] `npm run build` or `tsc --noEmit` passes
- [ ] Hero layering still correct after edits
- [ ] Reduced motion path tested mentally or in browser

## Optional graph build

```powershell
cd your-project
python -m graphify .
```

Commit `graphify-out/` for team (exclude `manifest.json`, `cost.json` per Graphify docs).
