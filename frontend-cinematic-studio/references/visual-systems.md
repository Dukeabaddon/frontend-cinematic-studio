# Visual Systems (Composition + Materials + Transitions)

## Composition Architecture

### Depth planes

| Plane | z-index | Content |
|-------|---------|---------|
| Ambient | 0 | Gradients, dust, slow back silhouettes |
| Atmospheric | 10 | Fog, muted decor, non-interactive |
| Foreground | 20 | Cards, copy, polaroids, CTAs |
| Overlay dock | 40–50 | Nav, media controls — blur + hairline border |

### Hero (non-negotiable pattern from Japan Tours ref)

1. **Background** — landscape full viewport
2. **Mid** — display type **behind** mountains (mask/split PNG)
3. **Foreground** — human anchor (kimono figure), cherry frame

Verify: top 40–50% of letterforms visible above mountain line.

### Editorial rhythm

- Wide hero → black "fade to black" chapter → bento or two-column → full-bleed CTA
- Asymmetric photo clusters, ±2–4° rotation, white border + soft shadow
- Hairline rules extending to viewport edges on section titles

### Focal stability

One anchor per viewport. Parallax moves **environment**, not the anchor.

### Negative space

Dense metadata columns need prior airy hero — rhythm, not uniform padding.

### Anime / film framing

- Rule of thirds for figure placement
- Environmental layers tell story (mist, neon, temple)
- Title scale monumental but partially occluded by world

## Material Systems

### Surfaces

| Material | Use | Technique |
|----------|-----|-----------|
| Parchment / ivory | Warm editorial base | `#F4F1EA`, `#E8DDC7` — not pure white |
| Aged paper | Cards, manuscripts | Grain overlay 3–8% opacity |
| Deep charcoal / forest | Night sections | `#0D0D0D`, `#2F4633` |
| Glass panel | Forms, docks only | `backdrop-blur-md` + `rgba` fill + 1px border |

### Layering stack

```
grain (overlay, pointer-events-none)
→ base gradient / photo
→ atmospheric fog (40–70% opacity midground)
→ foreground cards (z-20)
→ vignette (radial, subtle)
```

### CSS patterns

**Glass (functional):**

```tsx
className="relative overflow-hidden rounded-md border border-white/[0.06]
  bg-gradient-to-b from-white/[0.04] to-transparent p-8
  shadow-[0_30px_60px_-15px_rgba(0,0,0,0.8)] backdrop-blur-md"
```

**Top-edge light:**

```tsx
<div className="pointer-events-none absolute inset-0
  bg-[radial-gradient(circle_at_top,rgba(200,155,91,0.08),transparent_55%)]" />
```

### Blend modes

- Grain: `mix-blend-overlay` or `soft-light`
- Fog: low-opacity gradients, no harsh borders

### Bad vs good

| Bad | Good |
|-----|------|
| Flat `#fff` + `shadow-lg` | Layered gradient base + rim light |
| Texture on every div | One grain on section wrapper |
| 100% opacity fog | 40–70% atmospheric midground |

## Transition Systems

### Prefer physical / atmospheric

| Type | Technique |
|------|-----------|
| Mist dissolve | Gradient overlays `from-[parchment] via-transparent to-[charcoal]` + optional `backdrop-blur-[2px]` |
| Section color journey | Base bg shifts (ivory → moss → altar black) with overlap zones, not `border-t` |
| Torn / parchment edge | SVG mask or PNG overlay (sparingly) |
| Fog separation | Absolute `h-48` gradient strips, `pointer-events-none` |

### Ban as default

- Opacity-only crossfade between major story beats
- Generic gradient wipe
- Blur fade spam between every section

### Case study pattern (Magus' Bride / editorial)

```
[Section A: parchment #E8DDC7]
  ↓ h-48 gradient mist (to transparent)
[Atmospheric valley: parchment → #2F4633]
  ↓ h-48 gradient mist (from transparent)
[Section B: #0D0D0D cathedral]
```

**Why:** Removes visible layout seams; feels like continuous environment.

### Prune foreground clutter

Remove overlapping decorative layers that block text or tap targets on mobile. Keep **background** silhouettes.

### Implementation

- CSS gradients + absolute positioned overlays
- Optional SVG masks for hard edges
- Sync gradient stops to palette from aesthetic tuple
