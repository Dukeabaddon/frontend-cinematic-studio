# Frontend Engineering Architecture

## File layout

```
src/
├── types.ts          # All interfaces
├── data.ts           # Static copy, tour days, lore
├── app/ or pages/    # Layout controller
└── components/
    ├── Hero.tsx
    ├── Timeline.tsx
    └── ...
```

**Never** put 500+ lines of data inside visual components.

## React guardrails

```tsx
// BAD: object in deps → loop
useEffect(() => { fetch(config); }, [config]);

// GOOD
useEffect(() => { fetch(config.id); }, [config.id]);
```

Always cleanup: `ResizeObserver`, timers, Lenis instance, audio.

## Edit discipline

1. Read file (or `gate_compress_file` if large)
2. Surgical change — preserve working sections
3. Lint / build
4. No `// ... rest of code`

## Images

- `next/image` with `sizes`, `priority` on LCP hero
- Lazy below fold with short fade-in optional

## State boundaries

| Scope | Tool |
|-------|------|
| UI toggle | `useState` |
| Section animation | Framer + `useInView` |
| Global scroll | Lenis provider in layout |

## Verification pipe

After substantive edits:

1. Read lints on touched files
2. `npm run build` or `tsc --noEmit`
3. Fix from compiler output — don't hand-wave
