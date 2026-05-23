# SaaS Dark Hero — Genre Template

For premium dark-mode SaaS/AI product pages. Think Linear, Vercel, Raycast — NOT generic startup.

**Use when:** User wants a tech/SaaS product page that looks premium, not template-generated.

---

## Aesthetic Tuple (filled example)

```markdown
## Aesthetic Tuple

**Mood:** Obsidian Workspace / Tech Noir Precision

**Palette:**
- Base surface: #09090B (deep zinc — NOT #000)
- Elevated surface: #18181B (cards, panels)
- Midground accent: rgba(255,255,255,0.06) (hairline borders)
- Single highlight: #34D399 (focused emerald — CTA ONLY)
- Text primary / muted: #FAFAFA / #A1A1AA

**Fonts:**
- Display: Inter (700, tracking -0.04em, tight leading 1.1)
- Body: Inter (400, tracking -0.011em)
- Meta mono: JetBrains Mono (9px, tracking 0.3em, uppercase)
- Import: `https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400&display=swap`

**Motion curve:**
- Reveals: cubic-bezier(0.16, 1, 0.3, 1), 600ms, stagger 200ms
- Product float: translateY(10px) oscillation, 6s ease-in-out infinite
- Hover: scale(1.02), warm shadow glow, 300ms

**Z-layers:**
- z-0 ambient: radial gradient glow (emerald at 3% opacity, centered behind product)
- z-10 atmospheric: grid pattern overlay (1px lines at 5% opacity)
- z-20 foreground: product screenshot, feature cards, text
- z-40+ overlay: liquid-glass navbar

**Anti-slop locks:**
- NO gradient hero blobs (from-purple-600 to-blue-500)
- NO 3-feature icon grid with emoji/icons
- NO pill-shaped badges ("Most Popular", "New")
- NO generic testimonial carousel
- NO floating abstract shapes
- NO pure #000 or #fff backgrounds
```

---

## Layout Plan

### Section 1: Product Hero (100vh)
```
┌──────────────────────────────────────────────┐
│ [Logo]                    [Features] [Login] │  ← liquid-glass nav
│                                              │
│          Build faster.                       │  ← display 5xl-7xl
│          Ship smarter.                       │    tracking -0.04em
│                                              │
│    The AI-powered platform that...           │  ← body, max-w-2xl
│                                              │
│    [Get Started Free]   Learn more →         │  ← emerald CTA
│                                              │
│    ┌─────────────────────────────────┐       │
│    │    Product Screenshot           │       │  ← floating, shadow
│    │    (perspective transform,      │       │    perspective(1200px)
│    │     atmospheric glow behind)    │       │    rotateX(5deg)
│    └─────────────────────────────────┘       │
│                                              │
│    Trusted by  [logo] [logo] [logo] [logo]   │  ← grayscale, 40% opacity
└──────────────────────────────────────────────┘
```

**Implementation:**
- Headline: `text-5xl md:text-6xl lg:text-7xl font-bold tracking-[-0.04em] leading-[1.1]`
- Subheadline: `text-lg text-[#A1A1AA] max-w-2xl mx-auto`
- CTA: `bg-[#34D399] text-[#09090B] font-semibold px-8 py-3.5 rounded-xl hover:bg-[#2DD4BF]`
- Product screenshot: `perspective: 1200px; transform: rotateX(5deg); transition: transform 0.6s`
- Behind screenshot: `radial-gradient(ellipse at center, rgba(52,211,153,0.08) 0%, transparent 60%)`
- Logo strip: `filter: grayscale(1) opacity(0.4) hover:grayscale(0) hover:opacity(1)`

### Section 2: Feature Bento (editorial, NOT icon grid)
```
┌──────────────────────────────────────────────┐
│  ┌──────────────────┐  ┌────────┐            │
│  │                  │  │        │            │
│  │   Feature 1      │  │ Feat 2 │            │
│  │   (large,        │  │        │            │
│  │    spans 2 rows) │  ├────────┤            │
│  │                  │  │ Feat 3 │            │
│  └──────────────────┘  └────────┘            │
│  ┌────────┐  ┌────────┐  ┌──────────────┐   │
│  │ Feat 4 │  │ Feat 5 │  │ Feat 6       │   │
│  └────────┘  └────────┘  └──────────────┘   │
└──────────────────────────────────────────────┘
```

**Implementation:**
- Grid: `grid-cols-3 grid-rows-2` with first card spanning `col-span-2 row-span-2`
- Each card: `bg-[#18181B] border border-white/[0.06] rounded-2xl p-8`
- Card header: mono meta label + bold title
- Hover: `border-color: rgba(52,211,153,0.2)` transition 400ms
- NO emoji icons — use subtle line illustrations or product screenshots

### Section 3: Social Proof (editorial quotes, NOT cards)
```
┌──────────────────────────────────────────────┐
│                                              │
│  "Quote from a real user about the product   │  ← text-2xl, serif
│   that's long enough to feel genuine."       │    or italic
│                                              │
│  — Name, Role at Company                     │  ← mono meta
│                                              │
│  ─────────────────────────────────────────   │  ← hairline border
│                                              │
│  "Another quote..."                          │
│  — Name, Role                                │
│                                              │
└──────────────────────────────────────────────┘
```

**Implementation:**
- Single-column, centered, `max-w-3xl`
- Quotes: `text-2xl italic text-white/80 leading-relaxed`
- Attribution: mono meta style
- Separated by hairline borders, NOT in card containers
- Staggered FadeIn on scroll

### Section 4: CTA (cinematic full-bleed)
```
┌──────────────────────────────────────────────┐
│ ████████████████████████████████████████████ │
│                                              │
│       Ready to build faster?                 │  ← display 4xl
│                                              │
│       [Start Free →]                         │  ← emerald CTA, larger
│                                              │
│ ████████████████████████████████████████████ │
└──────────────────────────────────────────────┘
```

**Implementation:**
- Full-bleed section with atmospheric gradient: `radial-gradient(ellipse at bottom, rgba(52,211,153,0.06), transparent)`
- Larger CTA: `px-12 py-4 text-lg`
- Minimal text — just headline + CTA

### Section 5: Minimal Footer
- Single-line footer from footer-patterns.md
- `text-[10px] tracking-[0.3em] uppercase text-white/30`

---

## Critical Anti-Slop Rules

1. **Bento grid, NOT icon grid** — features use asymmetric bento, never 3 equal columns with icons
2. **Editorial quotes, NOT testimonial cards** — no user avatars, no star ratings, no card containers
3. **One accent color** — emerald #34D399 for CTAs only, never for backgrounds or borders
4. **Product screenshot atmosphere** — radial glow behind, perspective transform, NOT flat floating
5. **No pill badges** — no "Most Popular", "New", "Best Value" overlays
6. **No abstract shapes** — no floating blobs, circles, or gradient meshes as decoration
7. **Logo strip is quiet** — grayscale, low opacity, not animated

---

## Motion Specs

| Element | Type | Duration | Easing | Trigger |
|---|---|---|---|---|
| Hero headline | Char-by-char reveal | 500ms/char, 30ms stagger | ease | Page load |
| Product screenshot | Float oscillation | 6s | ease-in-out | Infinite |
| Feature cards | FadeIn + translateY(20px) | 600ms, 150ms stagger | cubic-bezier(0.16,1,0.3,1) | Scroll |
| Quotes | FadeIn | 600ms | ease | Scroll |
| Nav | Blur increase on scroll | 200ms | ease | Scroll > 50px |
| CTA button | Scale(1.02) + glow | 300ms | ease | Hover |
