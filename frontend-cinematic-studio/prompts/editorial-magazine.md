# Reusable Prompt — Editorial Magazine

Copy and fill `{{...}}` after aesthetic tuple is set.

```markdown
Design and code a {{PUBLICATION_NAME}} editorial magazine site.

**Mood:** {{MOOD}} (e.g. Literary Journal / Kinfolk Editorial / Cereal Magazine)
**Reference score:** {{3-4}}/4 from Pinterest framework

## Goals (outcomes)
- G1 Cover story hero: full-bleed image + overlaid serif title, editorial pacing
- G2 Feature article: wide-column reading with pull-quotes and hairline rules
- G3 Photo essay: asymmetric image cluster with ±2-4° rotation, caption mono meta
- G4 Archive: dense metadata grid with editorial hover states
- G5 Anti-slop: no blog-style card grid, no sidebar widgets, no generic pagination

## Visual systems
- Palette: {{warm cream base}}, {{mid accent}}, {{single highlight}} — accent for pull-quotes/links
- Fonts: display {{elegant serif}}, body {{readable serif or sans}}, meta {{mono}} 9px tracking 0.3em
- Z-stack: ambient parchment texture / atmospheric grain / foreground content / overlay nav

## Sections
1. Cover — full-bleed hero image, serif title overlaid, issue number in mono meta
2. Feature — wide single-column with drop cap, pull-quotes in serif italic with hairline rules
3. Photo Essay — asymmetric image clusters, rotated ±2-4°, captions in mono meta below
4. More Stories — editorial grid (NOT blog cards), each with image + serif headline + mono meta date
5. Footer — masthead info, hairline rule, tracked nav, subscription CTA in glass panel

## Tech
{{Tier A/B from tech-stack-menu}}

## Motion
- Lenis smooth scroll; respect reduced motion
- useInView on article sections: fade + slide-up, stagger 200ms
- Photo clusters: images reveal sequentially with slight parallax
- Hover: story items get hairline accent border + subtle lift

## Deliverable
Production-ready code, no placeholders. Run build before done.
```

## Example Aesthetic Tuple (filled)

```markdown
## Aesthetic Tuple

**Mood:** Literary Journal / Kinfolk Editorial

**Palette:**
- Base surface: Warm cream #FDF8F0
- Midground accent: Espresso border rgba(44, 24, 16, 0.08)
- Single highlight: Dusty rose #C4918A (pull-quotes, links, hover borders)
- Text primary / muted: Deep espresso #2C1810 / #8B7355

**Fonts:**
- Display: Cormorant Garamond (headlines, pull-quotes)
- Body: Lora or Inter (article body)
- Meta mono: JetBrains Mono 9px tracking 0.3em (dates, issue numbers, categories)

**Motion curve:**
- Reveals: cubic-bezier(0.16, 1, 0.3, 1)
- Parallax: linear, subtle on hero image only
- Hover: duration 0.4s, hairline border appears in dusty rose

**Z-layers:**
- z-0 ambient: cream base with subtle paper texture
- z-10 atmospheric: grain overlay 3% opacity, vignette edges
- z-20 foreground: article text, images, pull-quotes
- z-40+ overlay dock: sticky nav with cream backdrop-blur

**Anti-slop locks:** No blog-style card grids. No sidebar widgets. No bright blue links. No shadow-md cards. No pure white #fff backgrounds — always warm cream. No system sans-serif for body copy.
```

## Genre-Specific Anti-Slop

| Pattern to reject | Replace with |
|---|---|
| Blog-style card grid with thumbnails | Editorial grid with varied image sizes + serif headlines |
| Sidebar with "Recent Posts" widget | Clean single-column or two-column editorial layout |
| Generic pagination (1 2 3 ... Next) | Minimal "More stories" with editorial hover |
| Bright blue text links | Single accent from tuple (dusty rose, brass, etc.) |
| Sans-serif body copy | Readable serif (Lora, Cormorant) for article warmth |

Invoke parent skill: `/frontend-cinematic-studio` first.
