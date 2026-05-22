# Award Bar Checklist

Before calling a cinematic site "done".

## Art direction

- [ ] Custom palette — no default purple-blue gradient hero
- [ ] Aesthetic tuple documented
- [ ] One clear focal anchor per hero viewport
- [ ] Section pacing feels editorial (not equal card grid)
- [ ] At least one atmospheric transition (mist dissolve or color journey)

## Hero

- [ ] Z-layering correct (type behind landscape if spec requires)
- [ ] Parallax linear, anchor figure stable
- [ ] LCP image optimized (`next/image` or equivalent)

## Motion

- [ ] Timeline or key sequence uses staggered reveal
- [ ] No spring on scroll-linked transforms
- [ ] `prefers-reduced-motion` handled
- [ ] Lenis does not break mobile (`smoothTouch: false` or disabled)

## Craft

- [ ] No fake telemetry / status chrome
- [ ] Glass only where functional
- [ ] Typography tracking on display + meta
- [ ] No placeholder comments in shipped code

## Technical

- [ ] Build passes
- [ ] No linter errors on touched files
- [ ] Modular file structure (not monolithic App)

## Token hygiene (dev process)

- [ ] Graphify used for exploration on large repo
- [ ] Gate used for large file reads where applicable
