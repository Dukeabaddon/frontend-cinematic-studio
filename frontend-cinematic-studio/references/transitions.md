# Transition Systems

## Prefer physical / atmospheric

| Type | Technique |
|------|-----------|
| Mist dissolve | Gradient overlays `from-[parchment] via-transparent to-[charcoal]` + optional `backdrop-blur-[2px]` |
| Section color journey | Base bg shifts (ivory → moss → altar black) with overlap zones, not `border-t` |
| Torn / parchment edge | SVG mask or PNG overlay (sparingly) |
| Fog separation | Absolute `h-48` gradient strips, `pointer-events-none` |

## Ban as default

- Opacity-only crossfade between major story beats
- Generic gradient wipe
- Blur fade spam between every section

## Case study pattern (Magus' Bride / editorial)

```
[Section A: parchment #E8DDC7]
  ↓ h-48 gradient mist (to transparent)
[Atmospheric valley: parchment → #2F4633]
  ↓ h-48 gradient mist (from transparent)
[Section B: #0D0D0D cathedral]
```

**Why:** Removes visible layout seams; feels like continuous environment.

## Prune foreground clutter

Remove overlapping decorative layers that block text or tap targets on mobile. Keep **background** silhouettes.

## Implementation

- CSS gradients + absolute positioned overlays
- Optional SVG masks for hard edges
- Sync gradient stops to palette from aesthetic tuple
