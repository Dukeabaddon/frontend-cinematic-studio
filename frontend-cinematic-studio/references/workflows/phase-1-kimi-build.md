# Workflow — Phase 1: Vision Build (Kimi-style)

Use when creating **initial codebase** from reference image + brief.

## Preconditions

- Pinterest/reference scored ≥3/4 — see `phase-3-pinterest-score.md`
- Aesthetic tuple filled
- **Goals** written (outcomes per section)
- Tech tier chosen — `tech-stack-menu.md` (default Tier A Next.js)

## Token efficiency

1. `python -m graphify .` if building in existing monorepo
2. For greenfield, skip graph until scaffold exists

## Prompt structure (adapt from sample-prompt-1)

Include in agent message to coding model:

1. **Role** — art-directed landing, not travel-blog template
2. **Hero** — z-planes: bg / type behind mountains / foreground figure
3. **Sections** — numbered chapters with palette tokens
4. **Motion spec** — Lenis, parallax rates, stagger, easing `[0.16, 1, 0.3, 1]`
5. **Tech stack** — explicit versions
6. **Critical notes** — non-negotiables (layering, timeline stagger)
7. **Deliverable** — full project, no placeholders

Source template: `reference/sample-prompt-1.md` in repo root.

## Goals-first wrapper

Before codegen, agent outputs:

```markdown
## Goals
- G1 Hero layering reads as ...
- G2 Timeline reveals Osaka → Kyoto → Tokyo sequentially
- ...
```

User confirms → then generate.

## After build

Hand off to `phase-2-claude-refine.md` for motion/layering fixes.
