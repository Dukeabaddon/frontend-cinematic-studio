---
name: frontend-cinematic-studio
description: >-
  Directs award-level cinematic frontend builds using dialectic design review,
  goals-not-tasks workflow, section-by-section build, anti-AI-slop art direction,
  Graphify knowledge-graph queries, and Gate-MCP input compression. Use when
  building landing pages, portfolios, editorial sites, Awwwards-style experiences,
  anime-atmosphere UI, or when the user invokes /frontend-cinematic-studio,
  mentions cinematic/tactile/editorial web design, or wants token-efficient
  exploration of large codebases.
disable-model-invocation: true
compatibility: >-
  Requires Python 3.10+ (graphifyy via python -m graphify) and Gate-MCP MCP server.
  Works in Cursor, Antigravity, Claude Code, Windsurf, Trae, VS Code Copilot.
metadata:
  author: Aaron
  version: "3.0.0"
---

# Frontend Cinematic Studio v3

Master operating system for handcrafted, atmospheric, editorial web experiences — not generic AI slop.

> **v3 changes:** Dialectic questioning before full pages, section-by-section builds, Liquid Glass v2, footer patterns, auto-detect Gate-MCP/Graphify per IDE, 6-IDE config support.

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

### 2. Dialectic Design Review (MANDATORY for full pages)

**For full-page or multi-section builds, run 2-3 rounds of review BEFORE coding.**
Single-component requests can skip to goals.

#### Round 1 — Layout Proposal
Present to user:
```markdown
## Layout Plan
- Hero: [composition — e.g. split asymmetric, character anchor right-third]
- Section 2: [purpose + layout — e.g. feature bento, editorial two-column]
- Section 3: [purpose + layout]
- Footer: [type — reveal/typographic/editorial/minimal]
- Page flow: [color journey — e.g. ivory → mist dissolve → deep charcoal]

Does this match your vision? What to add/remove/change?
```

#### Round 2 — Visual System Proposal
After layout approval:
```markdown
## Visual System
- Palette: [3 hex codes + rationale — never generic "blue and white"]
- Typography: [display + body + meta fonts + why]
- UI Component Style: [glass/editorial/brutalist/cards + rationale]
- Reference mood: ["closest to X meets Y" — e.g. "Kinfolk meets Monster Hunter"]
- Key CSS patterns: [which mandatory patterns apply + any custom ones]

Approve or adjust?
```

#### Round 3 — Component Preview (complex projects only)
For projects with 4+ sections, build ONE hero section first, show to user, get feedback, then proceed with remaining sections.

**Skip dialectic only when:** user provides a genre template, reference screenshot, or says "just build it."

### 3. Goals, Not Tasks

Output **GOALS** first (measurable visual outcomes). Example:

> G1 Hero: character anchor right-third, monumental display type partially occluded by environmental layer
> G2 Section journey: parchment → mist dissolve → cathedral black via gradient overlap zones
> G3 Motion: staggered reveals on scroll, linear parallax, no spring on scroll-linked transforms
> G4 Anti-slop: no centered 3-col card grid, no flat white backgrounds, no system fonts

**Do not** output implementation task lists until goals are approved. After approval: derive phased delivery (build → refine → polish).

### 4. Section-by-Section Build (MANDATORY for full pages)

**Never generate an entire multi-section page in one shot.** Build incrementally:

```
1. Build hero section → show to user → get approval or feedback
2. Build section 2 → show → approve
3. Build remaining sections (can batch 2-3 if user is happy with direction)
4. Add footer (use footer pattern from references/footer-patterns.md)
5. Polish transitions between sections (dissolve zones)
6. Pre-ship audit
```

Single-component requests ("build me a navbar", "make a card") skip this — build and deliver directly.

### 5. Anti-Slop — Hard Reject

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

### Pattern 4: Liquid Glass v2 (forms, docks, nav only)

