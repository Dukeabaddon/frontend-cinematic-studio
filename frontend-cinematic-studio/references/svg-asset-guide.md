# SVG Asset Creation Guide

How to create, animate, and integrate inline SVG decorative assets. Agent MUST reference this when the user wants custom illustrated elements like lanterns, plants, frames, icons, or ornamental decorations.

---

## Core Principle

**Inline SVG > images** for decorative elements because:
- Animatable with CSS/JS (sway, flicker, glow, grow)
- Scales to any resolution
- Themeable with CSS variables
- No extra HTTP requests
- Accessible (aria-hidden for decorative)

---

## 1. Hanging Lantern (animated sway + flicker)

```html
<div class="lantern-container" aria-hidden="true">
  <svg viewBox="0 0 60 160" width="60" height="160" class="lantern">
    <!-- Chain/rope -->
    <line x1="30" y1="0" x2="30" y2="50"
      stroke="rgba(139,119,101,0.4)" stroke-width="1.5" />

    <!-- Top hook -->
    <path d="M25,48 Q30,42 35,48" fill="none"
      stroke="rgba(139,119,101,0.6)" stroke-width="1.5" />

    <!-- Lantern top cap -->
    <rect x="22" y="50" width="16" height="4" rx="1"
      fill="rgba(80,60,40,0.8)" />

    <!-- Glass body -->
    <rect x="18" y="54" width="24" height="40" rx="3"
      fill="rgba(255,240,200,0.15)"
      stroke="rgba(139,119,101,0.4)" stroke-width="1" />

    <!-- Cross bars -->
    <line x1="18" y1="74" x2="42" y2="74"
      stroke="rgba(139,119,101,0.3)" stroke-width="0.8" />
    <line x1="30" y1="54" x2="30" y2="94"
      stroke="rgba(139,119,101,0.3)" stroke-width="0.8" />

    <!-- Flame glow -->
    <ellipse cx="30" cy="72" rx="6" ry="8"
      fill="rgba(255,200,100,0.3)" class="lantern-glow" />

    <!-- Flame core -->
    <ellipse cx="30" cy="72" rx="2.5" ry="4"
      fill="rgba(255,180,60,0.7)" class="lantern-flame" />

    <!-- Bottom cap -->
    <rect x="22" y="94" width="16" height="4" rx="1"
      fill="rgba(80,60,40,0.8)" />

    <!-- Bottom finial -->
    <line x1="30" y1="98" x2="30" y2="108"
      stroke="rgba(139,119,101,0.4)" stroke-width="1" />
    <circle cx="30" cy="110" r="2.5"
      fill="rgba(80,60,40,0.6)" />
  </svg>
</div>

<style>
.lantern-container {
  position: absolute;
  top: 0;
  transform-origin: top center;
  animation: lantern-sway 4s ease-in-out infinite;
  z-index: 10;
}

/* Left lantern */
.lantern-container.left { left: 5%; }
/* Right lantern */
.lantern-container.right { right: 5%; }

@keyframes lantern-sway {
  0%, 100% { transform: rotate(-2deg); }
  50% { transform: rotate(2deg); }
}

.lantern-glow {
  animation: glow-pulse 3s ease-in-out infinite;
}

.lantern-flame {
  animation: flame-flicker 2s ease-in-out infinite;
}

@keyframes glow-pulse {
  0%, 100% { opacity: 0.3; rx: 6; ry: 8; }
  50% { opacity: 0.5; rx: 8; ry: 10; }
}

@keyframes flame-flicker {
  0%, 100% { opacity: 0.7; transform: scaleY(1); }
  25% { opacity: 0.5; transform: scaleY(0.9) translateX(0.5px); }
  50% { opacity: 0.8; transform: scaleY(1.1); }
  75% { opacity: 0.6; transform: scaleY(0.95) translateX(-0.5px); }
}

/* Respect reduced motion */
@media (prefers-reduced-motion: reduce) {
  .lantern-container { animation: none; }
  .lantern-glow, .lantern-flame { animation: none; }
}
</style>
```

