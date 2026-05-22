---
name: frontend-cinematic-studio
description: >-
  Directs award-level cinematic frontend builds using goals-not-tasks workflow,
  anti-AI-slop art direction, Graphify knowledge-graph queries, and Gate-MCP
  input compression. Use when building landing pages, portfolios, editorial sites,
  Awwwards-style experiences, anime-atmosphere UI, or when the user invokes
  /frontend-cinematic-studio, mentions cinematic/tactile/editorial web design,
  or wants token-efficient exploration of large codebases.
disable-model-invocation: true
compatibility: >-
  Requires Python 3.10+ (graphifyy via python -m graphify) and Gate-MCP MCP server.
  Works in Cursor, Antigravity (.agent/skills/), VS Code Copilot (.github/skills/).
metadata:
  author: Aaron
  version: "1.0.0"
---

# Frontend Cinematic Studio

Master operating system for handcrafted, atmospheric, editorial web experiences — not generic AI slop.

## User guidance (always on)

The user may need clear, patient, step-by-step guidance. After tool runs, include a **User brief** in plain English: what happened, current goal, one suggested next step. Never bury decisions in caveman shorthand when speaking to the user.

## Agent response mode (caveman — internal narration only)

- Use short, 3–6 word sentences.
- No filler, preamble, or pleasantries.
- Run tools first, show the result, then stop. Do not narrate.
- Drop articles ("Me fix code" not "I will fix the code").

**Why:** ~50–75% narration burn reduction when caveman + tool-first.

**Pair with:** one **User brief** line after each major step (accessible summary).

---

## Phase 0 — Before any code

1. **Scope triage** — See [references/scope-triage.md](references/scope-triage.md): simple single-view vs complex multi-section site.
2. **Aesthetic tuple** — Fill [references/aesthetic-tuple-template.md](references/aesthetic-tuple-template.md) (mood, palette, fonts, motion, z-layers). No CSS until tuple is written.
3. **Tech stack** — Read `package.json`. If empty, propose tier from [references/tech-stack-menu.md](references/tech-stack-menu.md). User confirms before scaffold.
4. **Token stack** — Run [references/token-stack.md](references/token-stack.md) (Graphify + Gate-MCP).

---

## Goals, not tasks

Output **GOALS** first (measurable outcomes). Example:

> Hero: typography sits behind mountain plane; kimono anchor right; polaroid strip drifts 0.4x scroll.

**Do not** output implementation task lists until goals are locked or user says proceed.

After goals: derive phased delivery (build → refine → polish).

---

## Anti-slop (hard reject)

Reject and replace if detected:

- Purple-to-blue default gradients, generic `shadow-md` cards, centered 3-col template grids
- Fake telemetry, `STATUS: ONLINE`, pointless spinners, tech-larping chrome
- Glassmorphism without `backdrop-blur` + semi-transparent fill
- Motion without hierarchy; spring physics on scroll-linked parallax
- Placeholders: `// rest unchanged`, truncated files

Full list: [references/anti-patterns.md](references/anti-patterns.md)

Philosophy: [references/philosophy.md](references/philosophy.md)

---

## Token stack (mandatory on large repos)

| Order | Tool | When |
|-------|------|------|
| 1 | Graphify | No `graphify-out/` → `python -m graphify .` (Windows: no leading `/`) |
| 2 | `gate_init` | Start of session on workspace with Gate-MCP |
| 3 | Graph query | Architecture questions → `graphify query` or Gate `graphify_map` |
| 4 | `gate_compress_file` | Read large source; skip tiny files you edit verbatim |
| 5 | `gate_clean_response` | Bulky JSON tool outputs |

Details: [references/token-stack.md](references/token-stack.md)

---

## Workflow routing

| User intent | Workflow |
|-------------|----------|
| New site from reference image | [references/workflows/phase-1-kimi-build.md](references/workflows/phase-1-kimi-build.md) after [references/workflows/phase-3-pinterest-score.md](references/workflows/phase-3-pinterest-score.md) ≥3/4 |
| Refine existing cinematic codebase | [references/workflows/phase-2-claude-refine.md](references/workflows/phase-2-claude-refine.md) — problems 1→4 in order |
| "More atmospheric / tactile / cinematic" | [references/prompt-interpreter.md](references/prompt-interpreter.md) |
| Backend/booking expansion | [reference/sample-prompt-2.md](../reference/sample-prompt-2.md) Prompt 4 — only if user asks |

---

## Design systems (read when implementing)

| Topic | File |
|-------|------|
| Materials, parchment, grain | [references/materials.md](references/materials.md) |
| Physical transitions, mist dissolves | [references/transitions.md](references/transitions.md) |
| Scroll, parallax, reveals | [references/motion.md](references/motion.md) |
| Z-planes, composition | [references/composition.md](references/composition.md) |
| Typography tracking law | [references/visual-language.md](references/visual-language.md) |
| Modular TS/React layout | [references/architecture.md](references/architecture.md) |
| Agentic engineering (Gemini) | [references/agentic-engineering.md](references/agentic-engineering.md) |
| Quality bar | [checklists/award-bar.md](checklists/award-bar.md) |
| Verify before ship | [checklists/verify.md](checklists/verify.md) |

---

## Motion defaults

- **Scroll parallax:** linear `useTransform` — not spring
- **Viewport reveals:** `useInView`, stagger 200ms, ease `[0.16, 1, 0.3, 1]`
- **Smooth scroll:** Lenis when App Router marketing site (see tech-stack-menu)
- **Reduced motion:** honor `prefers-reduced-motion`

---

## Engineering rules

1. Read file before edit; surgical diffs on working code
2. `types.ts` + `data.ts` + `components/` — no 1500-line monoliths
3. `useEffect` deps: primitives only; cleanup observers/timers
4. Full files on new components — no stubs
5. Run linter/build after substantive edits — [checklists/verify.md](checklists/verify.md)
6. Icons: `lucide-react` unless bespoke SVG art requested

---

## Tech stack (summary)

Pick tier from [references/tech-stack-menu.md](references/tech-stack-menu.md) per project. Default cinematic marketing: **Next.js 14+ App Router, TypeScript, Tailwind, Framer Motion, Lenis, next/image, Lucide**.

---

## Activation checklist

Copy when skill starts:

```
Cinematic Studio active
- [ ] Aesthetic tuple drafted
- [ ] Goals written (not tasks)
- [ ] graphify-out/ or build graph
- [ ] gate_init (if Gate-MCP available)
- [ ] Anti-slop pass planned
```

---

## Install locations (this package)

| IDE | Path |
|-----|------|
| Cursor (project) | `.cursor/skills/frontend-cinematic-studio/` |
| Antigravity | `.agent/skills/frontend-cinematic-studio/` |
| Copilot | `.github/skills/frontend-cinematic-studio/` |
| Global Cursor | `~/.cursor/skills/frontend-cinematic-studio/` |

See [README.md](README.md) for setup.
