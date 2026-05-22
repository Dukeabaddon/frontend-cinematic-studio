# Reusable Prompt — Anime Fantasy Landing

Copy and fill `{{...}}` after aesthetic tuple is set.

```markdown
Design and code a {{PROJECT_NAME}} landing page.

**Mood:** {{MOOD}} (e.g. Forest Gothic / Literary Romanticism)
**Reference score:** {{3-4}}/4 from Pinterest framework

## Goals (outcomes)
- G1 Hero: {{foreground anchor}} + {{typography relationship to environment}}
- G2 Section journey: {{act 1 color}} → {{act 2}} → {{act 3}} via mist dissolves
- G3 Motion: staggered reveals, linear scroll parallax, no spring on scroll
- G4 Anti-slop: no purple-blue gradient, no fake status UI

## Visual systems
- Palette: {{base}}, {{mid}}, {{accent}} — one accent only for CTAs
- Fonts: display {{serif}}, body {{sans}}, meta {{mono}} 9px tracking 0.3em
- Z-stack: ambient / atmospheric / foreground / dock per composition.md

## Sections
1. Hero — full-bleed, layered planes
2. About — {{layout}}
3. Features — bento or editorial grid (not generic 3-col)
4. Contact — glass form over cinematic bg

## Tech
{{Tier A/B from tech-stack-menu}}

## Motion
- Lenis smooth scroll (desktop); respect reduced motion
- useInView stagger 200ms on chapter content
- Hover: lift 4px, ease [0.16, 1, 0.3, 1]

## Deliverable
Production-ready code, no placeholders. Run build before done.
```

Invoke parent skill: `/frontend-cinematic-studio` first.