---

## 2. Decorative Vine / Branch with Berries

```html
<svg viewBox="0 0 200 300" class="vine-decoration" aria-hidden="true">
  <!-- Main branch -->
  <path d="M100,0 Q95,40 105,80 Q110,120 95,160 Q85,200 100,240 Q108,270 95,300"
    fill="none" stroke="rgba(60,80,40,0.5)" stroke-width="3"
    stroke-linecap="round" />

  <!-- Sub branches -->
  <path d="M105,80 Q130,70 145,85" fill="none"
    stroke="rgba(60,80,40,0.4)" stroke-width="2" />
  <path d="M95,160 Q65,150 55,165" fill="none"
    stroke="rgba(60,80,40,0.4)" stroke-width="2" />
  <path d="M100,240 Q125,230 140,245" fill="none"
    stroke="rgba(60,80,40,0.4)" stroke-width="2" />

  <!-- Leaves -->
  <g class="leaf" style="--delay: 0s">
    <ellipse cx="145" cy="82" rx="15" ry="8"
      fill="rgba(40,100,50,0.6)" transform="rotate(-20,145,82)" />
  </g>
  <g class="leaf" style="--delay: 0.5s">
    <ellipse cx="55" cy="162" rx="15" ry="8"
      fill="rgba(40,100,50,0.5)" transform="rotate(25,55,162)" />
  </g>
  <g class="leaf" style="--delay: 1s">
    <ellipse cx="140" cy="242" rx="15" ry="8"
      fill="rgba(40,100,50,0.6)" transform="rotate(-15,140,242)" />
  </g>

  <!-- Berries (small red circles) -->
  <circle cx="135" cy="75" r="4" fill="rgba(196,30,58,0.8)" class="berry" />
  <circle cx="148" cy="90" r="3" fill="rgba(196,30,58,0.7)" class="berry" />
  <circle cx="60" cy="155" r="4" fill="rgba(196,30,58,0.8)" class="berry" />
  <circle cx="50" cy="170" r="3" fill="rgba(196,30,58,0.7)" class="berry" />
</svg>

<style>
.vine-decoration {
  position: absolute;
  top: 0;
  width: 120px;
  height: auto;
  z-index: 10;
  pointer-events: none;
}

.leaf {
  animation: leaf-sway 5s ease-in-out infinite;
  animation-delay: var(--delay);
  transform-origin: center;
}

@keyframes leaf-sway {
  0%, 100% { transform: rotate(0deg); }
  50% { transform: rotate(3deg); }
}
</style>
```

---

## 3. Ornamental Frame (for hero character art)

