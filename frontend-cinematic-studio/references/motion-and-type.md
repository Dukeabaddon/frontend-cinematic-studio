# Motion & Typography Systems

## Cinematic Motion

### Principles

1. **Hierarchy** — hero and timeline earn motion; footer nav earns little
2. **Restraint** — one strong sequence beats ten weak ones
3. **Scroll-linked** — linear, tied to scroll position
4. **Reveal** — viewport-triggered, staggered editorial pacing

### Scroll parallax (hero)

```tsx
const { scrollYProgress } = useScroll({ target: ref, offset: ["start start", "end start"] });
// Mountains: 0.3x | Typography: 0.5x | Card strip: translateX 0.4x | Anchor figure: fixed
```

- **Easing:** linear for transforms
- **GPU:** `will-change: transform` on `motion.div`

### Viewport reveals (timeline)

```tsx
initial={{ opacity: 0, y: 40 }}
animate={{ opacity: 1, y: 0 }}
transition={{ duration: 0.8, ease: [0.16, 1, 0.3, 1] }}
// staggerChildren: 0.2 OR delays 0 / 200 / 400 ms
```

`useInView`: `threshold: 0.3`, `once: true`

### Lenis

```tsx
// duration: 1.2, smoothTouch: false for mobile perf
// Ensure useScroll still targets correct container
```

### Hover

- Cards: `y: -4` to `-8`, `scale: 1.02`, warm glow shadow
- Easing: `[0.16, 1, 0.3, 1]`, 300–400ms
- Custom cursor: lerp ~0.15, `mix-blend-mode: difference`, hide <768px

### Springs

| Use spring | Use cubic / linear |
|------------|-------------------|
| Drag, floating UI chrome | Scroll parallax |
| Optional soft hover | Timeline reveals |

### Accessibility

```css
@media (prefers-reduced-motion: reduce) {
  /* disable parallax transforms, reduce stagger */
}
```

### Performance

- Transform/opacity only on animated layers
- No layout-thrashing width/height animation on scroll
- Budget: hero + 1 timeline + card hovers per page first

## Visual Language & Typography

### Tracking law

| Size | Tracking | Case |
|------|----------|------|
| Display huge | Tighter or `0.15em` uppercase | Condensed serif / Bebas-style |
| Body 16px | `-0.011em` | Inter / Söhne |
| Meta 9–10px | `0.25em`–`0.3em` | Uppercase mono |

Small text **requires** wide tracking to stay readable.

### Line height

- Body: `leading-relaxed` (1.625+) or `leading-loose`
- Display: `leading-tight` ~1.15
- Never `leading-none` on paragraphs

### Roles

| Role | Families (examples) |
|------|---------------------|
| Display | Cinzel, Playfair, Bebas Neue, Oswald |
| Body | Inter, Outfit |
| Meta | JetBrains Mono, Fira Code |

### Accent discipline

**One** high-luminosity accent (lime `#D4F87A`, brass `#C89B5B`, crimson `#9C4B4B`). Use for emphasis phrases on scroll-in, focus rings, hover borders — not floods.

### Palette integrity

- No raw Tailwind `purple-600` → `blue-500` heroes
- WCAG contrast on body text (aim AAA on primary copy)

### CSS utility classes (optional pattern)

```css
.font-display { letter-spacing: 0.15em; text-transform: uppercase; line-height: 1.15; }
.font-mono-meta { font-size: 0.65rem; letter-spacing: 0.3em; text-transform: uppercase; }
```
