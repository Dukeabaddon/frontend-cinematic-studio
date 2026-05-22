# Agentic Web Engineering (from award workflow)

Condensed from hackathon-winning practice. Full source: `reference/gemini-3.5.md`.

## Anti-AI-slop manifesto

- **Palette integrity** — custom spaces, not default primaries
- **Rhythm** — airy hero → dense column → immersive bleed
- **Architectural honesty** — no fake status widgets; every pixel earns its place

## Cognitive loop (adapt to Cursor)

```
User request
  → State discovery (package.json, graphify, gate_init)
  → Aesthetic tuple
  → Surgical edits (not full-file regen when possible)
  → Lint / build verify
  → User brief
```

## Aesthetic tuple before code

Mood + palette + font pairing + motion curve — see `aesthetic-tuple-template.md`.

## Misty dissolve transitions

Replace hard `border-t` between story sections with gradient overlap zones (see `transitions.md`). Won UI because sections feel like one environment.

## Prune foreground clutter

Remove decorative layers that hurt readability/mobile taps. Keep background atmosphere.

## Modular discipline

`types.ts`, `data.ts`, one component per file — prevents truncation and merge pain.

## Comparative note

Antigravity-specific tools (`lint_applet`, `compile_applet`) map to:

- Cursor: `ReadLints`, `npm run build`
- Same intent: **verify before claiming done**

## Typography + z-stack

See `visual-language.md` and `composition.md` for tracking law and layer model.