```html
<svg viewBox="0 0 600 600" class="ornamental-frame" aria-hidden="true">
  <!-- Outer ring -->
  <circle cx="300" cy="300" r="280" fill="none"
    stroke="rgba(200,155,91,0.15)" stroke-width="1"
    class="ring-outer" />

  <!-- Inner ring (dashed) -->
  <circle cx="300" cy="300" r="260" fill="none"
    stroke="rgba(200,155,91,0.1)" stroke-width="0.5"
    stroke-dasharray="8,4" class="ring-inner" />

  <!-- Decorative notches at cardinal points -->
  <g class="notch" transform="translate(300,20)">
    <path d="M-8,0 L0,-12 L8,0" fill="none"
      stroke="rgba(200,155,91,0.2)" stroke-width="1" />
  </g>
  <g class="notch" transform="translate(300,580)">
    <path d="M-8,0 L0,12 L8,0" fill="none"
      stroke="rgba(200,155,91,0.2)" stroke-width="1" />
  </g>
  <g class="notch" transform="translate(20,300)">
    <path d="M0,-8 L-12,0 L0,8" fill="none"
      stroke="rgba(200,155,91,0.2)" stroke-width="1" />
  </g>
  <g class="notch" transform="translate(580,300)">
    <path d="M0,-8 L12,0 L0,8" fill="none"
      stroke="rgba(200,155,91,0.2)" stroke-width="1" />
  </g>

  <!-- Corner flourishes -->
  <path d="M80,80 Q120,80 120,120" fill="none"
    stroke="rgba(200,155,91,0.12)" stroke-width="1" />
  <path d="M520,80 Q480,80 480,120" fill="none"
    stroke="rgba(200,155,91,0.12)" stroke-width="1" />
  <path d="M80,520 Q120,520 120,480" fill="none"
    stroke="rgba(200,155,91,0.12)" stroke-width="1" />
  <path d="M520,520 Q480,520 480,480" fill="none"
    stroke="rgba(200,155,91,0.12)" stroke-width="1" />

  <!-- Radial tick marks (clock-like) -->
  <g class="ticks">
    <!-- Generate 36 ticks around the circle -->
    <line x1="300" y1="25" x2="300" y2="35"
      stroke="rgba(200,155,91,0.1)" stroke-width="0.5"
      transform="rotate(0,300,300)" />
    <line x1="300" y1="25" x2="300" y2="35"
      stroke="rgba(200,155,91,0.1)" stroke-width="0.5"
      transform="rotate(30,300,300)" />
    <line x1="300" y1="25" x2="300" y2="35"
      stroke="rgba(200,155,91,0.1)" stroke-width="0.5"
      transform="rotate(60,300,300)" />
    <!-- ... repeat every 30deg for 12 total -->
  </g>
</svg>

<style>
.ornamental-frame {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 500px;
  height: 500px;
  z-index: 5;
  pointer-events: none;
}

.ring-outer {
  animation: ring-spin-slow 90s linear infinite;
  transform-origin: center;
}

.ring-inner {
  animation: ring-spin-slow 60s linear infinite reverse;
  transform-origin: center;
}

@keyframes ring-spin-slow {
  to { transform: rotate(360deg); }
}
</style>
```

---

## 4. Sparkle/Star Particles

```html
<div class="sparkles" aria-hidden="true">
  <svg viewBox="0 0 20 20" class="sparkle" style="--x: 15%; --y: 30%; --delay: 0s; --size: 12px;">
    <path d="M10,0 L12,8 L20,10 L12,12 L10,20 L8,12 L0,10 L8,8 Z"
      fill="rgba(255,220,100,0.6)" />
  </svg>
  <svg viewBox="0 0 20 20" class="sparkle" style="--x: 45%; --y: 20%; --delay: 1.5s; --size: 8px;">
    <path d="M10,0 L12,8 L20,10 L12,12 L10,20 L8,12 L0,10 L8,8 Z"
      fill="rgba(255,220,100,0.4)" />
  </svg>
  <svg viewBox="0 0 20 20" class="sparkle" style="--x: 75%; --y: 40%; --delay: 0.8s; --size: 10px;">
    <path d="M10,0 L12,8 L20,10 L12,12 L10,20 L8,12 L0,10 L8,8 Z"
      fill="rgba(255,220,100,0.5)" />
  </svg>
</div>

<style>
.sparkles {
  position: absolute;
  inset: 0;
  pointer-events: none;
  z-index: 8;
}

.sparkle {
  position: absolute;
  left: var(--x);
  top: var(--y);
  width: var(--size);
  height: var(--size);
  animation: sparkle-twinkle 3s ease-in-out infinite;
  animation-delay: var(--delay);
}

@keyframes sparkle-twinkle {
  0%, 100% { opacity: 0; transform: scale(0.5) rotate(0deg); }
  50% { opacity: 1; transform: scale(1) rotate(45deg); }
}
</style>
```

---

## 5. Asset Creation Decision Tree

