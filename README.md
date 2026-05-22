# Frontend Cinematic Studio

<p align="center">
  <strong>Agent Skill</strong> for award-level cinematic websites — goals-first design, anti-AI-slop, Graphify maps, Gate-MCP compression.
</p>

<p align="center">
  <a href="https://agentskills.io/">Agent Skills</a> ·
  <a href="https://cursor.com/docs/skills">Cursor</a> ·
  <a href="https://github.com/safishamsi/graphify">Graphify</a> ·
  <a href="https://github.com/Dukeabaddon/Gate-MCP">Gate-MCP</a>
</p>

---

## TL;DR

| Step | Action |
|------|--------|
| 1 | `git clone https://github.com/Dukeabaddon/frontend-cinematic-studio.git` |
| 2 | `.\install.ps1` → restart Cursor |
| 3 | MCP **gatemcp** = green |
| 4 | Agent: `/frontend-cinematic-studio` + your site brief |

Agent **auto-detects** Graphify/Gate, **installs if missing**, **reuses** existing `graphify-out/`. Gate is **always on** for code reads when MCP works.

---

## What is this?

Not a website. Not an npm app. A **portable skill folder** ([open standard](https://agentskills.io/specification)) that tells AI agents how to build **handcrafted, cinematic frontends** — and how to save tokens while doing it.

```
You invoke  →  Agent loads SKILL.md  →  Goals first  →  Graphify map  →  Gate reads  →  Code
```

---

## Skill vs plugin vs MCP (Cursor & Antigravity)

Popular repos use different packaging. Yours uses **Agent Skill + MCP**:

| Type | What it is | Example | This repo |
|------|------------|---------|-----------|
| **Agent Skill** | Folder + `SKILL.md`, `/slash` invoke | [agentskills.io](https://agentskills.io/) | **`frontend-cinematic-studio/`** |
| **Cursor plugin** | `.cursor-plugin/plugin.json` auto-discovery | [Understand-Anything](https://github.com/Lum1104/Understand-Anything) (~17k★) | Not included — copy skill folder instead |
| **MCP server** | Tools in Settings → MCP | Gate-MCP | **`gatemcp`** via `.cursor/mcp.json` |
| **Cursor rule** | Always-on `.mdc` | Graphify rule | **`.cursor/rules/graphify.mdc`** after install |

### [Understand-Anything](https://github.com/Lum1104/Understand-Anything) (rising star)

- **Plugin** with dashboard, `/understand`, `/understand-chat`
- Cursor: clone repo → `.cursor-plugin/plugin.json` auto-loads
- Graph at `.understand-anything/knowledge-graph.json`
- Great for **exploring** code visually

### [Graphify](https://github.com/safishamsi/graphify) (~51k★)

- **Skill + CLI** — `python -m graphify .` → `graphify-out/`
- Lighter, query from terminal/agent shell
- **This skill uses Graphify by default**

### [Gate-MCP](https://github.com/Dukeabaddon/Gate-MCP)

- **MCP only** — compresses each file read (~89% on large repos)
- **This skill requires Gate whenever MCP is online**

| You want… | Install |
|-----------|---------|
| Cinematic design + token stack | **This repo** |
| Big interactive graph UI | [Understand-Anything](https://github.com/Lum1104/Understand-Anything) (optional, works alongside) |
| Map only | `pip install graphifyy` |
| Compress reads only | `npx -y @gatemcp/cli` + MCP config |

**Antigravity:** copy skill to `.agent/skills/frontend-cinematic-studio/` — same `SKILL.md` format ([Google codelab](https://codelabs.developers.google.com/getting-started-with-antigravity-skills)).

**OpenClaw / Codex / Copilot:** same skill folder; paths in [frontend-cinematic-studio/README.md](frontend-cinematic-studio/README.md).

---

## Features

- **Goals, not tasks** — outcomes before implementation  
- **Anti-AI-slop** — ban purple gradients, fake STATUS widgets, blur spam  
- **Auto tooling** — detect `graphify-out/`, install `graphifyy`, bootstrap Gate  
- **Gate always** — compress code reads by default  
- **Brief replies** — short User briefs (accessibility-friendly)  
- **Handbook** — materials, motion, Pinterest workflow, award checklist  

---

## Quick start

```powershell
git clone https://github.com/Dukeabaddon/frontend-cinematic-studio.git
cd frontend-cinematic-studio
.\install.ps1
```

Restart Cursor → MCP **gatemcp** connected.

```text
/frontend-cinematic-studio
Editorial portfolio. Forest gothic. Next.js.
```

Expect **short Preflight** → aesthetic tuple → **goals** → code.

### Use on a **new website** repo

```powershell
# 1) New site
npx create-next-app@latest my-site --ts --tailwind --app
cd my-site

# 2) Copy skill
mkdir .cursor\skills -Force
Copy-Item -Recurse ..\frontend-cinematic-studio\frontend-cinematic-studio .cursor\skills\frontend-cinematic-studio

# 3) Tooling (from skill repo clone)
Copy-Item ..\frontend-cinematic-studio\scripts .\scripts -Recurse
Copy-Item ..\frontend-cinematic-studio\.cursor\mcp.json.example .cursor\mcp.json
# Edit GATE_PROJECT_ROOT inside mcp.json to this folder path
.\scripts\bootstrap-tooling.ps1
```

Restart Cursor. Open **my-site**. Invoke skill.

---

## Tooling (brief)

### Graphify — project map

```powershell
pip install graphifyy          # if missing — bootstrap does this
python -m graphify .           # builds graphify-out/
python -m graphify query "auth flow"
```

### Gate-MCP — smaller reads

- Agent calls `gate_init` every session  
- Uses `gate_compress_file` instead of full file dumps  
- **You:** keep MCP green; read [gate-quick.md](frontend-cinematic-studio/references/gate-quick.md) (1 page)

```powershell
.\scripts\bootstrap-tooling.ps1   # detect / install / scan
```

### Caveman

Short agent **tool** chatter only. **You** always get plain English bullets.

---

## Project structure

```text
frontend-cinematic-studio/          # GitHub repo root
├── README.md                     # ← you are here
├── install.ps1                   # full setup
├── scripts/
│   └── bootstrap-tooling.ps1     # detect | install | scan
├── frontend-cinematic-studio/    # ★ copy this folder to any project
│   ├── SKILL.md
│   ├── references/
│   │   ├── mandatory-preflight.md
│   │   ├── gate-quick.md         # brief Gate guide for humans
│   │   └── workflows/ …
│   └── checklists/
├── .cursor/
│   ├── mcp.json.example
│   └── rules/graphify.mdc
└── (gitignored locally)
    ├── reference/                # your private prompts
    ├── tools/Gate-MCP/
    └── graphify-out/
```

---

## Install paths

| IDE | Skill folder |
|-----|----------------|
| Cursor (project) | `.cursor/skills/frontend-cinematic-studio/` |
| Cursor (global) | `~/.cursor/skills/frontend-cinematic-studio/` |
| Antigravity | `.agent/skills/frontend-cinematic-studio/` |
| VS Code Copilot | `.github/skills/frontend-cinematic-studio/` |

**npm?** No. Skills are folders, not packages. Use `pip install graphifyy` and `npx @gatemcp/cli` for tools.

---

## Verify

- [ ] `python -m graphify --version`
- [ ] MCP **gatemcp** green
- [ ] `/frontend-cinematic-studio` → short Preflight + goals

Full list: [checklists/verify.md](frontend-cinematic-studio/checklists/verify.md)

---

## Troubleshooting (short)

| Problem | Fix |
|---------|-----|
| Agent ignores Gate | Invoke `/frontend-cinematic-studio`; MCP must be green |
| No `gate_*` tools | `.\install.ps1`, restart Cursor |
| No graph | `python -m graphify .` in **website** folder |
| Overwhelmed by text | Skill uses brief mode — say “shorter” or read gate-quick.md only |

---

## FAQ

**Understand-Anything vs this skill?**  
Understand-Anything = plugin + dashboard for **maps**. This skill = **design doctrine** + Graphify + Gate. Use both if you want.

**Plugin for Cursor?**  
This repo is a **skill**, not `.cursor-plugin/`. Copy `frontend-cinematic-studio/` into `.cursor/skills/`. For plugin-style UX, add [Understand-Anything](https://github.com/Lum1104/Understand-Anything) separately.

**Always use Gate?**  
Yes when MCP is on. Skill enforces `gate_init` + compress-by-default. If MCP offline, agent warns you in one sentence.

---

## Links

| Resource | URL |
|----------|-----|
| This repo | https://github.com/Dukeabaddon/frontend-cinematic-studio |
| Agent Skills spec | https://agentskills.io/specification |
| Understand-Anything | https://github.com/Lum1104/Understand-Anything |
| Graphify | https://github.com/safishamsi/graphify |
| Gate-MCP | https://github.com/Dukeabaddon/Gate-MCP |
| Cursor Skills | https://cursor.com/docs/skills |

---

## License

Skill content: use and adapt for your projects. Third-party tools have their own licenses.
