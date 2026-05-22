# Prompt Interpretation Engine

Map vague art-direction phrases to concrete systems.

| User says | Palette | Materials | Motion | Composition |
|-----------|---------|-----------|--------|-------------|
| more atmospheric | Muted midtones, lower saturation | Fog layers, grain, vignette | Slower reveals, environmental drift | More z-10 layers |
| more cinematic | High contrast chapters, black acts | Strong gradients between acts | Linear parallax, longer durations | Full-bleed scenes, hairline titles |
| less digital | Warm ivory, paper textures | Parchment, reduce pure #fff | Reduce snappy springs | Scrapbook rotation on photos |
| more tactile | Physical shadows, rim light | Stack borders, subtle 3D shadow | Hover lift 4–6px | Card overlap, polaroid frames |
| more editorial | Serif display + mono meta | Hairline rules edge-to-edge | Stagger timeline 200ms | Asymmetric two-column |
| more handcrafted | Imperfect rotation, custom palette | Grain, avoid perfect grids | Restrained count | Asymmetry, polaroid clusters |
| more immersive | Dark base acts, environmental bg | Mist dissolves between sections | Scroll-linked story | Fewer UI chrome elements |
| less generic | Ban purple-blue gradient | Custom tuple required | Remove random motion | Reject 3-col equal cards |
| premium anime aesthetic | Forest gothic or neon alley palette | Layered silhouettes, spores/fog | Soft stagger, not bouncy | Figure anchor + monumental type |
| collector artbook | Cream/charcoal, accent metal | Page texture, caption mono | Page-turn stagger | Dense caption + wide hero |

## Process

1. Identify adjectives in user message
2. Update aesthetic tuple fields
3. List **goals** reflecting changes (not task list yet)
4. Name anti-patterns to remove in current code