```
User wants decorative element:
│
├── Is it a SHAPE (geometric, abstract)?
│   └── Use CSS (border-radius, clip-path, gradients)
│       → See creative-effects-library.md Section 3
│
├── Is it an ILLUSTRATION (lantern, plant, frame, icon)?
│   └── Use INLINE SVG
│       → Build with path/circle/rect/ellipse
│       → Animate with CSS @keyframes
│       → Keep strokes thin (0.5-2px), fills low opacity (0.1-0.6)
│
├── Is it a TEXTURE (paper, noise, grain)?
│   └── Use CSS (gradients, background-image)
│       → See creative-effects-library.md Section 2
│
├── Is it a PHOTO/ARTWORK (character art, product shot)?
│   └── Use <img> or next/image
│       → Optimize with proper sizes/srcset
│       → Add atmospheric glow behind with radial-gradient
│
└── Is it ANIMATED?
    ├── Simple (sway, float, pulse) → CSS @keyframes
    ├── Scroll-linked → IntersectionObserver or useTransform
    ├── Complex (path-follow, physics) → Framer Motion or GSAP
    └── Interactive (cursor-follow, drag) → React state + transform
```

---

## 6. SVG Construction Rules

1. **ViewBox first** — always set `viewBox` before width/height
2. **Low opacity fills** — decorative elements at 0.1-0.6 opacity, never solid
3. **Thin strokes** — 0.5-2px for elegance, never thick
4. **aria-hidden="true"** — all decorative SVGs must be hidden from screen readers
5. **pointer-events: none** — decorative elements must not block clicks
6. **CSS variables for theming** — use `currentColor` or `var(--accent)` so SVGs respond to theme
7. **Transform-origin** — set explicitly for animations (especially rotation)
8. **Keep SVGs small** — under 50 lines of markup per asset. Complex illustrations should be in separate .svg files
9. **Reduced motion** — wrap all SVG animations in `@media (prefers-reduced-motion: no-preference)`

### Illustrated Scene Composition (hero landscapes, split sections)

When building an illustrated scene (not a decorative element, but a SCENE with characters/landscape):

**Minimum sizes on a 500-unit viewBox:**

| Element | Minimum size | Why |
|---|---|---|
| Character/person silhouette | 40-60px tall (8-12%) | Must be clearly visible, not a speck |
| Moon/sun (dramatic) | 80-150px diameter (16-30%) | Celestial bodies should DOMINATE the scene |
| Moon/sun (background) | 40-60px diameter (8-12%) | Still needs atmospheric glow |
| Trees | 120-200px tall (24-40%) | Major scene element |
| Ground hills | Fill bottom 15-25% of viewBox | Creates depth |
| Bench/furniture | 40-60px wide (8-12%) | Proportional to character |

**Glow effects (radialGradient):**
```html
<!-- WRONG: Glow radius same as object = no visible glow -->
<circle r="45" fill="url(#glow)" />  <!-- glow gradient r="50%" -->

<!-- RIGHT: Glow radius 2-3× object radius = dramatic atmospheric halo -->
<circle r="120" fill="url(#glow)" />  <!-- glow circle -->
<circle r="45" fill="#F0F0FF" />       <!-- solid object on top -->
```

- Glow circle radius = **2-3× the object radius**
- Inner stop: solid color at 0-20%
- Mid stop: accent color at 30-50%, opacity 0.2-0.4
- Outer stop: fully transparent at 100%

**Ground/hills:** Use gradient fills, NOT solid black:
```html
<!-- WRONG: Flat black silhouette = no depth -->
<path d="M..." fill="#000000" />

<!-- RIGHT: Purple gradient = depth + matches scene palette -->
<path d="M..." fill="#0D0B2E" />  <!-- slightly lighter than bg -->
<!-- Or use linearGradient from scene-mid to scene-dark -->
```

**Stars/particles minimum counts:**
- Small dots (r=1-2): minimum 12-15 per scene
- Medium sparkles (4-pointed): minimum 4-6 per scene  
- Large sparkles: 1-2 maximum (focal points)
- Mix 3 opacity levels: 0.4, 0.6, 0.8

**Organic tree branches:**
- Use at least 4-5 quadratic/cubic bezier control points per branch
- Branches should curve, not go straight
- Vary stroke width from trunk (thick) to tips (thin)
- ❌ Rectangular/geometric tree shapes
- ✅ Flowing organic bezier curves

