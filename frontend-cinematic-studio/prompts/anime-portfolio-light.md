# Anime Portfolio Light — Genre Template

For light/ivory anime art portfolios. Think JUPITXR white edition, Japanese art collector's archive.

**Use when:** User wants anime/game art portfolio with editorial, warm, archival feel on light background.

---

## Aesthetic Tuple (filled example)

```markdown
## Aesthetic Tuple

**Mood:** Editorial Ivory Atelier / Japanese Art Collector

**Palette:**
- Base surface: #F5F0E8 (warm ivory — NOT white, NOT dark)
- Secondary surface: #EDE8DD (parchment for alternating sections)
- Midground accent: rgba(0,0,0,0.06) (warm gray hairline borders)
- Single highlight: #C41E3A (vermillion red — CTA buttons ONLY)
- Text primary / muted: #2C2C2C / #888888
- Hero bg only: #0A0A0A (dark, dramatic — hero section ONLY)

**Fonts:**
- Display: Cormorant Garamond (serif, elegant, 400/600/700)
- Body: Inter (400/500)
- Meta mono: JetBrains Mono (9px, tracking 0.3em, uppercase)
- Import: `https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;600;700&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400&display=swap`

**Motion curve:**
- Reveals: cubic-bezier(0.16, 1, 0.3, 1), 600ms
- Hover: translateY(-4px), 300ms ease
- Parallax: linear, subtle (hero character only)

**Z-layers:**
- z-0 ambient: warm gradient glow behind hero character
- z-10 atmospheric: ornamental frame (SVG), subtle vignette
- z-20 foreground: character art, cards, text
- z-40+ overlay: navigation bar (solid ivory, not glass)

**Anti-slop locks:**
- NO dark backgrounds except hero section
- NO cyberpunk elements (no cyan, no green glow, no HUD)
- NO STATUS: ONLINE or fake telemetry widgets
- NO centered 3-column equal card grids
- NO glass/blur on cards (editorial borders only)
- NO system fonts
```

---

## Layout Plan

### Section 1: Dramatic Hero
```
┌──────────────────────────────────────────────┐
│ ████████ DARK BG #0A0A0A ████████████████████ │
│                                              │
│          ╔══════════════════╗                 │
│          ║  Character Art   ║                 │
│          ║  (centered,      ║                 │
│          ║   ornamental     ║                 │
│          ║   frame around)  ║                 │
│          ╚══════════════════╝                 │
│                                              │
│  ← nav scrolling text marquee →              │
│  PORTFOLIO · DESIGN · ARCHIVES · PLANETS     │
└──────────────────────────────────────────────┘
```

**Implementation:**
- Full viewport height (100vh)
- Character art: `max-width: 600px`, centered, `z-20`
- Ornamental frame: SVG or CSS border-image, `z-10`
- Background: radial gradient from `#1a1512` center to `#0A0A0A` edges
- Bottom edge: torn paper SVG clip-path transitioning to ivory
- Scrolling nav text: CSS animation `marquee`, `font-mono-meta`, `0.3em` tracking

```css
/* Torn paper transition from dark hero to ivory body */
.hero-bottom-tear {
  position: absolute;
  bottom: -2px;
  left: 0;
  right: 0;
  height: 80px;
  background: #F5F0E8;
  clip-path: polygon(
    0% 60%, 3% 55%, 6% 62%, 10% 50%, 14% 58%, 18% 48%,
    22% 56%, 26% 45%, 30% 55%, 35% 42%, 40% 52%, 45% 40%,
    50% 50%, 55% 38%, 60% 48%, 65% 36%, 70% 46%, 75% 38%,
    80% 48%, 85% 40%, 90% 50%, 95% 42%, 100% 52%, 100% 100%, 0% 100%
  );
}
```

### Section 2: Character Showcase (ivory bg)
```
┌──────────────────────────────────────────────┐
│ #F5F0E8 ivory background                     │
│                                              │
│  ┌─────────────┐   ┌────────────────────┐    │
│  │             │   │ ✦ JUPITXR          │    │
│  │  Character  │   │                    │    │
│  │  Figure     │   │ Description text   │    │
│  │  (left,     │   │ in editorial body  │    │
│  │   60%)      │   │                    │    │
│  │             │   │ [icon] [icon]      │    │
│  │             │   │                    │    │
│  └─────────────┘   │ ┌──┐ ┌──┐ ┌──┐    │    │
│                     │ │  │ │  │ │  │    │    │
│                     │ └──┘ └──┘ └──┘    │    │
│                     └────────────────────┘    │
└──────────────────────────────────────────────┘
```

**Implementation:**
- Grid: `grid-cols-[1.2fr_0.8fr]`, gap `3rem`, padding `px-[5vw] py-24`
- Character figure: dark card background `#0A0A0A`, rounded corners, subtle shadow
- Info panel: serif headings, mono meta labels, icon row
- Thumbnail row: small preview images, grayscale → color on hover
- Border: single hairline `border-bottom: 1px solid rgba(0,0,0,0.06)`

