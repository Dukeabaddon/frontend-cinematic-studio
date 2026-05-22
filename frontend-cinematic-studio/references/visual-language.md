# Visual Language & Typography

## Tracking law

| Size | Tracking | Case |
|------|----------|------|
| Display huge | Tighter or `0.15em` uppercase | Condensed serif / Bebas-style |
| Body 16px | `-0.011em` | Inter / Söhne |
| Meta 9–10px | `0.25em`–`0.3em` | Uppercase mono |

Small text **requires** wide tracking to stay readable.

## Line height

- Body: `leading-relaxed` (1.625+) or `leading-loose`
- Display: `leading-tight` ~1.15
- Never `leading-none` on paragraphs

## Roles

| Role | Families (examples) |
|------|---------------------|
| Display | Cinzel, Playfair, Bebas Neue, Oswald |
| Body | Inter, Outfit |
| Meta | JetBrains Mono, Fira Code |

## Accent discipline

**One** high-luminosity accent (lime `#D4F87A`, brass `#C89B5B`, crimson `#9C4B4B`). Use for emphasis phrases on scroll-in, focus rings, hover borders — not floods.

## Palette integrity

- No raw Tailwind `purple-600` → `blue-500` heroes
- WCAG contrast on body text (aim AAA on primary copy)

## CSS utility classes (optional pattern)

```css
.font-display { letter-spacing: 0.15em; text-transform: uppercase; line-height: 1.15; }
.font-mono-meta { font-size: 0.65rem; letter-spacing: 0.3em; text-transform: uppercase; }
```
