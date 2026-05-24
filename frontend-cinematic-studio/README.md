# Frontend Cinematic Studio v4

An AI skill that teaches coding agents to build award-quality frontend experiences instead of generic AI slop.

## How It Works

1. **You describe what you want** (or attach a reference image)
2. **The agent generates a `DESIGN.md`** with exact color tokens, fonts, spacing, and layout decisions
3. **You approve or adjust** the design tokens
4. **The agent builds** using those exact tokens — section by section, verified after each

## What Changed in v4

Previous versions (v1-v3) had **39 files and 46,000 tokens of instructions**. Agents couldn't process it all, so they ignored most rules and produced generic output.

v4 is **one file, ~200 lines, 5 rules.** That's it.

| Version | Files | Lines | Test results |
|---|---|---|---|
| v3.2 | 39 files | ~4,500 | 4 tests, all failed |
| **v4.0** | **4 files** | **~200** | — |

### The 5 Rules

1. **Generate DESIGN.md first** — exact tokens, not vibes
2. **Never hand-draw complex SVG** — use AI images or CSS abstract
3. **Icons from library** — Lucide React, not hand-drawn
4. **Verify build** — `npm run dev` after each section
5. **Hero = full width** — illustration is background, not a box

## Install

```powershell
# Clone
git clone https://github.com/Dukeabaddon/frontend-cinematic-studio.git

# Install to your IDE
.\install.ps1 -IDE cursor    # or: antigravity, claude, windsurf, trae, copilot
```

## File Structure

```
frontend-cinematic-studio/
├── SKILL.md                    ← The skill (200 lines — the ONLY file agents read)
├── examples/
│   ├── space-astronomy.md      ← Example DESIGN.md for dark space theme
│   └── editorial-portfolio.md  ← Example DESIGN.md for light editorial theme
├── install.ps1                 ← IDE installer script
└── README.md                   ← This file
```

## Usage

After installing, invoke the skill in your IDE chat:

```
/frontend-cinematic-studio

Build me a landing page for an astronomy club. Dark theme, cosmic feel.
[attach reference image if you have one]
```

The agent will:
1. Analyze your request (and reference image if provided)
2. Generate a `DESIGN.md` with exact tokens
3. Wait for your approval
4. Build section by section using those tokens

## Example DESIGN.md Output

```yaml
---
name: "Astronomy Club Landing"
theme: "dark"
colors:
  background: "#0B0D2E"
  accent: "#64B5F6"
typography:
  display: { family: "Playfair Display", size: "clamp(2.5rem, 5vw, 4rem)" }
effects:
  ambient: "starfield-40"
  texture: "grain"
hero:
  layout: "full-landscape"
  illustration-method: "ai-image"
---
```

## Philosophy

> The previous 4 rewrites failed because each one made the same mistake:
> **adding more wisdom instead of adding more precision.**
>
> v4 adds precision. Exact hex codes. Exact font names. 5 concrete rules.
> No philosophy essays. No 600-line CSS pattern libraries.

## License

MIT
