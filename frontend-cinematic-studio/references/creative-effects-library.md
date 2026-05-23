# Creative Effects Library

Production-ready CSS/SVG/JS patterns for atmospheric effects. Agent MUST reference this when the user requests textures, shapes, transitions, or animations beyond the basic patterns in SKILL.md.

---

## 1. Section Transitions

### 1A. Torn Paper Edge
```css
/* Apply to the bottom of a section to create torn paper transition */
.torn-paper-bottom {
  position: relative;
}
.torn-paper-bottom::after {
  content: '';
  position: absolute;
  bottom: -2px;
  left: 0;
  right: 0;
  height: 80px;
  background: var(--next-section-bg, #F5F0E8);
  clip-path: polygon(
    0% 65%, 2% 58%, 4% 63%, 6% 52%, 8% 60%, 10% 48%,
    12% 57%, 15% 45%, 18% 55%, 20% 42%, 23% 52%, 26% 40%,
    29% 50%, 32% 38%, 35% 48%, 38% 35%, 41% 45%, 44% 33%,
    47% 43%, 50% 30%, 53% 42%, 56% 35%, 59% 47%, 62% 38%,
    65% 50%, 68% 40%, 71% 52%, 74% 42%, 77% 55%, 80% 45%,
    83% 57%, 86% 48%, 89% 60%, 92% 50%, 95% 62%, 98% 55%,
    100% 60%, 100% 100%, 0% 100%
  );
  z-index: 2;
}

/* Dark → Light version */
.torn-paper-dark-to-light::after {
  --next-section-bg: #F5F0E8;
}

/* Light → Dark version */
.torn-paper-light-to-dark::after {
  --next-section-bg: #0D1117;
}
```

### 1B. Wave/Curve Edge
```css
.wave-bottom {
  position: relative;
}
.wave-bottom::after {
  content: '';
  position: absolute;
  bottom: -2px;
  left: 0;
  right: 0;
  height: 120px;
  background: var(--next-section-bg, #F5F0E8);
  clip-path: ellipse(55% 100% at 50% 100%);
  z-index: 2;
}
```

### 1C. Diagonal Slash
```css
.diagonal-bottom {
  position: relative;
}
.diagonal-bottom::after {
  content: '';
  position: absolute;
  bottom: -2px;
  left: 0;
  right: 0;
  height: 100px;
  background: var(--next-section-bg);
  clip-path: polygon(0 60%, 100% 0%, 100% 100%, 0% 100%);
  z-index: 2;
}
```

### 1D. Mountain Silhouette
```css
.mountain-bottom::after {
  content: '';
  position: absolute;
  bottom: -2px;
  left: 0;
  right: 0;
  height: 150px;
  background: var(--next-section-bg);
  clip-path: polygon(
    0% 100%, 0% 80%, 5% 70%, 10% 55%, 15% 65%, 20% 45%,
    25% 55%, 30% 35%, 35% 50%, 40% 30%, 45% 40%, 50% 20%,
    55% 35%, 60% 25%, 65% 40%, 70% 30%, 75% 50%, 80% 40%,
    85% 55%, 90% 45%, 95% 60%, 100% 50%, 100% 100%
  );
  z-index: 2;
}
```

### 1E. Parallax Reveal (section slides over previous)
```css
.parallax-reveal-section {
  position: sticky;
  top: 0;
  z-index: 2;
  min-height: 100vh;
}
.parallax-reveal-section + .parallax-reveal-section {
  z-index: 3;
}
```

### 1F. Gradient Mist (existing dissolve zone — enhanced)
```css
.mist-transition {
  position: relative;
  height: 200px;
  pointer-events: none;
  background: linear-gradient(
    to bottom,
    var(--section-from) 0%,
    transparent 25%,
    transparent 75%,
    var(--section-to) 100%
  );
  backdrop-filter: blur(3px);
}
```

---

## 2. Background Textures

### 2A. Paper Texture (CSS-only)
```css
.paper-texture {
  background-color: #F5F0E8;
  background-image:
    /* Fiber pattern */
    repeating-linear-gradient(
      0deg,
      transparent,
      transparent 2px,
      rgba(139, 119, 101, 0.03) 2px,
      rgba(139, 119, 101, 0.03) 3px
    ),
    repeating-linear-gradient(
      90deg,
      transparent,
      transparent 3px,
      rgba(139, 119, 101, 0.02) 3px,
      rgba(139, 119, 101, 0.02) 4px
    );
}

/* Aged paper variant */
.aged-paper {
  background-color: #EDE8DD;
  background-image:
    radial-gradient(ellipse at 20% 50%, rgba(139, 90, 43, 0.04) 0%, transparent 50%),
    radial-gradient(ellipse at 80% 30%, rgba(139, 90, 43, 0.03) 0%, transparent 50%),
    radial-gradient(ellipse at 50% 80%, rgba(139, 90, 43, 0.05) 0%, transparent 40%);
}

/* Crumpled paper (add subtle noise) */
.crumpled-paper {
  background-color: #F5F0E8;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.65' numOctaves='3' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)' opacity='0.04'/%3E%3C/svg%3E");
}
```

