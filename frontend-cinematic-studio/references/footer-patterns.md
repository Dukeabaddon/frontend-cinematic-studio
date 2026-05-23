# Footer Pattern Library

Four cinematic footer archetypes. Every full-page build MUST include one.

---

## 1. Reveal Footer

Footer slides up from behind the main content as user scrolls past the last section.

```css
/* Main content sits above footer with z-index */
.main-content {
  position: relative;
  z-index: 2;
  background: var(--page-bg);
}

.footer-reveal {
  position: sticky;
  bottom: 0;
  z-index: 1;
  min-height: 60vh;
}
```

**When to use:** Dark/dramatic sites. Creates cinematic "curtain lift" effect.
**Example mood:** Deep charcoal footer revealed behind ivory content.

---

## 2. Typographic Footer

Giant display text (company name or tagline) as the visual anchor. Minimal supporting info.

```html
<footer class="relative py-24 px-[5vw] overflow-hidden">
  <!-- Giant display text -->
  <h2 class="font-display text-[15vw] leading-[0.85] tracking-[-0.04em]
    text-transparent bg-clip-text bg-gradient-to-b from-white/20 to-white/5">
    BRAND
  </h2>

  <!-- Minimal info row -->
  <div class="flex justify-between mt-12 text-xs tracking-[0.3em] uppercase text-white/40">
    <span>© 2025</span>
    <div class="flex gap-8">
      <a href="#">Twitter</a>
      <a href="#">GitHub</a>
    </div>
    <span>All rights reserved</span>
  </div>
</footer>
```

**When to use:** Portfolio, agency, editorial. Makes the brand name the final visual memory.
**Anti-slop:** No icon grids, no multi-column link dumps.

---

## 3. Editorial Footer

Three-column layout with hairline rule, refined typography. Think Kinfolk / Cereal magazine.

```html
<footer class="border-t border-white/[0.08] mt-24">
  <div class="grid grid-cols-[1fr_2fr_1fr] gap-8 px-[5vw] py-16">
    <!-- Left: Brand -->
    <div>
      <span class="font-mono text-[9px] tracking-[0.3em] uppercase text-white/40">
        Studio Name
      </span>
      <p class="text-sm text-white/60 mt-4 leading-relaxed max-w-[20ch]">
        Brief philosophy or mission statement in editorial voice.
      </p>
    </div>

    <!-- Center: Navigation -->
    <nav class="flex gap-12 justify-center">
      <div>
        <span class="font-mono text-[9px] tracking-[0.3em] uppercase text-white/40 mb-4 block">
          Navigate
        </span>
        <ul class="space-y-2 text-sm text-white/60">
          <li><a href="#" class="hover:text-white transition-colors">Work</a></li>
          <li><a href="#" class="hover:text-white transition-colors">About</a></li>
          <li><a href="#" class="hover:text-white transition-colors">Contact</a></li>
        </ul>
      </div>
      <div>
        <span class="font-mono text-[9px] tracking-[0.3em] uppercase text-white/40 mb-4 block">
          Connect
        </span>
        <ul class="space-y-2 text-sm text-white/60">
          <li><a href="#">Twitter</a></li>
          <li><a href="#">Dribbble</a></li>
          <li><a href="#">GitHub</a></li>
        </ul>
      </div>
    </nav>

    <!-- Right: Newsletter or CTA -->
    <div class="flex flex-col items-end">
      <span class="font-mono text-[9px] tracking-[0.3em] uppercase text-white/40 mb-4">
        Newsletter
      </span>
      <div class="liquid-glass rounded-lg px-4 py-2 flex gap-2">
        <input type="email" placeholder="your@email.com"
          class="bg-transparent text-sm text-white/80 outline-none w-40" />
        <button class="text-xs tracking-[0.2em] uppercase text-white/60 hover:text-white">
          Join
        </button>
      </div>
    </div>
  </div>

  <!-- Bottom bar -->
  <div class="border-t border-white/[0.04] px-[5vw] py-4 flex justify-between
    text-[10px] tracking-[0.2em] uppercase text-white/30">
    <span>© 2025 Studio Name</span>
    <span>Crafted with care</span>
  </div>
</footer>
```

**When to use:** Content-heavy sites, editorial magazines, studio portfolios.
**Key detail:** Hairline borders, never thick dividers. Mono meta labels above each column.

---

## 4. Minimal Footer

Single line or two lines. Maximum restraint. Let the content above do the talking.

```html
<footer class="px-[5vw] py-8 flex items-center justify-between
  text-[10px] tracking-[0.3em] uppercase text-white/30">
  <span>Studio Name</span>
  <div class="flex gap-6">
    <a href="#" class="hover:text-white/60 transition-colors">Work</a>
    <a href="#" class="hover:text-white/60 transition-colors">About</a>
    <a href="#" class="hover:text-white/60 transition-colors">Contact</a>
  </div>
  <span>© 2025</span>
</footer>
```

**When to use:** Single-page portfolios, landing pages, product pages where the CTA section above is the real closer.

---

## Selection Guide

| Page type | Recommended footer | Why |
|---|---|---|
| Portfolio / Agency | Typographic | Brand name as final impression |
| Editorial / Magazine | Editorial | Structured, invites exploration |
| Landing / Product | Minimal | Don't distract from CTA |
| Dark cinematic / Gaming | Reveal | Dramatic pacing, cinematic ending |
| Multi-section complex | Editorial or Reveal | Enough content to justify structure |

---

## Anti-Slop Footer Rules

- ❌ No giant 4-column link dumps (that's a sitemap, not a footer)
- ❌ No social icon rainbow grids
- ❌ No "Back to top" buttons floating in random positions
- ❌ No footer widgets / recent posts / tag clouds
- ✅ Hairline borders, not thick dividers
- ✅ Mono meta labels for section headers
- ✅ Maximum 3 columns
- ✅ Generous padding (py-16+ for editorial, py-8 for minimal)
