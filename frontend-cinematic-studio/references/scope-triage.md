# Scope Triage

Classify before architecture.

## Simple / singular

**Examples:** calculator, clock, bio card, single hero experiment.

| Constraint | Rule |
|------------|------|
| Layout | Single view, no sidebar router |
| State | `useState`, optional `localStorage` |
| Backend | None unless asked |
| Motion | Light — one reveal sequence max |

## Complex / multi-module

**Examples:** tour booking site, lore portal, portfolio with chapters.

| Constraint | Rule |
|------------|------|
| Layout | Sectioned scroll story, persistent header |
| State | Section-scoped + URL hash optional |
| Files | `types.ts`, `data.ts`, `components/*` |
| Motion | Full system — motion.md |

## Decision

Ask only if unclear:

1. How many distinct **sections** in the story?
2. Real backend/auth/payments needed?
3. Reference image or mood only?

Default complex for "landing page / award site" requests.
