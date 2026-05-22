---
name: frontend-cinematic-studio
description: >-
  Directs award-level cinematic frontend builds using goals-not-tasks workflow,
  anti-AI-slop art direction, Graphify knowledge-graph queries, and Gate-MCP
  input compression. Use when building landing pages, portfolios, editorial sites,
  Awwwards-style experiences, anime-atmosphere UI, or when the user invokes
  /frontend-cinematic-studio, mentions cinematic/tactile/editorial web design,
  or wants token-efficient exploration of large codebases.
disable-model-invocation: true
compatibility: >-
  Requires Python 3.10+ (graphifyy via python -m graphify) and Gate-MCP MCP server.
  Works in Cursor, Antigravity (.agent/skills/), VS Code Copilot (.github/skills/).
metadata:
  author: Aaron
  version: "2.0.0"
---

# Frontend Cinematic Studio

Master operating system for handcrafted, atmospheric, editorial web experiences — not generic AI slop.

---

## HARD GATE — Read This First, Obey Always

These rules are **non-negotiable**. Violating any of them means the build has failed.

### 1. Aesthetic Tuple Before Code

**OUTPUT the aesthetic tuple TO THE USER and WAIT for approval before writing any component code.**

Copy and fill this template — do not skip any field:

```markdown
## Aesthetic Tuple

**Mood:** (e.g. Forest Gothic / Deep-sea Collector / Editorial Darkroom)

**Palette:**
- Base surface: (never pure #fff or #000 — use e.g. #F4F1EA, #0D1117, #1a1a1a)
- Midground accent (5–15% borders): (e.g. rgba(255,255,255,0.06))
- Single highlight (CTA, emphasis only): (ONE color — e.g. #D4F87A, #C89B5B, #FF6B6B)
- Text primary / muted: (e.g. #E8E8E8 / #666)

**Fonts:**
- Display: (e.g. Cinzel, Bebas Neue, Playfair Display)
- Body: (e.g. Inter, Outfit)
- Meta mono (9–10px, tracking 0.3em): (e.g. JetBrains Mono)

**Motion curve:**
- Reveals: cubic-bezier(0.16, 1, 0.3, 1)
- Parallax: linear
- Hover: duration 0.3–0.6s

**Z-layers:**
- z-0 ambient: (gradients, dust, slow back silhouettes)
- z-10 atmospheric: (fog, muted decor, non-interactive)
- z-20 foreground: (cards, copy, CTAs)
- z-40+ overlay dock: (nav, media controls — blur + hairline border)

**Anti-slop locks:** (list what we will NOT use for this project)
```

**No component code until this block exists and user approves.**

### 2. Goals, Not Tasks

Output **GOALS** first (measurable visual outcomes). Example:

> G1 Hero: character anchor right-third, monumental display type partially occluded by environmental layer
> G2 Section journey: parchment → mist dissolve → cathedral black via gradient overlap zones
> G3 Motion: staggered reveals on scroll, linear parallax, no spring on scroll-linked transforms
> G4 Anti-slop: no centered 3-col card grid, no flat white backgrounds, no system fonts

**Do not** output implementation task lists until goals are approved. After approval: derive phased delivery (build → refine → polish).

### 3. Anti-Slop — Hard Reject

**Reject and replace immediately** if any of these appear in your output:

| Anti-pattern | Why it fails | Replace with |
|---|---|---|
| `from-purple-600 to-blue-500` hero | Instant AI tell | Custom palette from aesthetic tuple |
| `grid-cols-3 gap-6` card dump | No hierarchy, machine slop | Bento or asymmetric editorial grid |
| Glass/blur on every card | Blur fatigue | Glass only on forms/docks with real `backdrop-blur` + `rgba` fill |
| `shadow-md` as only depth | Flat, no immersion | Layered z-stack + atmospheric shadows |
| Oversized type, no tracking | Immature, unfinished | Tracking law (see below) |
| Fake `STATUS: ONLINE` widgets | Tech-larping, trust-breaking | Remove or implement real function |
| Random animations everywhere | Nervous, cheap | Motion only on hierarchy nodes |
| Pure `#fff` or `#000` backgrounds | Template energy | Warm ivory `#F4F1EA` / deep charcoal `#0D1117` |
| Spring physics on scroll parallax | Bouncy, disconnected | Linear `useTransform` |
| All sections animate at once | No pacing | Staggered `useInView` reveals |
| `// ... rest unchanged` | Incomplete code | Full file or surgical diff |
| 1500-line monolithic App.tsx | Unmaintainable | Split: `types.ts`, `data.ts`, `components/*` |

