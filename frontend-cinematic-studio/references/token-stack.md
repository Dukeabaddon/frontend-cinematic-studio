# Token Stack — Graphify + Gate-MCP

Use together. Graphify = **map** the repo. Gate = **compress** what you read.

**When skill is invoked:** follow [mandatory-preflight.md](mandatory-preflight.md) first — not optional on large repos only.

## Graphify

**Package:** `graphifyy` on PyPI. **CLI:** `python -m graphify` (Windows: never `/graphify .` — PowerShell treats `/` as path).

### When to use

| Situation | Action |
|-----------|--------|
| First time on repo / large codebase | `python -m graphify .` |
| "How does X connect to Y?" | `python -m graphify query "..."` |
| Need path between concepts | `python -m graphify path "A" "B"` |
| Explain one node | `python -m graphify explain "SymbolName"` |
| After big refactor | `python -m graphify . --update` or `--force` |
| Team shares map | Commit `graphify-out/` (exclude `manifest.json`, `cost.json` per upstream docs) |

### Outputs

```
graphify-out/
├── graph.json
├── GRAPH_REPORT.md
└── graph.html
```

Prefer **scoped queries** over reading full `GRAPH_REPORT.md` or grepping entire tree.

### Cursor install

```powershell
python -m graphify cursor install
```

Creates `.cursor/rules/graphify.mdc` — query-first guidance.

### Token savings

Architecture and dependency questions without loading thousands of file tokens into context.

---

## Gate-MCP

**Local:** `tools/Gate-MCP` in this repo. **MCP:** `gatemcp` in `.cursor/mcp.json`.

### Session start (once)

```
gate_init
```

Confirms `graphify-out` path, cache DB, project root.

### When to use

| Situation | Tool | Skip when |
|-----------|------|-----------|
| Read large `.ts/.tsx/.py` | `gate_compress_file` depth `signature` | File &lt; ~80 lines and you need exact text |
| YAML / MD / config | `gate_compress_file` depth `structure` | — |
| Dependencies / symbol graph | `gate_graph_query` | User gave exact line |
| Graphify report exists | `queryType: graphify_map` or `graphify_search` | — |
| Huge JSON from tools | `gate_clean_response` (TOON) | Tiny payload |
| Screenshot for code | `gate_optimize_image` (OCR) | Pixel-perfect visual QA |
| Re-read same file | dedup (automatic) | — |

### Recommended order

```
gate_init
→ graphify map (if graphify-out exists)
→ gate_graph_query / graphify query
→ gate_compress_file
→ surgical edit
→ gate_clean_response on bulky JSON
```

### When NOT to use Gate

- Implementing pixel-perfect hero z-index from reference
- Copy-pasting user-provided snippet verbatim
- Final CSS polish on one small file

Use normal **Read** for those.

### Honest metrics

If Gate returns `expanded: true`, compressed output was larger — use raw read.

---

## Caveman + tools

Caveman shortens **agent narration**. Tools (Graphify, Gate) shorten **context input**. Both stack.

After tools: **User brief** in plain English for the human.
