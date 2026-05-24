---
name: "Creative Portfolio — Editorial Style"
theme: "light"
colors:
  background: "#F5F0E8"
  surface: "#FFFDF7"
  text-primary: "#2C2417"
  text-muted: "rgba(44, 36, 23, 0.5)"
  accent: "#8B5E3C"
  accent-hover: "#A0704D"
typography:
  display:
    family: "Cormorant Garamond"
    size: "clamp(2.5rem, 5vw, 5rem)"
    weight: 600
    tracking: "-0.03em"
  body:
    family: "Outfit"
    size: "1.05rem"
    weight: 400
    leading: 1.8
  meta:
    family: "IBM Plex Mono"
    size: "0.7rem"
    weight: 500
    tracking: "0.2em"
    transform: "uppercase"
spacing:
  section-padding: "120px"
  container-max: "1100px"
  element-gap: "32px"
effects:
  texture: "paper"
  texture-opacity: 0.06
  ambient: "none"
  section-transitions: "curve"
  scroll-reveal: true
  scroll-reveal-duration: "0.8s"
  scroll-reveal-easing: "cubic-bezier(0.16, 1, 0.3, 1)"
hero:
  layout: "centered-statement"
  focal-point: "monumental serif headline, centered"
  illustration-method: "none"
---

# Design Decisions

## Hero
Pure typographic impact. No illustration — the name IS the design. Massive serif
headline (Cormorant Garamond) centered on a warm parchment background. Below: a
single-line role description in meta type (IBM Plex Mono, tracked, uppercase).

Eye flow: name → role → scroll indicator.

The warmth comes from the paper texture (repeating linear-gradient fiber pattern at
6% opacity) and the tinted background (#F5F0E8, not raw white).

## Section 2 — Selected Works
Asymmetric grid of project thumbnails. Alternate between:
- Full-width landscape image (16:9)
- Two side-by-side images (different heights for visual rhythm)

Each project: title in display type + meta tag (year, category). Hover: image
scales to 1.02 with 400ms ease, subtle warm shadow appears.

## Section 3 — About
Split layout: photo (left, 45%), text (right, 55%). Photo slightly rotated (2deg)
for editorial feel. Text: short bio in body type, followed by skills list in
meta type. Background shifts to surface color (#FFFDF7) for contrast.

## Section 4 — Contact
Centered. Large display text: "Let's work together." Below: email link
styled as accent-colored text with underline animation on hover. Social links
in a horizontal row, meta type, wide-tracked.

## Footer
Minimal. Single line: "© 2025 [Name]" centered, meta type. Top border: subtle
warm rule (accent color at 0.15 opacity).

## Banned
- No dark mode (this is intentionally warm and light)
- No glass/blur effects (doesn't match editorial aesthetic)
- No card borders or shadows (use spacing and typography for hierarchy)
- No animations on images (only hover scale)
