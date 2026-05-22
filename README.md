# Frontend Cinematic Studio

An [**Agent Skill**](https://agentskills.io/) that teaches AI coding assistants to build **award-level cinematic websites** — editorial layouts, tactile materials, intentional motion — while rejecting generic “AI slop” UI.

Includes optional **token-saving tooling** ([Graphify](https://github.com/safishamsi/graphify), [Gate-MCP](https://github.com/Dukeabaddon/Gate-MCP)) so agents explore large codebases without burning context on full-file reads.

**Works with:** [Cursor](https://cursor.com/docs/skills), [Google Antigravity](https://codelabs.developers.google.com/getting-started-with-antigravity-skills), [VS Code Copilot](https://code.visualstudio.com/docs/copilot/customization/agent-skills), and other agents that follow the open `SKILL.md` format.

---

## What problem does this solve?

| Without this skill | With this skill |
|--------------------|-----------------|
| Purple gradients, blur spam, template card grids | Custom palettes, material layers, editorial pacing |
| Agent jumps straight to tasks / code | **Goals first**, then implementation |
| Grep + read entire repo | Graphify map + Gate-compressed reads |
| Long agent monologues | Tool-first workflow + short **User briefs** for you |

The skill is a **portable design + engineering playbook** (philosophy, motion rules, anti-patterns, workflows) — not a one-off prompt.

---

## What you get

```
frontend-cinematic-studio/     ← the skill (copy this folder to your IDE)
├── SKILL.md                   ← agent control plane (~170 lines)
├── references/                ← handbook (loaded on demand)
├── checklists/                ← award bar + verify
└── prompts/                   ← reusable site briefs

install.ps1                    ← optional: Graphify + Gate-MCP + Cursor wiring
```

**Invoke in Agent chat:** `/frontend-cinematic-studio`

The skill is **manual-only** (`disable-model-invocation: true`) — you turn it on when you want cinematic mode, not on every message.

---

## Prerequisites

| Tool | Purpose | Install |
|------|---------|---------|
| **Python 3.10+** | Graphify CLI | [python.org](https://www.python.org/downloads/) |
| **Node.js 20+** | Gate-MCP (via install script) | [nodejs.org](https://nodejs.org/) |
| **Git** | Clone this repo | — |
| **Cursor / Copilot / Antigravity** | Host for skills + MCP | — |

Graphify and Gate are **optional** for the design doctrine alone, but **recommended** for large projects and token efficiency.

---

## Quick start

### 1. Clone and install tooling

```powershell
git clone https://github.com/Dukeabaddon/frontend-cinematic-studio.git
cd frontend-cinematic-studio
.\install.ps1
```

`install.ps1` will:

- Install **`graphifyy`** from PyPI and register Graphify for Cursor
- Clone and build **Gate-MCP** under `tools/` (gitignored)
- Copy the skill to **`.cursor/skills/frontend-cinematic-studio/`**
- Write **`.cursor/mcp.json`** for Gate (local path; not committed)

### 2. Restart your IDE

Confirm **MCP → `gatemcp`** is connected (Cursor: Settings → MCP).

### 3. Run the skill

In **Agent** chat:

```text
/frontend-cinematic-studio
```

Then describe your site, for example:

```text
Forest gothic portfolio. Parchment to charcoal acts. Hero: figure right,
monumental serif type behind landscape. Next.js + Framer Motion.
```

The agent should respond with:

1. **Aesthetic tuple** (mood, palette, fonts, motion, z-layers)
2. **Goals** (outcomes, not a task list)
3. Token-stack steps if the repo is large

---

## How to use the skill (workflows)

| Phase | When | Skill reference |
|-------|------|-----------------|
| **0 — Plan** | Before any code | `aesthetic-tuple-template.md`, `scope-triage.md` |
| **1 — Build** | New site from reference image | `workflows/phase-1-kimi-build.md` |
| **2 — Refine** | Fix motion, z-index, polish | `workflows/phase-2-claude-refine.md` |
| **3 — Score reference** | Before feeding Pinterest to a vision model | `workflows/phase-3-pinterest-score.md` (need ≥3/4) |

**Prompt tuning:** “more atmospheric”, “less generic”, “premium anime” → see [prompt-interpreter.md](frontend-cinematic-studio/references/prompt-interpreter.md).

**Quality gate before ship:** [checklists/award-bar.md](frontend-cinematic-studio/checklists/award-bar.md).

---

## Install the skill only (no repo tooling)

Copy one folder to your project or global skills path:

| IDE | Path |
|-----|------|
| **Cursor (project)** | `.cursor/skills/frontend-cinematic-studio/` |
| **Cursor (global)** | `~/.cursor/skills/frontend-cinematic-studio/` |
| **Antigravity** | `.agent/skills/frontend-cinematic-studio/` |
| **VS Code Copilot** | `.github/skills/frontend-cinematic-studio/` |

```powershell
Copy-Item -Recurse frontend-cinematic-studio .cursor\skills\frontend-cinematic-studio
```

Skill-only install: design rules still apply. For Graphify + Gate, run `install.ps1` or follow [token-stack.md](frontend-cinematic-studio/references/token-stack.md).

---

## Token stack (Graphify + Gate-MCP)

Used together on **large or unfamiliar** codebases.

### Graphify — map the project

```powershell
pip install graphifyy
python -m graphify .                    # Windows: no leading /
python -m graphify query "auth flow"
```

Builds `graphify-out/` (graph + report). Prefer **scoped queries** over reading every file.

### Gate-MCP — compress what you read

MCP tools: `gate_init`, `gate_compress_file`, `gate_graph_query`, `gate_clean_response`.

**Typical order:** `gate_init` → graphify map → compress files → edit → clean JSON responses.

Details: [frontend-cinematic-studio/references/token-stack.md](frontend-cinematic-studio/references/token-stack.md).

### Caveman mode (agent only)

Short tool-first narration saves tokens; you still get a plain-English **User brief** after each step (accessibility). Defined in `SKILL.md`.

---

## Repository layout

```text
skill-creation/                          # this repo
├── README.md                            # you are here
├── install.ps1                          # setup script
├── .gitignore
│
├── frontend-cinematic-studio/           # ★ publishable skill package
│   ├── SKILL.md
│   ├── README.md                        # skill-focused install notes
│   ├── references/                      # design handbook
│   ├── checklists/
│   └── prompts/
│
├── .cursor/
│   ├── mcp.json.example                 # Gate template (committed)
│   └── rules/graphify.mdc               # Graphify query-first rule
│
└── (local only, gitignored)
    ├── reference/                       # your private prompt archives
    ├── tools/Gate-MCP/                  # cloned by install.ps1
    ├── .cursor/mcp.json                 # machine-specific paths
    ├── .cursor/skills/                  # install.ps1 copy of skill
    ├── graphify-out/
    └── .gate-mcp/
```

---

## Example session

```text
You:  /frontend-cinematic-studio
      Editorial travel site. Wes Anderson symmetry + Ghibli atmosphere.
      Reference image attached. Next.js.

Agent: [Aesthetic tuple + 4 goals]
       G1 Hero z-planes: type behind landscape...
       G2 Black act between chapters...
       ...

You:  Goals approved. Build.

Agent: [Uses tech-stack-menu Tier A: Next, Tailwind, Framer, Lenis]
       [graphify / gate_compress_file on large files if needed]
       [Implements; User brief after each phase]
```

---

## Verify installation

See [frontend-cinematic-studio/checklists/verify.md](frontend-cinematic-studio/checklists/verify.md).

Quick checks:

- [ ] `python -m graphify --version`
- [ ] MCP `gatemcp` connected
- [ ] Skill visible in Cursor Settings → Rules
- [ ] `/frontend-cinematic-studio` → goals + aesthetic tuple before code

---

## Troubleshooting

| Issue | Fix |
|-------|-----|
| `graphify` not found | Use `python -m graphify` (Windows PATH) |
| `/graphify` fails in PowerShell | Use `graphify .` without leading `/` |
| Gate MCP offline | Run `.\install.ps1`; restart Cursor; check `.cursor/mcp.json` |
| Skill not in `/` menu | Copy folder to `.cursor/skills/`; restart; invoke exact name |
| Agent writes tasks first | Re-invoke skill; say “goals only until I approve” |
| Purple gradient hero | Point agent to `anti-patterns.md` |

---

## How to improve this skill

Best practices from the [Agent Skills spec](https://agentskills.io/specification) and [authoring guides](https://agentskill.sh/readme):

1. **Keep `SKILL.md` under 500 lines** — deep content stays in `references/`.
2. **Tune `description` in frontmatter** — third person, what + when (discovery trigger).
3. **Test with real projects** — run award-bar + verify checklists after changes.
4. **Add examples to `prompts/`** — one markdown file per site archetype.
5. **Version in frontmatter** — bump `metadata.version` when behavior changes.

Suggested edits:

| Want to… | Edit |
|----------|------|
| Change art direction | `references/philosophy.md`, `anti-patterns.md` |
| Add a library default | `references/tech-stack-menu.md` |
| New workflow (e.g. Shopify) | `references/workflows/phase-*.md` + link from `SKILL.md` |
| Stricter token rules | `references/token-stack.md` |

---

## Credits and links

| Resource | URL |
|----------|-----|
| Agent Skills open standard | https://agentskills.io/ |
| Graphify | https://github.com/safishamsi/graphify |
| Gate-MCP | https://github.com/Dukeabaddon/Gate-MCP |
| Cursor Skills docs | https://cursor.com/docs/skills |

**License:** Skill content — use and adapt for your projects. Third-party tools have their own licenses.

---

## FAQ

**Is `reference/` in git?**  
No. It is for your local prompt archives. Workflow content is in `frontend-cinematic-studio/references/workflows/`.

**Can I use this without Gate or Graphify?**  
Yes. Copy the skill folder only. Token tools are optional accelerators.

**Why manual invocation?**  
So normal coding is not forced into cinematic mode. Remove `disable-model-invocation` in `SKILL.md` if you want auto-triggering.

**Default tech stack?**  
Agent reads `package.json` first, then suggests Tier A (Next + Tailwind + Framer + Lenis) or B/C — see `tech-stack-menu.md`.
