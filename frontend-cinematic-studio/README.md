# Frontend Cinematic Studio — Skill Package

Portable [**Agent Skill**](https://agentskills.io/) folder. Copy `frontend-cinematic-studio/` into your IDE skills path — no other files required for the design system to work.

**Skill ID:** `frontend-cinematic-studio`  
**Invoke:** `/frontend-cinematic-studio` in Agent chat  
**Mode:** Manual invocation (won’t auto-load on every message)

---

## What this skill does

Teaches the agent to:

- Write **goals** (outcomes) before **tasks** (implementation)
- Build **cinematic, tactile, editorial** UIs — not generic SaaS templates
- Follow **anti-AI-slop** rules (palette, motion, materials, composition)
- Use **Graphify + Gate-MCP** when exploring large codebases (optional)
- Give you clear **User briefs** after tool runs (accessible guidance)

Full repo setup (install script, MCP, Graphify): see [../README.md](../README.md).

---

## Install (skill only)

Copy this directory:

| IDE | Destination |
|-----|-------------|
| Cursor (project) | `.cursor/skills/frontend-cinematic-studio/` |
| Cursor (global) | `~/.cursor/skills/frontend-cinematic-studio/` |
| Antigravity | `.agent/skills/frontend-cinematic-studio/` |
| VS Code Copilot | `.github/skills/frontend-cinematic-studio/` |

```powershell
# From repo root
Copy-Item -Recurse frontend-cinematic-studio .cursor\skills\frontend-cinematic-studio
```

Restart the IDE. Confirm the skill under **Settings → Rules** (Cursor) or **Agent Customizations → Skills** (Copilot).

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
- **Stack** (or “suggest stack” — agent uses `references/tech-stack-menu.md`)
- **Scope** (landing only vs full site)

### 3. Approve goals

Agent outputs **aesthetic tuple** + **goals**. Reply `approved` or edit goals before code.

### 4. Optional workflows

| Goal | Open |
|------|------|
| New build from Pinterest | `references/workflows/phase-3-pinterest-score.md` then `phase-1-kimi-build.md` |
| Fix motion / hero layers | `references/workflows/phase-2-claude-refine.md` |
| Tune “more cinematic” | `references/prompt-interpreter.md` |

---

## Package contents

```text
frontend-cinematic-studio/
├── SKILL.md                 # Agent entry (read first on invoke)
├── README.md                # This file
├── references/
│   ├── philosophy.md
│   ├── anti-patterns.md
│   ├── materials.md
│   ├── transitions.md
│   ├── motion.md
│   ├── composition.md
│   ├── visual-language.md
│   ├── architecture.md
│   ├── agentic-engineering.md
│   ├── prompt-interpreter.md
│   ├── aesthetic-tuple-template.md
│   ├── scope-triage.md
│   ├── tech-stack-menu.md
│   ├── token-stack.md
│   └── workflows/
│       ├── phase-1-kimi-build.md
│       ├── phase-2-claude-refine.md
│       └── phase-3-pinterest-score.md
├── checklists/
│   ├── award-bar.md
│   └── verify.md
└── prompts/
    └── anime-fantasy-landing.md
```

**Progressive disclosure:** `SKILL.md` is the table of contents; agents load `references/*.md` only when needed. Keep new detail in `references/`, not by bloating `SKILL.md` ([authoring best practice](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)).

---

## Frontmatter (for maintainers)

```yaml
name: frontend-cinematic-studio      # must match folder name
description: ...                       # discovery trigger (what + when)
disable-model-invocation: true         # manual /slash only
```

To allow auto-discovery, remove `disable-model-invocation` and strengthen `description` with your trigger phrases.

---

## Checklists

- Before shipping a site: [checklists/award-bar.md](checklists/award-bar.md)
- After install or edits: [checklists/verify.md](checklists/verify.md)