### 2B. Noise/Static Texture
```css
/* SVG noise — more refined than the grain overlay */
.noise-texture {
  position: relative;
}
.noise-texture::before {
  content: '';
  position: absolute;
  inset: 0;
  pointer-events: none;
  z-index: 1;
  opacity: 0.06;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 512 512' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.8' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)'/%3E%3C/svg%3E");
  mix-blend-mode: overlay;
}
```

### 2C. Fabric/Canvas Texture
```css
.canvas-texture {
  background-color: #F5F0E8;
  background-image:
    linear-gradient(90deg, rgba(0,0,0,0.02) 1px, transparent 1px),
    linear-gradient(rgba(0,0,0,0.02) 1px, transparent 1px);
  background-size: 4px 4px;
}
```

### 2D. Concrete/Stone Texture
```css
.concrete-texture {
  background-color: #1a1a1a;
  background-image:
    radial-gradient(circle at 25% 25%, rgba(255,255,255,0.02) 1px, transparent 1px),
    radial-gradient(circle at 75% 75%, rgba(255,255,255,0.015) 1px, transparent 1px),
    radial-gradient(circle at 50% 50%, rgba(255,255,255,0.01) 2px, transparent 2px);
  background-size: 20px 20px, 30px 30px, 15px 15px;
}
```

### 2E. Grid/Dot Pattern Overlay
```css
/* Subtle grid — good for tech/SaaS sites */
.grid-overlay {
  background-image:
    linear-gradient(rgba(255,255,255,0.03) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255,255,255,0.03) 1px, transparent 1px);
  background-size: 60px 60px;
}

/* Dot pattern */
.dot-overlay {
  background-image: radial-gradient(circle, rgba(255,255,255,0.06) 1px, transparent 1px);
  background-size: 24px 24px;
}
```

---

## 3. CSS-Only Illustrations & Shapes

### 3A. Solar System / Orbital Animation
```css
.solar-system {
  position: relative;
  width: 400px;
  height: 400px;
  margin: auto;
}

.sun {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 40px;
  height: 40px;
  margin: -20px;
  border-radius: 50%;
  background: radial-gradient(circle at 30% 30%, #FFD93D, #FF8C00);
  box-shadow: 0 0 40px rgba(255, 200, 0, 0.4), 0 0 80px rgba(255, 140, 0, 0.2);
}

.orbit {
  position: absolute;
  top: 50%;
  left: 50%;
  border: 1px solid rgba(255, 255, 255, 0.08);
  border-radius: 50%;
  animation: orbit-rotate var(--duration) linear infinite;
}

.orbit::after {
  content: '';
  position: absolute;
  top: -6px;
  left: 50%;
  width: 12px;
  height: 12px;
  margin-left: -6px;
  border-radius: 50%;
  background: var(--planet-color);
  box-shadow: 0 0 10px var(--planet-glow);
}

/* Planet configs */
.orbit-1 {
  width: 120px; height: 120px; margin: -60px;
  --duration: 8s; --planet-color: #A8DADC; --planet-glow: rgba(168,218,220,0.3);
}
.orbit-2 {
  width: 200px; height: 200px; margin: -100px;
  --duration: 14s; --planet-color: #E76F51; --planet-glow: rgba(231,111,81,0.3);
}
.orbit-3 {
  width: 300px; height: 300px; margin: -150px;
  --duration: 22s; --planet-color: #2A9D8F; --planet-glow: rgba(42,157,143,0.3);
}
.orbit-4 {
  width: 380px; height: 380px; margin: -190px;
  --duration: 30s; --planet-color: #264653; --planet-glow: rgba(38,70,83,0.3);
}

@keyframes orbit-rotate {
  from { transform: rotate(0deg); }
  to { transform: rotate(360deg); }
}

/* Orbit rings are slightly tilted for depth */
.orbit-1 { transform: rotateX(75deg) rotateZ(0deg); }
.orbit-2 { transform: rotateX(75deg) rotateZ(15deg); }
.orbit-3 { transform: rotateX(75deg) rotateZ(-10deg); }
```