---

## 7. Common SVG Primitives Cheat Sheet

| Shape | Element | Key attributes |
|---|---|---|
| Circle | `<circle>` | cx, cy, r |
| Oval | `<ellipse>` | cx, cy, rx, ry |
| Rectangle | `<rect>` | x, y, width, height, rx (rounded) |
| Line | `<line>` | x1, y1, x2, y2 |
| Curve | `<path>` | d="M Q C" (move, quadratic, cubic) |
| Polygon | `<polygon>` | points="x1,y1 x2,y2 ..." |
| Group | `<g>` | transform, class (group elements) |
| Gradient | `<linearGradient>` / `<radialGradient>` | Define in `<defs>`, reference with `url(#id)` |
| Filter | `<filter>` | Blur, glow: `<feGaussianBlur>` |

### Path Commands
- `M x,y` — Move to
- `L x,y` — Line to
- `Q cx,cy x,y` — Quadratic curve (1 control point)
- `C cx1,cy1 cx2,cy2 x,y` — Cubic curve (2 control points)
- `A rx,ry rot large-arc sweep x,y` — Arc
- `Z` — Close path

---

## 8. Barcode Element (horizontal + vertical)

### Horizontal barcode (spine/catalog style)
```html
<g class="barcode" aria-hidden="true">
  <rect x="0" y="0" width="1.5" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="3" y="0" width="1" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="5.5" y="0" width="2.5" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="10" y="0" width="0.8" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="12.5" y="0" width="3.5" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="18" y="0" width="1" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="20.5" y="0" width="2" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="24.5" y="0" width="4" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="30" y="0" width="0.8" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="32.5" y="0" width="1.5" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="35.5" y="0" width="3" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="40" y="0" width="0.8" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="42.5" y="0" width="3.5" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="48" y="0" width="2" height="22" fill="rgba(255,235,200,0.2)" />
  <!-- Label below -->
  <text x="0" y="32" font-family="monospace" font-size="6" letter-spacing="0.2em"
    fill="rgba(255,235,200,0.2)">GRR.ATIV</text>
</g>
```

### Vertical barcode (rotated — for poster/editorial use)
```html
<!-- Rotate the barcode group 90deg for vertical orientation -->
<g class="barcode-vertical" transform="translate(940, 860) rotate(90)" aria-hidden="true">
  <!-- Same rects as horizontal — rotation handles the direction -->
  <rect x="0" y="0" width="1.5" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="3" y="0" width="1" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="5.5" y="0" width="2.5" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="10" y="0" width="0.8" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="12.5" y="0" width="3.5" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="18" y="0" width="1" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="20.5" y="0" width="2" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="24.5" y="0" width="4" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="30" y="0" width="0.8" height="22" fill="rgba(255,235,200,0.2)" />
  <rect x="32.5" y="0" width="1.5" height="22" fill="rgba(255,235,200,0.2)" />
  <!-- Label (rotated back so text reads normally) -->
  <text x="0" y="-5" font-family="monospace" font-size="6" letter-spacing="0.2em"
    fill="rgba(255,235,200,0.2)" transform="rotate(-90) translate(-30, 0)">AWE</text>
</g>
```

**Rule:** Reference posters/editorial designs typically use VERTICAL barcodes. Default to vertical unless the user specifies horizontal.

---

## 9. SVG Text Sizing Guide

SVG text sizes work differently from CSS. When using a viewBox-based SVG overlay:

| ViewBox | font-size | Visual result | Good for |
|---|---|---|---|
| `0 0 1000 1000` | `120` | ~12% of poster width | Subheadings |
| `0 0 1000 1000` | `180` | ~18% of poster width | Large display text |
| `0 0 1000 1000` | `220` | ~22% of poster width | Dominant headline (fills width with ~7 chars) |
| `0 0 1000 1000` | `300` | ~30% of poster width | Massive single-word (4-5 chars) |