Full list: [anti-patterns.md](references/anti-patterns.md) · Philosophy: [philosophy.md](references/philosophy.md)

---

## MANDATORY CSS PATTERNS — Include in Every Build

These are the minimum atmospheric requirements. If the final output lacks any of them, **the build has failed**.

### Pattern 1: Grain Overlay (always)

```css
/* Add to global CSS. Apply once at page level. */
.grain-overlay {
  position: fixed;
  inset: 0;
  pointer-events: none;
  z-index: 9999;
  opacity: 0.035;
  mix-blend-mode: overlay;
  background: repeating-conic-gradient(
    #000 0.0001%, transparent 0.0002%,
    transparent 0.0004%, #000 0.0005%
  );
}
```

Or use a subtle grain PNG/SVG texture at 3–8% opacity with `mix-blend-mode: overlay`.

### Pattern 2: Section Dissolve Transitions (between every major section)

```css
/* No hard borders between sections. Use gradient overlap zones. */
.dissolve-zone {
  position: relative;
  height: 12rem; /* h-48 */
  pointer-events: none;
  background: linear-gradient(
    to bottom,
    var(--section-from),
    transparent 30%,
    transparent 70%,
    var(--section-to)
  );
}
```

Optional enhancement: add `backdrop-filter: blur(2px)` for atmospheric mist effect.

### Pattern 3: Typography Minimum

```css
/* Display headings — tracked, uppercase, tight leading */
.font-display {
  letter-spacing: 0.15em;
  text-transform: uppercase;
  line-height: 1.15;
}

/* Meta labels — small, wide-tracked mono */
.font-mono-meta {
  font-size: 0.65rem; /* ~10px */
  letter-spacing: 0.3em;
  text-transform: uppercase;
}

/* Body — readable, slightly tight tracking */
.font-body {
  line-height: 1.75;
  letter-spacing: -0.011em;
}
```

**Tracking Law:** As font size increases, letter-spacing decreases. Small text (9–10px) **requires** wide tracking (`0.25em`–`0.3em`) to stay readable.

### Pattern 4: Atmospheric Glass (forms and docks only)

```tsx
<div className="relative overflow-hidden rounded-md border border-white/[0.06]
  bg-gradient-to-b from-white/[0.04] to-transparent p-8
  shadow-[0_30px_60px_-15px_rgba(0,0,0,0.8)] backdrop-blur-md">
  {/* Top-edge rim light */}
  <div className="pointer-events-none absolute inset-0
    bg-[radial-gradient(circle_at_top,rgba(200,155,91,0.08),transparent_55%)]" />
  {/* Content here */}
</div>
```

Glass is **banned** as decorative. Only use on functional elements (booking forms, sticky docks, nav overlays).

---

## BEFORE/AFTER — What Slop vs Cinematic Looks Like

### ❌ BAD — Generic AI card grid

```html
<div class="grid grid-cols-3 gap-6 p-8">
  <div class="bg-white rounded-lg shadow-md p-6">
    <h3 class="text-xl font-bold">Item Name</h3>
    <p class="text-gray-600">Description text here</p>
  </div>
  <!-- repeat x3 -->
</div>
```

### ✅ GOOD — Cinematic editorial grid