### 3B. Floating Geometric Shapes (ambient decoration)
```css
.floating-shapes {
  position: absolute;
  inset: 0;
  overflow: hidden;
  pointer-events: none;
  z-index: 0;
}

.shape {
  position: absolute;
  opacity: 0.06;
  animation: float var(--duration, 12s) ease-in-out infinite;
}

.shape--circle {
  border-radius: 50%;
  border: 1px solid currentColor;
}

.shape--square {
  border: 1px solid currentColor;
  transform: rotate(45deg);
}

.shape--triangle {
  width: 0; height: 0;
  border-left: 30px solid transparent;
  border-right: 30px solid transparent;
  border-bottom: 52px solid currentColor;
  opacity: 0.04;
}

/* Position variations */
.shape-1 { top: 10%; left: 5%; width: 60px; height: 60px; --duration: 15s; }
.shape-2 { top: 30%; right: 10%; width: 40px; height: 40px; --duration: 12s; animation-delay: -3s; }
.shape-3 { bottom: 20%; left: 15%; width: 80px; height: 80px; --duration: 18s; animation-delay: -7s; }
.shape-4 { top: 60%; right: 20%; width: 50px; height: 50px; --duration: 14s; animation-delay: -5s; }

@keyframes float {
  0%, 100% { transform: translateY(0) rotate(0deg); }
  25% { transform: translateY(-20px) rotate(5deg); }
  50% { transform: translateY(-10px) rotate(-3deg); }
  75% { transform: translateY(-25px) rotate(2deg); }
}
```

### 3C. Decorative Ring/Halo
```css
/* Ornamental ring behind character art or hero element */
.decorative-ring {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 500px;
  height: 500px;
  border-radius: 50%;
  border: 1px solid rgba(200, 155, 91, 0.15);
  animation: ring-spin 60s linear infinite;
}

.decorative-ring::before,
.decorative-ring::after {
  content: '';
  position: absolute;
  inset: 20px;
  border-radius: 50%;
  border: 1px solid rgba(200, 155, 91, 0.08);
}

.decorative-ring::after {
  inset: 50px;
  border-style: dashed;
  animation: ring-spin 45s linear infinite reverse;
}

@keyframes ring-spin {
  to { transform: translate(-50%, -50%) rotate(360deg); }
}
```

### 3D. Radial Burst Lines
```css
/* Sun-ray effect behind headings or focal points */
.radial-burst {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 600px;
  height: 600px;
  background: repeating-conic-gradient(
    rgba(200, 155, 91, 0.03) 0deg 2deg,
    transparent 2deg 12deg
  );
  border-radius: 50%;
  animation: burst-rotate 120s linear infinite;
}

@keyframes burst-rotate {
  to { transform: translate(-50%, -50%) rotate(360deg); }
}
```

---

## 4. Complex Animations

### 4A. Floating/Levitation (for product shots, characters)
```css
.levitate {
  animation: levitate 6s ease-in-out infinite;
}

@keyframes levitate {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-15px); }
}

/* With shadow that responds to height */
.levitate-shadow {
  position: relative;
}
.levitate-shadow::after {
  content: '';
  position: absolute;
  bottom: -20px;
  left: 10%;
  right: 10%;
  height: 20px;
  background: radial-gradient(ellipse, rgba(0,0,0,0.15), transparent);
  border-radius: 50%;
  animation: shadow-breathe 6s ease-in-out infinite;
}

@keyframes shadow-breathe {
  0%, 100% { transform: scaleX(1); opacity: 0.15; }
  50% { transform: scaleX(0.85); opacity: 0.08; }
}
```

### 4B. Pulsing Glow (for CTAs, active elements)
```css
.pulse-glow {
  animation: pulse-glow 3s ease-in-out infinite;
}

@keyframes pulse-glow {
  0%, 100% { box-shadow: 0 0 20px rgba(52, 211, 153, 0.2); }
  50% { box-shadow: 0 0 40px rgba(52, 211, 153, 0.4), 0 0 80px rgba(52, 211, 153, 0.1); }
}
```

### 4C. Scrolling Marquee (for nav text, tickers)
```css
.marquee-container {
  overflow: hidden;
  white-space: nowrap;
}

.marquee-content {
  display: inline-flex;
  animation: marquee 30s linear infinite;
}

.marquee-content > * {
  padding: 0 2rem;
}

/* Duplicate content for seamless loop */
@keyframes marquee {
  0% { transform: translateX(0); }
  100% { transform: translateX(-50%); }
}
```

