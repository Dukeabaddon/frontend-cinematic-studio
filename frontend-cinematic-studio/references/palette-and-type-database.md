# Palette & Typography Database

Auto-suggest reference for Dialectic Round 2. Agent should propose palette + fonts from this database based on the user's mood/industry.

---

## Industry Palettes

### Creative / Portfolio / Art
| Name | Base | Accent | Text | Mood |
|---|---|---|---|---|
| Editorial Ivory | #F5F0E8 | #C41E3A (vermillion) | #2C2C2C | Warm, archival, Japanese art |
| Darkroom Brass | #1a1a1a | #C89B5B (brass) | #FAF8F5 | Studio, luxury, editorial |
| Gallery White | #FAFAF9 | #18181B (inverse) | #404040 | Minimalist, let-work-speak |
| Ink & Paper | #FDF8F0 | #2C1810 (espresso) | #2C1810 | Literary, Kinfolk, magazine |

### SaaS / Tech / AI
| Name | Base | Accent | Text | Mood |
|---|---|---|---|---|
| Obsidian Zinc | #09090B | #34D399 (emerald) | #FAFAFA | Linear, Vercel, precision |
| Deep Space | #0D1117 | #58A6FF (focus blue) | #E6EDF3 | GitHub, developer, focused |
| Midnight Indigo | #0F0F23 | #818CF8 (soft indigo) | #E2E8F0 | AI, premium, reflective |
| Carbon Steel | #111111 | #FFFFFF (pure contrast) | #888888 | Raycast, stark, monochrome |

### Gaming / Anime / Fantasy
| Name | Base | Accent | Text | Mood |
|---|---|---|---|---|
| Deep Sea Gothic | #0D1117 | #00D4AA (bioluminescent) | #C8D6E5 | Monster Hunter, oceanic |
| Ember Forge | #1A0A0A | #FF6B35 (molten) | #E8D5C4 | Dark Souls, volcanic |
| Sakura Archive | #F5F0E8 | #D4466B (soft pink) | #3C3C3C | Anime, light, archival |
| Cathedral Black | #0A0A0A | #D4AF37 (gold) | #B8B8B8 | Gothic, ornate, sacred |

### Agency / Studio
| Name | Base | Accent | Text | Mood |
|---|---|---|---|---|
| Liquid Obsidian | #0A0A0F | #F59E0B (amber) | #FAFAF9 | Glass, cinematic, depth |
| Warm Studio | #FAF8F5 | #FF4500 (vivid orange) | #1a1a1a | Bold, energetic, creative |
| Frost & Stone | #F0F0F0 | #2563EB (electric blue) | #171717 | Clean, professional, Nordic |

### E-commerce / Product
| Name | Base | Accent | Text | Mood |
|---|---|---|---|---|
| Luxury Noir | #0C0C0C | #B8860B (dark gold) | #D4D4D4 | Premium, watches, fashion |
| Clean Commerce | #FFFFFF | #16A34A (fresh green) | #171717 | Organic, health, nature |
| Warm Retail | #FEF7ED | #EA580C (warm orange) | #292524 | Artisan, craft, handmade |

---

## Font Pairings

### Serif + Sans (Editorial)
| Display | Body | Meta | Mood | Import |
|---|---|---|---|---|
| Cormorant Garamond | Inter | JetBrains Mono | Literary, elegant | `family=Cormorant+Garamond:wght@400;600;700&family=Inter:wght@400;500;600` |
| Playfair Display | Inter | IBM Plex Mono | Magazine, bold | `family=Playfair+Display:wght@400;700;900&family=Inter:wght@400;500` |
| Cinzel | Outfit | Space Mono | Gothic, monumental | `family=Cinzel:wght@400;700&family=Outfit:wght@300;400;500` |
| DM Serif Display | DM Sans | DM Mono | Modern editorial | `family=DM+Serif+Display&family=DM+Sans:wght@400;500;700` |

### Sans Only (Tech / SaaS)
| Display | Body | Meta | Mood | Import |
|---|---|---|---|---|
| Inter | Inter | JetBrains Mono | Universal, clean | `family=Inter:wght@300;400;500;600;700` |
| Outfit | Inter | Fira Code | Modern, geometric | `family=Outfit:wght@300;400;500;600;700&family=Inter:wght@400;500` |
| Space Grotesk | Inter | Space Mono | Tech, futuristic | `family=Space+Grotesk:wght@400;500;600;700&family=Inter:wght@400;500` |
| Satoshi | Inter | JetBrains Mono | Premium SaaS | Custom: `@import url('https://api.fontshare.com/v2/css?f[]=satoshi@400,500,700&display=swap')` |

### Display + Decorative (Creative / Gaming)
| Display | Body | Meta | Mood | Import |
|---|---|---|---|---|
| Bebas Neue | Inter | JetBrains Mono | Bold, impact | `family=Bebas+Neue&family=Inter:wght@400;500` |
| Righteous | Outfit | Space Mono | Retro-modern | `family=Righteous&family=Outfit:wght@300;400;500` |
| Orbitron | Inter | Fira Code | Sci-fi, gaming | `family=Orbitron:wght@400;700;900&family=Inter:wght@400;500` |

---

## UI Component Styles

### Glass (liquid, transparent, depth)
```css
.liquid-glass {
  background: rgba(0, 0, 0, 0.4);
  backdrop-filter: blur(4px);
  box-shadow: inset 0 1px 1px rgba(255,255,255,0.1);
}
```
**When:** Dark sites with video/image backgrounds. Nav, forms, CTAs only.

### Editorial (hairline, structured, typographic)
```css
.editorial-card {
  border: 1px solid rgba(0,0,0,0.08);
  padding: 2rem;
  background: transparent;
}
```
**When:** Light/ivory sites, magazine layouts, portfolios.

### Atmospheric (layered, depth, ambient)
```css
.atmospheric-card {
  background: linear-gradient(to bottom, rgba(255,255,255,0.04), transparent);
  border: 1px solid rgba(255,255,255,0.06);
  box-shadow: 0 30px 60px -15px rgba(0,0,0,0.8);
}
```
**When:** Dark cinematic sites, gaming, fantasy.

---

## Auto-Suggest Logic

During Dialectic Round 2, the agent should:

1. **Match mood to palette:** User says "warm, archival" → suggest Editorial Ivory or Ink & Paper
2. **Match industry to palette:** User building SaaS → suggest Obsidian Zinc or Deep Space  
3. **Match palette to fonts:** Dark palettes → sans-only pairing. Light palettes → serif+sans pairing.
4. **Match mood to component style:** "Glass" mood → Glass style. "Editorial" mood → Editorial style.
5. **Always propose 2 options** and let user pick.

### Example Auto-Suggest
```markdown
## Visual System Proposal

Based on your brief ("anime art portfolio, warm, archival feel"):

### Option A: Editorial Ivory
- Palette: #F5F0E8 base, #C41E3A vermillion accent, #2C2C2C text
- Fonts: Cormorant Garamond (display) + Inter (body) + JetBrains Mono (meta)
- Style: Editorial cards with hairline borders

### Option B: Sakura Archive  
- Palette: #F5F0E8 base, #D4466B soft pink accent, #3C3C3C text
- Fonts: Cinzel (display) + Outfit (body) + Space Mono (meta)
- Style: Atmospheric cards with warm shadows

Which direction? Or mix elements from both?
```
