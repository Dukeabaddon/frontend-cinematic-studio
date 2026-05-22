# Anti-Pattern Detection

Reject or refactor on sight. Explain **why** and offer corrected direction.

## Visual slop

| Anti-pattern | Why it fails | Fix |
|--------------|--------------|-----|
| `from-purple-600 to-blue-500` hero | Instant AI tell | Custom palette from aesthetic tuple |
| `grid-cols-3 gap-6` card dump | No hierarchy | Bento or asymmetric editorial grid |
| Glass on every card | Blur fatigue | Glass only on forms/docks with real blur+fill |
| `shadow-md` only depth | Flat | Layer z-stack + atmospheric shadows |
| Oversized type, no tracking | Immature | Tracking law — visual-language.md |
| Fake `STATUS: ONLINE` | Tech-larping | Remove or real function |
| Random animations | No focus | Motion only on hierarchy nodes |

## Motion slop

| Anti-pattern | Fix |
|--------------|-----|
| Spring on scroll parallax | Linear `useTransform` |
| All sections animate at once | Staggered `useInView` |
| Lenis + heavy parallax on mobile | `smoothTouch: false`, reduce motion |

## Code slop

| Anti-pattern | Fix |
|--------------|-----|
| `// ... rest unchanged` | Full file or surgical diff |
| 1500-line App.tsx | Split types, data, components |
| Objects in `useEffect` deps | Primitive deps |
| Inline SVG icons for UI chrome | `lucide-react` |

## Glassmorphism exception (from samples)

Allowed when:

- `backdrop-blur` + semi-transparent background + border
- Real function (booking form, sticky dock)

Banned when:

- Decorative blur with no readability purpose

## Correction workflow

1. Name the anti-pattern
2. State emotional/visual consequence
3. Point to reference section (materials, motion, composition)
4. Apply minimal surgical fix