### 4D. Path-Following Animation (decorative elements along a curve)
```html
<svg viewBox="0 0 800 200" class="path-animation">
  <path id="motion-path" d="M0,100 Q200,0 400,100 Q600,200 800,100"
    fill="none" stroke="rgba(255,255,255,0.05)" stroke-width="1" />
  <circle r="4" fill="var(--accent-primary)">
    <animateMotion dur="8s" repeatCount="indefinite">
      <mpath href="#motion-path" />
    </animateMotion>
  </circle>
</svg>
```

### 4E. Staggered Card Reveal (enhanced FadeIn)
```tsx
// Cards reveal one-by-one with increasing delay
// Use with the FadeIn wrapper from SKILL.md Pattern 5
<div className="grid grid-cols-[1.2fr_0.8fr_1fr] gap-6">
  {items.map((item, i) => (
    <FadeIn key={i} delay={i * 150} duration={600}>
      <Card {...item} />
    </FadeIn>
  ))}
</div>
```

### 4F. Magnetic Cursor Effect (premium touch)
```tsx
// Element subtly follows cursor position
function MagneticElement({ children, strength = 0.3 }) {
  const ref = useRef(null);
  const [pos, setPos] = useState({ x: 0, y: 0 });

  const handleMouse = (e) => {
    const rect = ref.current.getBoundingClientRect();
    const cx = rect.left + rect.width / 2;
    const cy = rect.top + rect.height / 2;
    setPos({
      x: (e.clientX - cx) * strength,
      y: (e.clientY - cy) * strength,
    });
  };

  const reset = () => setPos({ x: 0, y: 0 });

  return (
    <div ref={ref} onMouseMove={handleMouse} onMouseLeave={reset}
      style={{ transform: `translate(${pos.x}px, ${pos.y}px)`,
        transition: 'transform 0.3s cubic-bezier(0.16, 1, 0.3, 1)' }}>
      {children}
    </div>
  );
}
```

### 4G. Particle-Like Ambient Dots
```css
/* CSS-only floating particles */
.particles {
  position: fixed;
  inset: 0;
  pointer-events: none;
  z-index: 1;
  overflow: hidden;
}

.particle {
  position: absolute;
  width: 2px;
  height: 2px;
  background: rgba(255, 255, 255, 0.15);
  border-radius: 50%;
  animation: particle-float var(--dur, 15s) linear infinite;
}

.particle:nth-child(1) { left: 10%; --dur: 18s; animation-delay: 0s; }
.particle:nth-child(2) { left: 25%; --dur: 14s; animation-delay: -3s; }
.particle:nth-child(3) { left: 40%; --dur: 20s; animation-delay: -7s; }
.particle:nth-child(4) { left: 55%; --dur: 16s; animation-delay: -2s; }
.particle:nth-child(5) { left: 70%; --dur: 22s; animation-delay: -9s; }
.particle:nth-child(6) { left: 85%; --dur: 13s; animation-delay: -5s; }

@keyframes particle-float {
  0% { transform: translateY(100vh) scale(0); opacity: 0; }
  10% { opacity: 1; }
  90% { opacity: 1; }
  100% { transform: translateY(-10vh) scale(1); opacity: 0; }
}
```

### 4H. Global Starfield (for dark/space/astronomy themes)
```css
/* Fixed-position star layer behind ALL sections — creates cohesive space feel */
.starfield {
  position: fixed;
  inset: 0;
  pointer-events: none;
  z-index: 0;
  overflow: hidden;
}

.star {
  position: absolute;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.8);
}

/* Generate 30-50 stars with varied sizes and positions */
/* Size classes: small (1px), medium (2px), large (3px) */
.star--sm { width: 1px; height: 1px; }
.star--md { width: 2px; height: 2px; }
.star--lg { width: 3px; height: 3px; background: rgba(255, 255, 255, 1); }

/* Twinkle animation — random delays per star */
.star--twinkle {
  animation: twinkle var(--twinkle-dur, 4s) ease-in-out infinite;
  animation-delay: var(--twinkle-delay, 0s);
}

@keyframes twinkle {
  0%, 100% { opacity: 0.3; }
  50% { opacity: 1; }
}

/* Example positions — generate 30+ of these programmatically */
.star:nth-child(1) { top: 5%; left: 12%; }
.star:nth-child(2) { top: 8%; left: 67%; }
.star:nth-child(3) { top: 15%; left: 34%; }
.star:nth-child(4) { top: 22%; left: 88%; }
.star:nth-child(5) { top: 28%; left: 45%; }
/* ... etc. Use a loop in React/JS to generate random positions */
```

