# Reusable Prompt — Gaming Wiki / Game Portfolio

Copy and fill `{{...}}` after aesthetic tuple is set.

```markdown
Design and code a {{PROJECT_NAME}} game wiki/portfolio page.

**Mood:** {{MOOD}} (e.g. Deep-sea Collector's Logbook / Dungeon Chronicle / Monster Hunter Journal)
**Reference score:** {{3-4}}/4 from Pinterest framework

## Goals (outcomes)
- G1 Hero: {{character/mascot anchor}} + monumental display title partially occluded or layered
- G2 Item showcase: bento/asymmetric grid — NOT generic 3-col cards
- G3 Journal/log section: editorial entries with metadata mono captions, staggered reveals
- G4 Section journey: {{act 1 palette}} → dissolve → {{act 2}} → dissolve → {{act 3}}
- G5 Anti-slop: no flat white backgrounds, no system fonts, no generic stat cards

## Visual systems
- Palette: {{base dark}}, {{mid accent}}, {{single highlight}} — one accent only for rare/legendary markers
- Fonts: display {{condensed sans or serif}}, body {{sans}}, meta {{mono}} 9px tracking 0.3em for stats/rarity tags
- Z-stack: ambient particles/silhouettes / atmospheric fog / foreground cards / overlay dock

## Sections
1. Hero — full-bleed, character anchor, game title as monumental type, atmospheric background
2. Collection/Items — bento grid or asymmetric editorial layout with rarity indicators in mono meta
3. Journal/Logs — editorial entries with polaroid-style images (±2-4° rotation), staggered scroll reveal
4. Expeditions/Locations — full-bleed cinematic images with glass overlay text panels
5. Footer — minimal, hairline rule, tracked small-caps nav

## Tech
{{Tier A/B from tech-stack-menu}}

## Motion
- Lenis smooth scroll (desktop); respect reduced motion
- useInView stagger 200ms on item cards and journal entries
- Hover: card lift 4-6px, warm glow shadow, ease [0.16, 1, 0.3, 1]
- Hero: subtle parallax on background layer, character anchor stays fixed

## Deliverable
Production-ready code, no placeholders. Run build before done.
```

## Example Aesthetic Tuple (filled)

```markdown
## Aesthetic Tuple

**Mood:** Deep-sea Gothic / Collector's Logbook

**Palette:**
- Base surface: Dark ocean charcoal #0D1117
- Midground accent: Bioluminescent teal rgba(64, 224, 208, 0.08)
- Single highlight: Abyssal coral #FF6B6B (legendary items only)
- Text primary / muted: #E2E8F0 / #64748B

**Fonts:**
- Display: Bebas Neue (item names, section headings)
- Body: Inter
- Meta mono: JetBrains Mono 9px tracking 0.3em (stats, rarity tags, coordinates)

**Motion curve:**
- Reveals: cubic-bezier(0.16, 1, 0.3, 1)
- Parallax: linear underwater drift
- Hover: duration 0.4s, card lift 6px with teal glow

**Z-layers:**
- z-0 ambient: underwater particle effects, distant fish silhouettes
- z-10 atmospheric: fog/mist, bioluminescent glow spots
- z-20 foreground: item cards, journal entries, stat panels
- z-40+ overlay dock: nav bar with glass blur + hairline border

**Anti-slop locks:** No flat white (#fff) backgrounds. No centered equal-width card grids. No system sans-serif. No shadow-md-only depth. No generic stat badges without editorial framing.
```

## Genre-Specific Anti-Slop

| Pattern to reject | Replace with |
|---|---|
| White background item cards | Dark charcoal cards with atmospheric glass treatment |
| Basic `grid-cols-3 gap-4` item grid | Asymmetric bento: `grid-cols-[1.2fr_0.8fr_1fr]` or masonry |
| Plain text stat numbers | Mono meta `9px tracking-[0.3em]` with accent color |
| Stock placeholder images | Generated or sourced game art with grain overlay |
| Flat section borders | Dissolve zones (gradient mist transitions) |

Invoke parent skill: `/frontend-cinematic-studio` first.
