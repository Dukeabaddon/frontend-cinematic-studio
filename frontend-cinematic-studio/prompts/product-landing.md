# Reusable Prompt — Product Landing (Cinematic)

Copy and fill `{{...}}` after aesthetic tuple is set.

```markdown
Design and code a {{PRODUCT_NAME}} landing page.

**Mood:** {{MOOD}} (e.g. Obsidian Workspace / Premium Tech Noir / Lunar Laboratory)
**Reference score:** {{3-4}}/4 from Pinterest framework

## Goals (outcomes)
- G1 Hero: product in atmospheric scene (not floating mockup), monumental headline, single CTA
- G2 Features: editorial bento layout — NOT icon + title + description 3-col grid
- G3 Social proof: editorial pull-quotes — NOT carousel testimonial cards
- G4 CTA: full-bleed cinematic section with glass form or bold button
- G5 Anti-slop: no gradient hero + floating laptop, no 3-feature icon grid, no generic testimonials

## Visual systems
- Palette: {{deep base}}, {{mid accent}}, {{focused highlight}} — highlight for CTAs only
- Fonts: display {{grotesk or serif}}, body {{sans}}, meta {{mono}} 9px tracking 0.3em for labels
- Z-stack: ambient gradient / atmospheric glow / foreground content / overlay nav dock

## Sections
1. Hero — product in environmental context, monumental headline, mono meta tagline, single CTA pill
2. Features — bento grid (asymmetric), each feature with mono meta label + serif description
3. How it works — editorial numbered steps with hairline rules, staggered reveal
4. Social proof — large pull-quotes with attribution in mono meta, not card carousel
5. CTA — full-bleed dark section, glass panel with form or large button
6. Footer — minimal, hairline rule, tracked nav

## Tech
{{Tier A/B from tech-stack-menu}}

## Motion
- Lenis smooth scroll; respect reduced motion
- useInView stagger 200ms on feature cards and steps
- Hover: CTA buttons scale 1.02 + glow, feature cards lift 4px
- Hero: product subtle float or parallax, background atmospheric drift

## Deliverable
Production-ready code, no placeholders. Run build before done.
```

## Example Aesthetic Tuple (filled)

```markdown
## Aesthetic Tuple

**Mood:** Obsidian Workspace / Premium Tech Noir

**Palette:**
- Base surface: Deep zinc #18181B
- Midground accent: Silver border rgba(255, 255, 255, 0.06)
- Single highlight: Focused emerald #34D399 (CTAs, focus rings only)
- Text primary / muted: #F4F4F5 / #71717A

**Fonts:**
- Display: Space Grotesk (headlines)
- Body: Inter
- Meta mono: JetBrains Mono 9px tracking 0.3em (labels, status, tags)

**Motion curve:**
- Reveals: cubic-bezier(0.16, 1, 0.3, 1)
- Parallax: linear
- Hover: duration 0.3s, scale 1.02, emerald glow

**Z-layers:**
- z-0 ambient: dark radial gradient, subtle grid pattern
- z-10 atmospheric: soft emerald glow spots at 5% opacity
- z-20 foreground: feature cards, text, buttons
- z-40+ overlay dock: sticky nav with heavy backdrop-blur

**Anti-slop locks:** No gradient hero with floating device mockup. No 3-col icon+title+desc grid. No testimonial carousel. No bright saturated buttons on light backgrounds.
```

## Genre-Specific Anti-Slop

| Pattern to reject | Replace with |
|---|---|
| Gradient hero + floating laptop mockup | Product in atmospheric scene with environmental depth |
| 3-col icon + title + description grid | Asymmetric bento with varying card sizes |
| Testimonial card carousel | Large editorial pull-quotes with mono meta attribution |
| Bright CTA button on light section | Dark section + glass CTA or emerald-on-dark pill |
| "Trusted by 10,000+ companies" logo wall | Minimal mono meta mention or omit |

Invoke parent skill: `/frontend-cinematic-studio` first.
