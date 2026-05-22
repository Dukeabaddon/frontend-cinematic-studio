# Reusable Prompt — Personal Portfolio

Copy and fill `{{...}}` after aesthetic tuple is set.

```markdown
Design and code a {{YOUR_NAME}} personal portfolio.

**Mood:** {{MOOD}} (e.g. Editorial Darkroom / Minimalist Atelier / Brutalist Studio)
**Reference score:** {{3-4}}/4 from Pinterest framework

## Goals (outcomes)
- G1 Hero: name as monumental display type, subtle atmospheric background, no gradient blob
- G2 Selected works: asymmetric project grid with editorial hover states, NOT equal-width cards
- G3 About: editorial two-column layout with personality, not generic "Hi I'm [Name]"
- G4 Section journey: warm base → atmospheric transition → deep contrast section
- G5 Anti-slop: no centered hero with abstract shapes, no 3-col equal project cards, no emoji bullets

## Visual systems
- Palette: {{warm dark base}}, {{mid accent}}, {{single highlight}} — accent for links/focus only
- Fonts: display {{serif or condensed}}, body {{sans}}, meta {{mono}} 9px tracking 0.3em for roles/dates
- Z-stack: ambient gradient / atmospheric grain / foreground content / overlay nav dock

## Sections
1. Hero — name as monumental type (partially masked or layered), role in tracked mono meta, minimal CTA
2. Selected Works — asymmetric grid or staggered list, each project with image + mono meta + brief
3. About — two-column: editorial text left, portrait/photo right with slight rotation
4. Contact — glass form over cinematic background, or minimal text with tracked email link
5. Footer — hairline rule, social icons (lucide), copyright in mono meta

## Tech
{{Tier A/B from tech-stack-menu}}

## Motion
- Lenis smooth scroll (desktop); respect reduced motion
- useInView stagger 200ms on project entries
- Hover: project images lift + subtle warm glow, ease [0.16, 1, 0.3, 1]
- Hero: name fades in with slow stagger per character or word

## Deliverable
Production-ready code, no placeholders. Run build before done.
```

## Example Aesthetic Tuple (filled)

```markdown
## Aesthetic Tuple

**Mood:** Editorial Darkroom / Minimalist Atelier

**Palette:**
- Base surface: Warm charcoal #1a1a1a
- Midground accent: Ivory border rgba(250, 248, 245, 0.06)
- Single highlight: Vintage brass #C89B5B (links, focus rings, hover borders only)
- Text primary / muted: Ivory #FAF8F5 / #888

**Fonts:**
- Display: Playfair Display (name, section headings)
- Body: Inter
- Meta mono: JetBrains Mono 9px tracking 0.3em (role titles, dates, project tags)

**Motion curve:**
- Reveals: cubic-bezier(0.16, 1, 0.3, 1)
- Parallax: linear (hero background only)
- Hover: duration 0.4s, project lift 4px with brass glow

**Z-layers:**
- z-0 ambient: dark radial gradient, subtle vignette
- z-10 atmospheric: grain overlay 3% opacity
- z-20 foreground: project cards, text, CTAs
- z-40+ overlay dock: nav with backdrop-blur + hairline border

**Anti-slop locks:** No gradient hero blobs. No "Hi I'm [Name] 👋" generic intro. No equal-width 3-col project grid. No bright blue links. No shadow-md cards on white.
```

## Genre-Specific Anti-Slop

| Pattern to reject | Replace with |
|---|---|
| Centered hero + gradient blob background | Monumental name type + atmospheric dark base |
| "Hi, I'm [Name]! I'm a developer who..." | Role in tracked mono meta, statement in serif |
| `grid-cols-3 gap-6` project cards | Asymmetric staggered list or bento layout |
| Bright blue `text-blue-500` links | Single accent color from tuple (brass, crimson, etc.) |
| Generic headshot in a circle | Editorial portrait with slight rotation + soft shadow |

Invoke parent skill: `/frontend-cinematic-studio` first.