### Section 3: Art Work Archive (ivory bg, with red accents)
```
┌──────────────────────────────────────────────┐
│ ◈ ART WORK ARCHIVE    [SUPPORTED] [POPULAR] │
│                                              │
│  ┌─────────────────┐  ┌──────────────────┐   │
│  │                 │  │ CHARACTER SHEET   │   │
│  │  Large artwork  │  │ WHITE CRANE ▶    │   │
│  │  preview        │  │                  │   │
│  │                 │  │ Description...   │   │
│  │                 │  │                  │   │
│  │  ┌──┐ ┌──┐     │  │ Stats/specs      │   │
│  │  │  │ │  │     │  │ in mono meta     │   │
│  │  └──┘ └──┘     │  │                  │   │
│  │                 │  │ [Buy Now ►]      │   │
│  └─────────────────┘  └──────────────────┘   │
└──────────────────────────────────────────────┘
```

**Implementation:**
- Grid: `grid-cols-[1.4fr_1fr]`, gap `2rem`
- Tab bar: mono meta labels, active tab has vermillion underline
- Artwork preview: large image with thumbnail strip below
- Details panel: specs grid with mono labels, vermillion CTA button
- CTA button: `bg-[#C41E3A] text-white px-8 py-3 rounded-lg hover:bg-[#A31830]`

### Section 4: Horizontal Art List
```
┌──────────────────────────────────────────────┐
│ ┌──────────┬──────────────────────────────┐  │
│ │ ░░░░░░░░ │ artwork_name_01  ▸  details  │  │
│ ├──────────┼──────────────────────────────┤  │
│ │ ░░░░░░░░ │ artwork_name_02  ▸  details  │  │
│ ├──────────┼──────────────────────────────┤  │
│ │ ░░░░░░░░ │ artwork_name_03  ▸  details  │  │
│ └──────────┴──────────────────────────────┘  │
└──────────────────────────────────────────────┘
```

**Implementation:**
- List items: `flex items-center gap-6 py-4 border-b border-black/[0.06]`
- Thumbnail: `w-16 h-16 rounded-sm object-cover grayscale hover:grayscale-0`
- Text: mono meta for categories, serif for title
- Hover: entire row shifts right `translateX(8px)`, 300ms ease

### Section 5: Typographic Footer
```
┌──────────────────────────────────────────────┐
│                                              │
│         J U P I T X R                        │
│         (15vw, display font)                 │
│                                              │
│  ──────────────────────────────────────────  │
│  scrolling text marquee across full width    │
└──────────────────────────────────────────────┘
```

**Implementation:**
- Giant text: `text-[15vw] font-display tracking-[-0.04em] leading-[0.85]`
- Color: `text-transparent bg-clip-text bg-gradient-to-b from-black/20 to-black/5`
- Scrolling marquee below: same mono meta style as hero nav
- Footer type: **Typographic** (from footer-patterns.md)

---

## Section Transitions

Between ivory sections: hairline border `border-b: 1px solid rgba(0,0,0,0.06)`

Between dark and ivory sections: **torn paper edge** (SVG clip-path)

Between ivory and dark sections: **gradient dissolve** `linear-gradient(to bottom, #F5F0E8, #0A0A0A)`

---

## Critical Anti-Slop Rules

1. **This is a LIGHT site** — ivory #F5F0E8 is the dominant surface, NOT dark
2. **Dark is for hero ONLY** — every other section is ivory or parchment
3. **Red is for CTAs ONLY** — never as section backgrounds or card fills
4. **No glass effects** — editorial hairline borders instead
5. **Serif for headlines** — this is editorial, not tech
6. **Mono for metadata** — 9px, 0.3em tracking, uppercase, always
7. **No equal card grids** — asymmetric layouts only
8. **Thumbnails are grayscale** — color on hover interaction
9. **Torn paper transitions** — not hard borders between light/dark sections

---

## Motion Specs

| Element | Type | Duration | Easing | Trigger |
|---|---|---|---|---|
| Hero character | Subtle parallax | Linear | linear | Scroll |
| Section content | FadeIn + translateY(20px) | 600ms | cubic-bezier(0.16,1,0.3,1) | IntersectionObserver |
| Art list rows | translateX(8px) | 300ms | ease | Hover |
| Thumbnails | grayscale(0) | 400ms | ease | Hover |
| Marquee text | translateX(-100%) | 30s | linear | Infinite loop |
| Page load | Opacity 0→1 | 800ms | ease | DOMContentLoaded |

---

## Responsive Behavior

| Breakpoint | Changes |
|---|---|
| Mobile (<768px) | Single column, hero character smaller, art list stacks, footer text 25vw |
| Tablet (768-1024px) | 2-column layouts maintained, smaller gaps |
| Desktop (>1024px) | Full asymmetric grids, 15vw footer text, generous whitespace |
