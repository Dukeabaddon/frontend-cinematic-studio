# Frontend Cinematic Studio v3 — Skill Package

Portable [**Agent Skill**](https://agentskills.io/) folder. Works across **6 IDEs**: Cursor, Claude Code, Antigravity, Windsurf, Trae, VS Code Copilot.

**Skill ID:** `frontend-cinematic-studio`  
**Invoke:** `/frontend-cinematic-studio` in Agent chat  
**Mode:** Manual invocation (won't auto-load on every message)

---

## What this skill does

Teaches the agent to:

- **Dialectic design review** — 2-3 rounds of layout + visual system questioning before coding
- **Section-by-section builds** — Never generate full pages in one shot
- Write **goals** (outcomes) before **tasks** (implementation)
- Build **cinematic, tactile, editorial** UIs — not generic SaaS templates
- Follow **anti-AI-slop** rules (palette, motion, materials, composition)
- Generate **DESIGN.md** (9-section standard) as persistent design source of truth
- Use **Graphify + Gate-MCP** when exploring large codebases (auto-detected per IDE)
- Apply **footer patterns** from 4 archetypes (reveal, typographic, editorial, minimal)
- Give you clear **User briefs** after tool runs (accessible guidance)

---

## Install

### Quick install (recommended)

```powershell
# From repo root — generates skill + IDE config
.\install.ps1 -IDE cursor       # or claude, antigravity, windsurf, trae, copilot
```

### Manual install

Copy the `frontend-cinematic-studio/` directory:

| IDE | Skill Destination | Config File |
|---|---|---|
| Cursor (project) | `.cursor/skills/frontend-cinematic-studio/` | `.cursor/rules/frontend-cinematic.mdc` |
| Claude Code | Referenced in `CLAUDE.md` | `CLAUDE.md` (project root) |
| Antigravity | `.agent/skills/frontend-cinematic-studio/` | Plugin `plugin.json` |
| Windsurf | `.windsurf/skills/frontend-cinematic-studio/` | `.windsurf/rules/frontend-cinematic.md` |
| Trae | `.trae/skills/frontend-cinematic-studio/` | `.trae/rules/frontend-cinematic.md` |
| Copilot | `.github/skills/frontend-cinematic-studio/` | `.github/copilot-instructions.md` |

Restart the IDE. Confirm the skill under **Settings → Rules** (Cursor) or equivalent.

---

## Usage

### 1. Invoke

```text
/frontend-cinematic-studio
```

### 2. Provide a brief

Include what you can:

- **Mood** (e.g. forest gothic, editorial travel, neon alley)
- **Reference** (image URL or attachment)
- **Stack** (or "suggest stack" — agent uses `references/tech-stack-menu.md`)
- **Scope** (landing only vs full site)

### 3. Dialectic review (full pages)

Agent presents layout plan → you approve/adjust → agent presents visual system → you approve → building starts.

### 4. Section-by-section build

Agent builds hero → shows you → you approve → builds next section → repeat → footer → polish → pre-ship audit.

### 5. Optional workflows

| Goal | Open |
|------|------|
| New build from Pinterest | `references/workflows/phase-3-pinterest-score.md` then `phase-1-kimi-build.md` |
| Fix motion / hero layers | `references/workflows/phase-2-claude-refine.md` |
| Tune "more cinematic" | `references/prompt-interpreter.md` |

---

## Package contents

```text
frontend-cinematic-studio/
├── SKILL.md                       # Agent entry (read first on invoke)
├── README.md                      # This file
├── references/
│   ├── visual-systems.md          # Composition + materials + transitions
│   ├── motion-and-type.md         # Motion + typography
│   ├── footer-patterns.md         # 4 footer archetypes
│   ├── design-md-template.md      # DESIGN.md 9-section generation template
│   ├── creative-effects-library.md # Transitions, textures, shapes, animations (30+ patterns)
│   ├── svg-asset-guide.md         # Lanterns, vines, frames, sparkles + decision tree
│   ├── palette-and-type-database.md # 15 palettes, 10 font pairings, auto-suggest logic
│   ├── tooling-guide.md           # Graphify + Gate-MCP + platform setup
│   ├── philosophy.md
│   ├── anti-patterns.md
│   ├── prompt-interpreter.md
│   ├── aesthetic-tuple-template.md
│   ├── scope-triage.md
│   ├── tech-stack-menu.md
│   ├── architecture.md
│   ├── agentic-engineering.md
│   └── workflows/
│       ├── phase-1-kimi-build.md
│       ├── phase-2-claude-refine.md
│       └── phase-3-pinterest-score.md
├── checklists/
│   ├── award-bar.md
│   └── verify.md
└── prompts/
    ├── anime-fantasy-landing.md   # Dark anime/fantasy
    ├── anime-portfolio-light.md   # Light/ivory art portfolio (JUPITXR-style)
    ├── gaming-wiki.md             # Game art wiki/collection
    ├── personal-portfolio.md      # Developer/creative portfolio
    ├── product-landing.md         # SaaS/product (cinematic)
    ├── saas-dark-hero.md          # Premium dark SaaS (Linear/Vercel-style)
    └── editorial-magazine.md      # Content-heavy editorial
```

**Progressive disclosure:** `SKILL.md` is the table of contents; agents load `references/*.md` only when needed.

---

## v3 Changelog

- **Dialectic design review** — Mandatory 2-3 round questioning before full-page builds
- **Section-by-section builds** — Never generate full page in one shot
- **Liquid Glass v2** — Refined `.liquid-glass` class with `::before` border gradient
- **FadeIn wrapper** — Reusable scroll-reveal component pattern
- **Character-by-character text reveal** — Cinematic hero headline animation
- **Footer patterns** — 4 archetypes: reveal, typographic, editorial, minimal
- **DESIGN.md template** — 9-section AI-readable design system standard
- **6-IDE support** — Cursor, Claude Code, Antigravity, Windsurf, Trae, Copilot
- **IDE config generator** — `install.ps1 -IDE <name>` generates correct config per IDE
- **Gate-MCP auto-detection** — Tooling check runs before any code
- **11-point pre-ship audit** — Added footer + Liquid Glass v2 checks

---

## Checklists

- Before shipping a site: [checklists/award-bar.md](checklists/award-bar.md)
- After install or edits: [checklists/verify.md](checklists/verify.md)
