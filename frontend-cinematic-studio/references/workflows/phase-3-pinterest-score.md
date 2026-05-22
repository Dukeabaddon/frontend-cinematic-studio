# Workflow — Phase 3: Reference Scoring

Before feeding image to vision model (Kimi, GPT-4V, etc.).

## Four criteria (1 point each)

| # | Criterion | Pass | Fail |
|---|-----------|------|------|
| 1 | Clear hierarchy | Obvious hero/about/features/contact | One abstract collage |
| 2 | No watermarks | Clean image | Designer signature overlay |
| 3 | Sharp details | Legible type, color, spacing | Blurry / tiny screenshot |
| 4 | Replicable structure | Grids, columns, hero composition | Print-only tactile effects |

## Score

- **4/4** — feed directly
- **3/4** — use if fixable (crop watermark, etc.)
- **≤2/4** — find better reference

## Phone test

Describe layout in 30 seconds by voice. If listener pictures it → parseable. If "you have to see it" → skip.

## Record in goals

```markdown
Reference score: 4/4
Reference notes: hero z-layer, black act between sections, lime accent on scroll
```

Source: `reference/sample-prompt-2.md` Prompt 3.