```css
/* Reusable class — apply to navs, forms, overlays. NEVER decorative. */
.liquid-glass {
  background: rgba(0, 0, 0, 0.4);
  background-blend-mode: luminosity;
  backdrop-filter: blur(4px);
  -webkit-backdrop-filter: blur(4px);
  border: none;
  box-shadow: inset 0 1px 1px rgba(255, 255, 255, 0.1);
  position: relative;
  overflow: hidden;
}
.liquid-glass::before {
  content: '';
  position: absolute;
  inset: 0;
  border-radius: inherit;
  padding: 1.4px;
  background: linear-gradient(180deg,
    rgba(255,255,255,0.3) 0%, rgba(255,255,255,0.1) 20%,
    rgba(255,255,255,0) 40%, rgba(255,255,255,0) 60%,
    rgba(255,255,255,0.1) 80%, rgba(255,255,255,0.3) 100%);
  -webkit-mask: linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0);
  -webkit-mask-composite: xor;
  mask-composite: exclude;
  pointer-events: none;
}
```

Glass is **banned** as decorative. Only use on functional elements (booking forms, sticky docks, nav overlays).

### Pattern 5: Reusable FadeIn Wrapper

```tsx
// Generic scroll-reveal component — use instead of raw IntersectionObserver
function FadeIn({ children, delay = 0, duration = 600, className = '' }) {
  const [visible, setVisible] = useState(false);
  const ref = useRef(null);
  useEffect(() => {
    const obs = new IntersectionObserver(([e]) => e.isIntersecting && setVisible(true), { threshold: 0.1 });
    if (ref.current) obs.observe(ref.current);
    return () => obs.disconnect();
  }, []);
  return (
    <div ref={ref} className={className}
      style={{ opacity: visible ? 1 : 0, transform: visible ? 'none' : 'translateY(20px)',
        transition: `opacity ${duration}ms ease ${delay}ms, transform ${duration}ms ease ${delay}ms` }}>
      {children}
    </div>
  );
}
```

Stagger children with incremental `delay` props (200ms, 400ms, 600ms).

### Pattern 6: Character-by-Character Text Reveal

```tsx
// For hero headlines. Each char animates from translateX(-18px) to 0.
// charDelay = 30ms, initialDelay = 200ms, transition = 500ms per char.
// Split text by \n into lines, then each line into chars.
// Spaces render as \u00A0 (non-breaking space).
```

Use when the hero headline needs cinematic entrance — not on every heading.

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

1. **Tooling auto-detect** — Run before anything else:
   ```
   a. Check if gate_* MCP tools exist → use them (gate_init first)
   b. Check if graphify-out/ or graph.json exists → use it
   c. Detect IDE:
      - Cursor: check .cursor/mcp.json
      - Antigravity: check mcp_config.json or Settings → MCP
      - Claude Code: MCP via claude mcp commands
      - Windsurf: MCP via Cascade settings
      - Trae: MCP via settings
   d. If no MCP tools → fallback to CLI: python -m graphify query "..."
   e. Activate caveman mode narration (3-6 word sentences between tools)
   ```
2. **Scope triage** — [scope-triage.md](references/scope-triage.md): simple single-view vs complex multi-section.
3. **Aesthetic tuple** — Fill the template above. No CSS until the tuple exists and user approves.
4. **Dialectic review** — For full pages: run Round 1 (layout) + Round 2 (visual system) from Hard Gate #2.
5. **Tech stack** — Read `package.json`. If empty, propose tier from [tech-stack-menu.md](references/tech-stack-menu.md). User confirms before scaffold.
6. **Genre template** — Check if a matching genre template exists in `prompts/`:
   - [anime-fantasy-landing.md](prompts/anime-fantasy-landing.md) — anime/fantasy landing pages
   - [gaming-wiki.md](prompts/gaming-wiki.md) — game portfolio/wiki pages
   - [personal-portfolio.md](prompts/personal-portfolio.md) — developer/creative portfolios
   - [product-landing.md](prompts/product-landing.md) — SaaS/product pages (cinematic, not startup)
   - [editorial-magazine.md](prompts/editorial-magazine.md) — content-heavy editorial sites

   Use the matching template as a starting point. If no match, adapt the aesthetic tuple to the user's domain.

