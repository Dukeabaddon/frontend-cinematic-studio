---
name: "SPACED — Astronomy Landing Page"
theme: "dark"
colors:
  background: "#0B0D2E"
  surface: "#141837"
  text-primary: "#F0ECE5"
  text-muted: "rgba(240, 236, 229, 0.5)"
  accent: "#64B5F6"
  accent-hover: "#90CAF9"
  accent-warm: "#D4A574"
typography:
  display:
    family: "Playfair Display"
    size: "clamp(2.5rem, 5vw, 4.5rem)"
    weight: 700
    tracking: "-0.02em"
    style: "italic"
  body:
    family: "Inter"
    size: "1rem"
    weight: 400
    leading: 1.7
  meta:
    family: "JetBrains Mono"
    size: "0.7rem"
    weight: 500
    tracking: "0.25em"
    transform: "uppercase"
spacing:
  section-padding: "100px"
  container-max: "1200px"
  element-gap: "24px"
effects:
  texture: "grain"
  texture-opacity: 0.03
  ambient: "starfield-50"
  section-transitions: "gradient-dissolve"
  scroll-reveal: true
  scroll-reveal-duration: "0.7s"
  scroll-reveal-easing: "cubic-bezier(0.16, 1, 0.3, 1)"
hero:
  layout: "full-landscape"
  focal-point: "moon with atmospheric glow, upper-right area, ~25% viewport width"
  illustration-method: "ai-image"
  ground: "rolling hills silhouette covering full viewport width, dark gradient"
---

# Design Decisions

## Hero
The hero says "look up at the night sky" in 2 seconds. The moon is the focal point —
large (25% viewport), glowing with a radial gradient halo. A person sits on a bench
under a tree, establishing human scale against the cosmic backdrop.

Eye flow: moon → "Beyond The Naked Eye" headline → CTA buttons → ground silhouette.

The ground MUST span the full viewport width. It's a CSS gradient silhouette (clip-path
or gradient), not inside a small SVG box. The person/tree/bench scene is an AI-generated
image with transparent background, layered over the gradient sky.

Stars: 50 small dots (CSS absolute-positioned divs) scattered across the sky, with
random twinkle animation (opacity pulse, 3-8s duration, staggered delays). Stars are
SPARSER near the moon (washed out by moonlight) and DENSER in the corners.

## Section 2 — Partner Logos
Simple horizontal row of brand logos. Muted white opacity (0.4). No background change.
Serves as social proof before the content sections.

## Section 3 — Features Grid (6 items)
"Experience the Extraordinary" — 2×3 grid with asymmetric sizing.
Icons: Lucide React (Telescope, Eye, Star, Compass, Sun, BookOpen).
Each feature card: subtle border (rgba white 0.06), no background blur.
Staggered scroll reveal (100ms delay between cards).

## Section 4 — "See More" / Discovery
Split layout: left side has circular frame with moon/lantern illustration (AI-generated
image), right side has descriptive text. Background: slightly lighter surface color to
create section contrast. Floating sparkle particles (CSS).

## Section 5 — Mobile/Portal Section
Central doorway/portal element with volumetric light rays (CSS conic-gradient).
Person silhouette walking into the light (AI-generated image, small, centered).
Light rays emanate outward using conic-gradient at low opacity.

## Footer
Minimal 4-column: brand, navigation links, social links, legal.
Dark background matching hero. Subtle top border (rgba white 0.06).

## Banned
- No purple-to-blue default gradients (use the deep navy to indigo from palette)
- No centered 3-column equal card grids (use asymmetric sizing)
- No hand-drawn SVG trees, people, or landscapes (use AI images)
- No raw #fff or #000
- No bounce animations
