# Design Decision Framework

How to make great design decisions when there is NO reference image. Agent MUST consult this when building from scratch (no screenshot, no mockup, no reference).

---

## Phase 0: Problem Framing (BEFORE any design)

Before touching layouts, palettes, or components — answer these:

### 1. Rewrite the brief
Take the user's request and rewrite it in your own words. If you can't rewrite it clearly, you don't understand it.

### 2. Identify the real user
| Question | Example answer |
|---|---|
| Who visits this site? | Developers looking for portfolio inspiration |
| What do they want to DO? | See project quality, contact for hire |
| What emotion should they feel? | "This person is competent and creative" |
| What should they NEVER feel? | "This looks generic" or "This looks unfinished" |

### 3. Clarify what this is NOT
State explicitly what the site should NOT be:
- "NOT a corporate enterprise site"
- "NOT a generic template with stock photos"
- "NOT a dark-mode-by-default cyberpunk thing"

### 4. Define success
Ask: **"If this is perfect, what does the user say?"**
- "Wow, this feels premium" → editorial, restrained, typographic
- "This is so fun/cool" → playful, animated, illustrated
- "This is exactly what I needed" → functional, clear, fast

---

## Phase 1: Genre Detection (from user's words)

When the user describes a project without a reference, detect the genre:

| User says | Genre | Palette direction | Layout direction |
|---|---|---|---|
| portfolio, showcase, projects | **Creative portfolio** | Warm neutral or dark editorial | Asymmetric grid, monumental type |
| landing page, SaaS, product | **Product landing** | Dark premium or light clean | Hero + features + social proof + CTA |
| blog, articles, content | **Editorial/magazine** | Cream/warm white | Wide column + pull quotes |
| game, anime, fantasy, lore | **Illustrated/atmospheric** | Dark + accent colors | Illustrated scenes, z-layered |
| agency, studio, services | **Agency showcase** | Bold contrast | Case study grid, statement hero |
| personal, about me, resume | **Personal site** | Refined/minimal | Statement + selected works |
| e-commerce, shop, store | **Product catalog** | Clean/commercial | Grid + filters + detail pages |

### Default to the most cinematic interpretation
If the user says "build me a portfolio" — don't build a generic Bootstrap template.
Build something that would get nominated on Awwwards.

---

## Phase 2: Design Principles (apply to EVERY build)

### Figma's 7 Core UI Principles

**1. Hierarchy** — Not everything is equally important
- One dominant element per viewport (hero headline, key image, main CTA)
- Size, color, weight, and position all communicate importance
- Rule: If everything is bold, nothing is bold

**2. Consistency** — Same patterns for same purposes
- Buttons look the same everywhere
- Spacing follows a scale (4, 8, 12, 16, 24, 32, 48, 64, 96)
- Typography uses exactly 3 roles (display, body, meta)
- Colors come from the aesthetic tuple, not ad hoc

**3. Proximity** — Related elements are close together
- Label + input = tight (4-8px gap)
- Card icon + card title = close (12-16px)
- Section title + section content = medium (24-40px)
- Section to section = large (80-120px)

**4. Alignment** — Elements share invisible lines
- Left-align body text (never center long paragraphs)
- Center only: hero headlines, section titles, single-line CTAs
- Grid everything: use 4/8/12-column grid

**5. Contrast** — Difference creates meaning
- Text contrast: minimum 4.5:1 for body, 3:1 for large text
- Visual contrast: dark bg + light text OR light bg + dark text (never muddy middle)
- Accent contrast: accent color should POP against the base

**6. White Space** — Emptiness is a design tool
- More white space = more premium feel
- Less white space = more content-dense/editorial
- Rule: When in doubt, add MORE space, not less
- Section padding: minimum 80px top/bottom for breathing room

**7. Feedback** — Every interaction has a response
- Hover states on all interactive elements
- Loading states for async actions  
- Focus styles for accessibility
- Transition duration: 0.2-0.4s for micro, 0.6-0.8s for reveals

---

## Phase 3: Decision-Making Framework

### For EVERY design decision, follow this:

```
1. Write down the problem
   "The hero section needs a focal point"

2. List constraints
   - Must work on mobile
   - No custom images available
   - Dark theme requested

3. Define how success looks
   "User's eye goes to headline first, then CTA, then background detail"

4. Ask: "What breaks if this is wrong?"
   "If the hero is generic, the user bounces in 3 seconds"

5. Document the WHY
   "Chose asymmetric layout because centered hero = AI slop pattern"
```