```html
<section class="relative bg-[#0D1117]">
  <!-- Grain overlay -->
  <div class="grain-overlay"></div>

  <!-- Dissolve from previous section -->
  <div class="dissolve-zone" style="--section-from: #F4F1EA; --section-to: #0D1117;"></div>

  <!-- Asymmetric bento grid -->
  <div class="grid grid-cols-[1.2fr_0.8fr_1fr] gap-[clamp(1rem,3vw,2.5rem)] px-[5vw] py-24">
    <div class="relative overflow-hidden rounded-sm border border-white/[0.06]
                bg-gradient-to-b from-white/[0.04] to-transparent p-8
                shadow-[0_30px_60px_-15px_rgba(0,0,0,0.8)] backdrop-blur-md
                hover:-translate-y-1 transition-transform duration-[400ms]
                ease-[cubic-bezier(0.16,1,0.3,1)]">
      <span class="font-mono text-[9px] tracking-[0.3em] uppercase text-[#C89B5B]">
        LEGENDARY / NOCTURNAL
      </span>
      <h3 class="font-serif text-2xl tracking-[0.15em] uppercase mt-2 text-white">
        Item Name
      </h3>
      <p class="text-sm text-white/60 leading-relaxed mt-3">
        Description with editorial body copy.
      </p>
    </div>
  </div>
</section>
```

---

## PHASE 0 — Before Any Code

1. **Scope triage** — [scope-triage.md](references/scope-triage.md): simple single-view vs complex multi-section.
2. **Aesthetic tuple** — Fill the template above. No CSS until the tuple exists and user approves.
3. **Tech stack** — Read `package.json`. If empty, propose tier from [tech-stack-menu.md](references/tech-stack-menu.md). User confirms before scaffold.
4. **Genre template** — Check if a matching genre template exists in `prompts/`:
   - [anime-fantasy-landing.md](prompts/anime-fantasy-landing.md) — anime/fantasy landing pages
   - [gaming-wiki.md](prompts/gaming-wiki.md) — game portfolio/wiki pages
   - [personal-portfolio.md](prompts/personal-portfolio.md) — developer/creative portfolios
   - [product-landing.md](prompts/product-landing.md) — SaaS/product pages (cinematic, not startup)
   - [editorial-magazine.md](prompts/editorial-magazine.md) — content-heavy editorial sites

   Use the matching template as a starting point. If no match, adapt the aesthetic tuple to the user's domain.

5. **Tooling preflight** — [tooling-guide.md](references/tooling-guide.md) (Graphify + Gate-MCP + platform setup).

---

## Design Systems (read when implementing)

| Topic | File |
|-------|------|
| Z-planes, materials, dissolve transitions | [visual-systems.md](references/visual-systems.md) |
| Motion, parallax, typography, tracking law | [motion-and-type.md](references/motion-and-type.md) |
| Anti-pattern detection (full list) | [anti-patterns.md](references/anti-patterns.md) |
| Visual philosophy (core thesis) | [philosophy.md](references/philosophy.md) |
| Adjective → system mapping | [prompt-interpreter.md](references/prompt-interpreter.md) |
| Modular TS/React layout | [architecture.md](references/architecture.md) |
| Agentic engineering (Gemini ref) | [agentic-engineering.md](references/agentic-engineering.md) |

---

## Workflow Routing

| User intent | Workflow |
|---|---|
| New site from reference image | [phase-1-kimi-build.md](references/workflows/phase-1-kimi-build.md) after [phase-3-pinterest-score.md](references/workflows/phase-3-pinterest-score.md) ≥3/4 |
| Refine existing cinematic codebase | [phase-2-claude-refine.md](references/workflows/phase-2-claude-refine.md) — problems 1→4 in order |
| "More atmospheric / tactile / cinematic" | [prompt-interpreter.md](references/prompt-interpreter.md) |
| Backend/booking expansion | `reference/sample-prompt-2.md` Prompt 4 — only if user asks |

---

## Motion Defaults

- **Scroll parallax:** linear `useTransform` — never spring
- **Viewport reveals:** `useInView`, stagger 200ms, ease `[0.16, 1, 0.3, 1]`
- **Smooth scroll:** Lenis when App Router marketing site (see tech-stack-menu)
- **Reduced motion:** honor `prefers-reduced-motion` always
- **Hover:** `y: -4` to `-8`, `scale: 1.02`, warm glow shadow, 300–400ms

