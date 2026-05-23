# DESIGN.md Template

Standard format for AI-readable design systems. Based on the [awesome-design-md](https://github.com/VoltAgent/awesome-design-md) 9-section format.

**When to use:** Generate this file at project root after the aesthetic tuple is approved. This becomes the persistent design source of truth for the entire project.

---

## Template

```markdown
# DESIGN.md — [Project Name]

## 1. Visual Theme & Atmosphere

**Mood:** {{mood from aesthetic tuple — e.g. "Forest Gothic meets Editorial Darkroom"}}
**Era/Reference:** {{reference mood — e.g. "Kinfolk magazine meets Monster Hunter journal"}}
**Atmosphere keywords:** {{3-5 adjectives — e.g. tactile, layered, muted, atmospheric}}

## 2. Color Palette & Roles

| Token | Value | Role |
|---|---|---|
| `--surface-base` | {{e.g. #0D1117}} | Primary background |
| `--surface-elevated` | {{e.g. #161B22}} | Cards, panels |
| `--border-subtle` | {{e.g. rgba(255,255,255,0.06)}} | Hairline separators |
| `--accent-primary` | {{e.g. #C89B5B}} | CTAs, emphasis (≤5% of page) |
| `--text-primary` | {{e.g. #E8E8E8}} | Headlines, body |
| `--text-muted` | {{e.g. #666666}} | Meta labels, secondary |
| `--overlay-glass` | {{e.g. rgba(0,0,0,0.4)}} | Liquid glass surfaces |

**Anti-slop:** Never use pure #fff or #000. Never use from-purple-600 to-blue-500.

## 3. Typography Rules

| Role | Family | Weight | Size | Tracking | Line Height |
|---|---|---|---|---|---|
| Display | {{e.g. Cinzel}} | 400-700 | 3rem-6rem | -0.04em | 1.15 |
| Body | {{e.g. Inter}} | 400 | 1rem | -0.011em | 1.75 |
| Meta/Label | {{e.g. JetBrains Mono}} | 400 | 0.65rem | 0.3em | 1.4 |

**Tracking Law:** As font size increases, letter-spacing decreases.

## 4. Component Stylings

### Buttons
- Primary: `--accent-primary` fill, dark text, rounded-lg, px-8 py-3
- Secondary: liquid-glass, border-white/20, hover → white bg + dark text
- Ghost: transparent, border, hover → subtle fill

### Cards
- Surface: `--surface-elevated` with `--border-subtle` border
- Shadow: layered (0 30px 60px -15px rgba(0,0,0,0.8))
- Hover: translateY(-4px), 400ms ease

### Navigation
- Liquid glass background (Pattern 4 from SKILL.md)
- Blur: 4px, inner shadow, gradient border via ::before
- Height: compact (py-2), rounded-xl

## 5. Layout Principles

- **Page padding:** px-6 md:px-12 lg:px-16
- **Section spacing:** py-24 lg:py-32
- **Grid philosophy:** Asymmetric (grid-cols-[1.2fr_0.8fr_1fr]), never equal 3-col
- **Whitespace:** Generous — minimum 5vw horizontal padding
- **Content width:** max-w-7xl for text, full-bleed for atmospheric sections

## 6. Depth & Elevation

| Layer | Z-Index | Content | Effect |
|---|---|---|---|
| Ambient | z-0 | Gradients, dust, slow silhouettes | Fixed, low opacity |
| Atmospheric | z-10 | Fog, muted decor, non-interactive | Parallax, subtle |
| Foreground | z-20 | Cards, copy, CTAs | Interactive, reveals |
| Overlay | z-40+ | Nav, media controls, modals | Blur + hairline border |

**Grain overlay:** Always present at z-9999, opacity 0.035, mix-blend-mode overlay.

## 7. Do's and Don'ts

### Do
- Use asymmetric grids and bento layouts
- Apply dissolve transitions between sections (gradient overlap zones)
- Use 3 typography roles (display, body, meta)
- Honor prefers-reduced-motion
- Build section-by-section with user approval

### Don't
- Use centered 3-column equal card grids
- Use glass/blur as decoration (only functional elements)
- Use spring physics on scroll-linked parallax
- Use pure #fff or #000 backgrounds
- Output // ... rest unchanged stubs
- Add fake STATUS: ONLINE widgets

## 8. Responsive Behavior

| Breakpoint | Width | Behavior |
|---|---|---|
| Mobile | < 768px | Single column, stacked, touch targets ≥44px |
| Tablet | 768-1024px | 2-column where appropriate |
| Desktop | > 1024px | Full asymmetric grid |

**Typography scaling:** text-4xl md:text-5xl lg:text-6xl xl:text-7xl for hero headlines.
**Padding scaling:** px-6 md:px-12 lg:px-16

## 9. Motion & Animation

| Type | Timing | Easing | Trigger |
|---|---|---|---|
| Scroll reveal | 600ms | cubic-bezier(0.16, 1, 0.3, 1) | IntersectionObserver |
| Parallax | Linear | linear | Scroll position |
| Hover | 300-400ms | ease | Mouse enter |
| Text reveal | 500ms/char, 30ms stagger | ease | Page load (hero only) |
| FadeIn | 600ms, stagger 200ms | ease | Scroll into view |

**Reduced motion:** Always honor `prefers-reduced-motion: reduce`.
```

---

## Usage

1. After aesthetic tuple approval, generate DESIGN.md at project root
2. Reference tokens by name in components (e.g. `var(--surface-base)`)
3. Update DESIGN.md when user requests design changes
4. For multi-page projects, use Master + Overrides pattern:
   - `DESIGN.md` = global source of truth
   - `pages/[page-name].md` = page-specific overrides