### Typography decisions

| Context | Font choice | Why |
|---|---|---|
| Elegant/editorial | Playfair Display, Cormorant, EB Garamond | Serifs convey authority and taste |
| Modern/tech | Inter, Outfit, Space Grotesk | Clean geometric sans = contemporary |
| Playful/creative | Bricolage Grotesque, Cabinet Grotesk | Personality without being unprofessional |
| Monospace meta | JetBrains Mono, IBM Plex Mono, Fira Code | Technical credibility |

### Color decisions (NO reference available)

When user gives no color preference:
1. Ask: "What mood should this convey?" (warm/cool/neutral/bold)
2. Auto-suggest 2 options from [palette-and-type-database.md](palette-and-type-database.md)
3. NEVER default to generic blue/purple gradient
4. Design in greyscale FIRST, add color LAST

### Layout decisions

| Section count | Layout approach |
|---|---|
| 1 section (poster/card) | Single viewport, centered or asymmetric |
| 3-4 sections | Linear scroll, full-bleed sections |
| 5-7 sections | Alternating layouts (split L/R, full-width, grid) |
| 8+ sections | Chapter-based with clear visual breaks |

---

## Phase 4: UX Writing Rules

Words ARE the interface. Every label, heading, and CTA matters.

### Rules
1. **Replace generic labels** — "Submit" → "Send Message", "Learn More" → "See Our Work"
2. **Write copy that guides decisions** — "Choose your plan" not "Pricing"
3. **Remove fluff** — cut every word that doesn't earn its place
4. **Explain errors like a human** — "That email doesn't look right" not "Invalid input"
5. **Prioritize clarity over cleverness** — "Sign up free" not "Join the revolution"

### CTA hierarchy
| Level | Example | Style |
|---|---|---|
| Primary | "Get Started" / "Book a Call" | Filled button, high contrast |
| Secondary | "Learn More" / "See Examples" | Outlined button |
| Tertiary | "View pricing" / "Read docs" | Text link with arrow |

---

## Phase 5: Taste & Restraint

### The "zoom out" test
After building a section, zoom your browser to 50%. Does it still look intentional? 
If the layout falls apart at zoom-out, the hierarchy is broken.

### The "remove one thing" test  
Look at every section and ask: "What can I remove without losing meaning?"
Keep removing until removing anything would break the design.

### Premium indicators
| Cheap tell | Premium replacement |
|---|---|
| Equal spacing everywhere | Intentional spacing hierarchy |
| All text same size | Clear type scale with 3+ sizes |
| Color everywhere | Mostly neutral + 1-2 accent touches |
| Busy backgrounds | Clean with one subtle texture |
| Many fonts | 2-3 fonts maximum |
| No whitespace | Generous breathing room |

### Systems over heroes
A well-defined design system beats one beautiful hero screen.
Define FIRST:
1. Spacing scale (4, 8, 12, 16, 24, 32, 48, 64, 96px)
2. Type scale (display, h2, h3, body, small, meta)
3. Color tokens (bg, surface, text-primary, text-muted, accent, accent-hover)
4. Border radius (0 for sharp, 4-8px for subtle, 12-16px for soft, 9999px for pill)
5. Shadow scale (sm, md, lg for depth)

Then build everything FROM the system. Never ad-hoc.

---

## Phase 6: When To Ask The User

### ALWAYS ask (don't guess)
- Light or dark theme?
- What's the primary action visitors should take?
- Any brand colors or existing identity?
- Who is the target audience?

### NEVER ask (decide yourself)
- Spacing values (use the scale)
- Font pairing (select from database based on genre)
- Animation timing (use the motion system)
- Grid structure (derive from content)
- Which footer pattern (match the genre)

---

## Anti-Patterns for "From Scratch" Builds

| Pattern | Why it's bad | What to do instead |
|---|---|---|
| Starting with code | No design direction | Start with aesthetic tuple |
| Picking colors randomly | No cohesion | Use palette database |
| Centering everything | Lazy, generic | Mix centered + left-aligned |
| Same section layout repeated | Monotonous | Alternate: full-width → split → grid → full-width |
| No negative space | Cramped, amateur | 80-120px between sections, 16-24px between elements |
| Decorating before structuring | Polish on bad bones | Get layout right in greyscale first |
| Ignoring mobile | "Desktop-first" trap | Design mobile layout BEFORE desktop |