7. **Tooling reference** — [tooling-guide.md](references/tooling-guide.md) (Graphify + Gate-MCP + platform setup).
8. **Generate DESIGN.md** — After tuple + dialectic approval, generate `DESIGN.md` at project root using [design-md-template.md](references/design-md-template.md). This becomes the persistent design source of truth for the project.

---

## Design Systems (read when implementing)

| Topic | File |
|-------|------|
| Z-planes, materials, dissolve transitions | [visual-systems.md](references/visual-systems.md) |
| Motion, parallax, typography, tracking law | [motion-and-type.md](references/motion-and-type.md) |
| Footer archetypes (reveal, typographic, editorial, minimal) | [footer-patterns.md](references/footer-patterns.md) |
| DESIGN.md generation template (9-section standard) | [design-md-template.md](references/design-md-template.md) |
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
- [ ] **Scroll animation** — Is there at least ONE scroll-triggered reveal (FadeIn wrapper or IntersectionObserver)?
- [ ] **No pure white/black** — Are dominant surfaces warm/cool tinted (not raw `#fff` or `#000`)?
- [ ] **Anti-slop clean** — No centered 3-col equal grids, no default gradients, no fake status chrome?
- [ ] **Footer present** — Does the page have a footer using one of the 4 archetypes from [footer-patterns.md](references/footer-patterns.md)?
- [ ] **Liquid Glass v2** — If glass is used, is it the `.liquid-glass` class with `::before` border gradient? (Not raw backdrop-blur)
- [ ] **Build passes** — `npm run build` or `tsc --noEmit` succeeds?

**Final gut check:** Would this page feel at home on Awwwards, or on a generic template site?
If the answer is "template site" → **the build has failed.** Go back to the aesthetic tuple and redesign.

Full checklist: [award-bar.md](checklists/award-bar.md)

---

## Activation Checklist

Copy when skill starts:

```
Cinematic Studio v3 active
- [ ] Tooling auto-detected (gate/graphify/IDE)
- [ ] Preflight posted (graphify + gate status)
- [ ] Aesthetic tuple drafted and shown to user
- [ ] User approved tuple
- [ ] Dialectic review done (full pages only)
- [ ] Goals written (not tasks)
- [ ] User approved goals
- [ ] Section-by-section build planned (full pages only)
- [ ] Anti-slop pass planned
- [ ] Footer pattern selected
- [ ] Pre-ship audit planned
```

---

## User Guidance (always on)

Short, calm, plain English — **no walls of text**. After tools: **User brief** (≤3 bullets). User may get overwhelmed; offer "explain more" only if they ask.

---

## Install Locations

| IDE | Skill Path | Config File |
|---|---|---|
| Cursor (project) | `.cursor/skills/frontend-cinematic-studio/` | `.cursor/rules/frontend-cinematic.mdc` |
| Antigravity | `.agent/skills/frontend-cinematic-studio/` | Plugin `plugin.json` |
| Claude Code | `CLAUDE.md` references skill | `CLAUDE.md` (project root) |
| Windsurf | `.windsurf/rules/frontend-cinematic-studio/` | `.windsurf/rules/frontend-cinematic.md` |
| Trae | `.trae/skills/frontend-cinematic-studio/` | `.trae/rules/frontend-cinematic.md` |
| Copilot | `.github/skills/frontend-cinematic-studio/` | `.github/copilot-instructions.md` |
| Global Cursor | `~/.cursor/skills/frontend-cinematic-studio/` | N/A |

Run `install.ps1 -IDE <ide>` to generate the appropriate config file.
See [README.md](README.md) for setup.
