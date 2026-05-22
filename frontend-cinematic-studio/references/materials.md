# Material Systems

## Surfaces

| Material | Use | Technique |
|----------|-----|-----------|
| Parchment / ivory | Warm editorial base | `#F4F1EA`, `#E8DDC7` — not pure white |
| Aged paper | Cards, manuscripts | Grain overlay 3–8% opacity |
| Deep charcoal / forest | Night sections | `#0D0D0D`, `#2F4633` |
| Glass panel | Forms, docks only | `backdrop-blur-md` + `rgba` fill + 1px border |

## Layering stack

```
grain (overlay, pointer-events-none)
→ base gradient / photo
→ atmospheric fog (40–70% opacity midground)
→ foreground cards (z-20)
→ vignette (radial, subtle)
```

## CSS patterns

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

## Blend modes

- Grain: `mix-blend-overlay` or `soft-light`
- Fog: low-opacity gradients, no harsh borders

## Bad vs good

| Bad | Good |
|-----|------|
| Flat `#fff` + `shadow-lg` | Layered gradient base + rim light |
| Texture on every div | One grain on section wrapper |
| 100% opacity fog | 40–70% atmospheric midground |