---

## Engineering Rules

1. Read file before edit; surgical diffs on working code
2. `types.ts` + `data.ts` + `components/` — no 1500-line monoliths
3. `useEffect` deps: primitives only; cleanup observers/timers
4. Full files on new components — no stubs
5. Run linter/build after substantive edits — [verify.md](checklists/verify.md)
6. Icons: `lucide-react` unless bespoke SVG art requested
7. Images: `next/image` with `sizes`, `priority` on hero LCP

---

## Tech Stack (summary)

Pick tier from [tech-stack-menu.md](references/tech-stack-menu.md) per project. Default cinematic marketing: **Next.js 14+ App Router, TypeScript, Tailwind, Framer Motion, Lenis, next/image, Lucide**.

---

## Tooling (Graphify + Gate-MCP)

Full guide: [tooling-guide.md](references/tooling-guide.md)

**Quick reference:**

| Order | Tool | When |
|---|---|---|
| 1 | `python -m graphify .` | No `graphify-out/` → must build |
| 2 | `gate_init` | First MCP call if Gate tools exist |
| 3 | `graphify query` / `gate_graph_query` | Architecture questions — not mass file reads |
| 4 | `gate_compress_file` | Default for all code reads (skip only < 40 lines) |
| 5 | `gate_clean_response` | JSON tool outputs > 500 tokens |

If Gate tools unavailable (e.g. Antigravity without MCP): use normal file reads, rely on Graphify CLI.

**Caveman mode** (tool narration only): 3–6 word sentences between tools. To user: always plain English **User brief** (≤3 bullets).

---

## 🛑 PRE-SHIP AUDIT — MANDATORY Before Presenting Code

**Do not deliver code to the user until ALL of these pass.** If any fail, fix before showing.

- [ ] **Grain/texture overlay** — Is there a grain overlay on the page? (Pattern 1 above)
- [ ] **Section dissolves** — Are transitions between sections gradient dissolves, not hard borders? (Pattern 2)
- [ ] **Z-layering** — Is there at least ONE section with elements at different depth planes (ambient/atmospheric/foreground)?
- [ ] **Focal anchor** — Does the hero have a single clear focal point (character, headline, artifact)?
- [ ] **Typography 3-role** — Are display, body, and meta fonts all different with proper tracking?
- [ ] **Scroll animation** — Is there at least ONE scroll-triggered reveal (useInView or IntersectionObserver)?
- [ ] **No pure white/black** — Are dominant surfaces warm/cool tinted (not raw `#fff` or `#000`)?
- [ ] **Anti-slop clean** — No centered 3-col equal grids, no default gradients, no fake status chrome?
- [ ] **Build passes** — `npm run build` or `tsc --noEmit` succeeds?

**Final gut check:** Would this page feel at home on Awwwards, or on a generic template site?
If the answer is "template site" → **the build has failed.** Go back to the aesthetic tuple and redesign.

Full checklist: [award-bar.md](checklists/award-bar.md)

---

## Activation Checklist

Copy when skill starts:

```
Cinematic Studio v2 active
- [ ] Preflight posted (graphify + gate status)
- [ ] Aesthetic tuple drafted and shown to user
- [ ] User approved tuple
- [ ] Goals written (not tasks)
- [ ] User approved goals
- [ ] Anti-slop pass planned
- [ ] Pre-ship audit planned
```

---

## User Guidance (always on)

Short, calm, plain English — **no walls of text**. After tools: **User brief** (≤3 bullets). User may get overwhelmed; offer "explain more" only if they ask.

---

## Install Locations

| IDE | Path |
|---|---|
| Cursor (project) | `.cursor/skills/frontend-cinematic-studio/` |
| Antigravity | `.agent/skills/frontend-cinematic-studio/` |
| Copilot | `.github/skills/frontend-cinematic-studio/` |
| Global Cursor | `~/.cursor/skills/frontend-cinematic-studio/` |

See [README.md](README.md) for setup.