### Sizing formula
```
desired_percentage = font_size / viewBox_width × 100
```

For the word "BALANCE" (7 characters) to fill ~70% width:
- Each char ≈ 10% width → `font-size ≈ 160-200` on a 1000-unit viewBox
- With `letter-spacing: 0.15em`, add ~15% → `font-size ≈ 180`

### Common mistakes
- ❌ `font-size="124"` on 1000-unit viewBox = only 12.4% width. TOO SMALL for a poster headline.
- ✅ `font-size="200"` on 1000-unit viewBox = ~20% width. Each letter is 2-3% wide, 7 chars + spacing fills ~60-70%.

### Text warp with textPath
```html
<defs>
  <!-- Curve path: deeper Q control point = more curve -->
  <path id="warp-path" d="M 100,380 Q 500,300 900,380" />
</defs>
<text font-size="200" font-family="'Cinzel Decorative', serif"
  fill="rgba(255,245,230,0.88)" letter-spacing="0.12em">
  <textPath href="#warp-path" startOffset="50%" text-anchor="middle">BALANCE</textPath>
</text>
```

---

## 10. Image Asset Pipeline (Background Removal)

When a design needs a character/object placed over a custom background, the agent should:

### Decision tree
```
User provides/generates an image:
│
├── Image is already transparent PNG?
│   └── Use directly as <img> or background
│
├── Image needs background removed (character, product, object)?
│   └── Run rembg background removal (see below)
│       → Output: transparent PNG
│       → Place over custom CSS/SVG background
│
├── Image is background artwork (full scene)?
│   └── Use as-is with object-fit: cover
│       → Layer SVG/CSS overlays on top
│
└── Image generated by AI tool?
    ├── Needs the character only → run rembg after generation
    └── Full scene is fine → use as background directly
```

### Background removal with rembg

**Install (one-time):**
```bash
pip install "rembg[cli]"
```

**Remove background from a single image:**
```bash
rembg i input.png output.png
```

**Alpha matting for fine edges (hair, fur, translucent fabrics):**
```bash
rembg i -a input.png output.png
```

**Batch process a folder:**
```bash
rembg p ./input_folder/ ./output_folder/
```

### Workflow example
```bash
# 1. Agent generates character artwork via generate_image tool
#    → saved as character_raw.png

# 2. Remove background
rembg i character_raw.png character_transparent.png

# 3. Use in HTML
# <img src="character_transparent.png" class="hero-character" />
# Background is now a CSS gradient, SVG pattern, or separate scene image
```

### When to auto-remove background
- User says "place character over..." or "character on a custom background"
- Reference image shows a character/object composited over a designed background
- The design has layered z-planes where the character sits on z-20 over an atmospheric z-0
- User attaches a reference where the subject is clearly separate from the background

### When NOT to remove background
- The full scene IS the artwork (like the BALANCE poster background)
- User says "use the whole image" or "full scene"
- Image is a texture, pattern, or abstract that fills the viewport

### Alternative: Python script for batch + resize
```python
# save as scripts/prepare-assets.py
import subprocess, sys
from pathlib import Path

def prepare_asset(input_path, output_path, remove_bg=True, max_size=2048):
    """Remove bg and optionally resize an image asset."""
    if remove_bg:
        subprocess.run(["rembg", "i", "-a", str(input_path), str(output_path)], check=True)
    else:
        import shutil
        shutil.copy2(input_path, output_path)
    print(f"✓ {output_path.name} ready")

if __name__ == "__main__":
    inp = Path(sys.argv[1])
    out = Path(sys.argv[2]) if len(sys.argv) > 2 else inp.with_stem(inp.stem + "_nobg")
    prepare_asset(inp, out)
```

### IDE-specific notes
| IDE | How to run rembg |
|---|---|
| Cursor / Antigravity / Claude Code | Terminal: `rembg i input.png output.png` |
| Windsurf / Trae | Terminal (if shell access available) |
| No terminal access | Ask user to run the command manually, or use an online bg removal API |