```tsx
// React component version (recommended for Next.js projects)
'use client'
import { useMemo } from 'react'

export function StarField({ count = 40 }) {
  const stars = useMemo(() =>
    Array.from({ length: count }, (_, i) => ({
      id: i,
      x: Math.random() * 100,
      y: Math.random() * 100,
      size: Math.random() < 0.6 ? 1 : Math.random() < 0.85 ? 2 : 3,
      opacity: 0.3 + Math.random() * 0.7,
      twinkle: Math.random() > 0.5,
      delay: Math.random() * 5,
      duration: 3 + Math.random() * 4,
    })),
  [count])

  return (
    <div className="fixed inset-0 pointer-events-none z-0" aria-hidden="true">
      {stars.map((s) => (
        <div
          key={s.id}
          className={s.twinkle ? 'animate-twinkle' : ''}
          style={{
            position: 'absolute',
            left: `${s.x}%`,
            top: `${s.y}%`,
            width: s.size,
            height: s.size,
            borderRadius: '50%',
            background: s.size === 3 ? '#fff' : 'rgba(255,255,255,0.8)',
            opacity: s.opacity,
            animationDelay: `${s.delay}s`,
            animationDuration: `${s.duration}s`,
          }}
        />
      ))}
    </div>
  )
}
// Add to globals.css: @keyframes twinkle { 0%,100%{opacity:0.3} 50%{opacity:1} }
// Add to tailwind: animation: { twinkle: 'twinkle 4s ease-in-out infinite' }
// Place <StarField /> in layout.tsx, BEFORE {children}
```

---

## 5. Ornamental Decorations

### 5A. Corner Ornaments (for hero sections, cards)
```css
.ornamental-corners {
  position: relative;
}

.ornamental-corners::before,
.ornamental-corners::after {
  content: '✦';
  position: absolute;
  font-size: 14px;
  color: rgba(200, 155, 91, 0.3);
  line-height: 1;
}
.ornamental-corners::before { top: 12px; left: 12px; }
.ornamental-corners::after { bottom: 12px; right: 12px; }
```

### 5B. Horizontal Rule Ornament
```css
.ornamental-rule {
  display: flex;
  align-items: center;
  gap: 1rem;
  color: rgba(255, 255, 255, 0.15);
}

.ornamental-rule::before,
.ornamental-rule::after {
  content: '';
  flex: 1;
  height: 1px;
  background: currentColor;
}

/* Center symbol */
.ornamental-rule span {
  font-size: 12px;
  letter-spacing: 0.3em;
}
```

### 5C. Vignette Overlay
```css
.vignette {
  position: relative;
}
.vignette::after {
  content: '';
  position: absolute;
  inset: 0;
  pointer-events: none;
  background: radial-gradient(ellipse at center, transparent 50%, rgba(0,0,0,0.4) 100%);
}
```

---

## Selection Guide

| User request | Effects to use |
|---|---|
| "Solar system" / "orbital" | 3A Solar System + 4A Levitation |
| "Paper texture" / "archival" | 2A Paper Texture + 1A Torn Paper |
| "Cinematic" / "atmospheric" | 2B Noise + 3C Decorative Ring + 4G Particles |
| "Editorial" / "magazine" | 2A Paper + 5B Ornamental Rule + 1F Mist |
| "Gaming" / "fantasy" | 3D Radial Burst + 4G Particles + 5C Vignette |
| "SaaS" / "tech" | 2E Grid Overlay + 4B Pulse Glow + 4F Magnetic Cursor |
| "Smooth transitions" | 1A-1F (pick based on mood) |
| "Premium" / "luxury" | 3B Floating Shapes + 4A Levitation + 5A Corner Ornaments |
| "Glass" / "liquid" | Pattern 4 from SKILL.md + 2B Noise + 4B Pulse Glow |

---

## Rules

1. **Max 3 effects per page** — too many = nervous, cheap. Pick the 2-3 that serve the mood.
2. **All effects honor `prefers-reduced-motion`** — wrap animations in `@media (prefers-reduced-motion: no-preference) { }`
3. **Particles/shapes go on z-0 ambient** — never above content
4. **Textures are at 3-8% opacity** — never visible enough to distract from content
5. **Section transitions must match the mood** — torn paper for editorial, mist for cinematic, diagonal for bold
