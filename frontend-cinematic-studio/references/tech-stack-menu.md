# Tech Stack Menu

Read `package.json` first. **Suggest** a tier; do not swap stack silently.

## Tier A — Cinematic marketing (default)

**When:** Landing, portfolio, editorial travel, award-site briefs.

| Layer | Choice |
|-------|--------|
| Framework | Next.js 14+ App Router, TypeScript |
| Style | Tailwind (arbitrary values for glass/atmosphere) |
| Motion | `framer-motion` |
| Scroll | `@studio-freight/lenis` or `lenis` |
| Images | `next/image`, priority on hero LCP |
| Icons | `lucide-react` |
| Fonts | `next/font` (display serif + body sans + mono meta) |

**Libraries by job:**

| Job | Library |
|-----|---------|
| Hero parallax | `useScroll`, `useTransform`, `motion` |
| Section reveals | `useInView`, stagger 200ms |
| Smooth scroll | Lenis in root layout |
| Custom cursor | Small component, `prefers-reduced-motion` off |
| Easing standard | `cubic-bezier(0.16, 1, 0.3, 1)` |

## Tier B — Vite SPA / hackathon applet

**When:** Single-view, Antigravity applet, fast demo, no SSR.

| Layer | Choice |
|-------|--------|
| Build | Vite + React + TS |
| Style | Tailwind |
| Motion | `motion/react` (same API as Framer) |
| Scroll | Native or Lenis if multi-section |
| Data | `src/data.ts`, `src/types.ts` |

## Tier C — Static / minimal JS

**When:** Max performance, mostly editorial content.

| Layer | Choice |
|-------|--------|
| Framework | Astro or HTML + Tailwind |
| Motion | CSS + light `IntersectionObserver` |
| Images | Optimized static + `loading="lazy"` |

## Motion package detection

| Installed | Use |
|-----------|-----|
| `framer-motion` | `framer-motion` imports |
| `motion` only | `motion/react` |
| Neither | Propose Tier A install |

## Assets

| Asset type | Guidance |
|------------|----------|
| Hero photo | WebP/AVIF, width 1920–2400, `sizes` on next/image |
| Textures | Subtle PNG grain, &lt; 200kb, `mix-blend-overlay` |
| Video loops | MP4 polaroid cards, muted autoplay, poster frame |
| Fonts | Max 2 families + 1 mono meta |

## Do not add without request

- WebGL / Three.js
- Extra animation libraries beyond Framer
- shadcn unless user wants component speed over craft
