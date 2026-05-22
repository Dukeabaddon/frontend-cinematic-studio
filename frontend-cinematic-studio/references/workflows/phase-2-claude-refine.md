# Workflow — Phase 2: Production Refine

Use after initial build exists (`npm install` + dev runs).

## Token efficiency

```
gate_init
→ gate_compress_file on Hero.tsx, Timeline.tsx, layout (signature)
→ graphify query "hero parallax timeline" (if graph exists)
```

## Single pass — strict order

Do **not** split into four chats. Problems build on each other.

| # | Problem | Outcome |
|---|---------|---------|
| 1 | Hero z-index | Type behind mountains; top 40–50% letterforms visible |
| 2 | Scroll parallax | `useScroll`/`useTransform`, linear, rates 0.3/0.5/0.4x |
| 3 | Timeline stagger | `useInView` per city, 200ms stagger, once |
| 4 | Polish | Lenis root, custom cursor, polaroid hover |

Full spec: `reference/sample-prompt-2.md` Prompt 2.

## Constraints

- Surgical edits — don't rewrite working sections
- Pinterest/reference = layout truth for positioning/color
- No new deps beyond Lenis
- `prefers-reduced-motion` respected

## Output format per fix

1. File path
2. Why (2–3 sentences)
3. Full updated file (or complete component)

## Verify

Run `checklists/verify.md` after problem 4.
