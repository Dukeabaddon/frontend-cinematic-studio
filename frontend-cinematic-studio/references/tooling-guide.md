# Tooling Guide (Preflight + Graphify + Gate-MCP)

Use together. Graphify = **map** the repo. Gate = **compress** what you read.

---

## Session Preflight (run first)

When `/frontend-cinematic-studio` is invoked — **before** goals or code.

### User brief rule (accessibility)

Talk to the user in **short plain English** — max **3 bullets**, one sentence each.  
No long tables or essays unless they ask "explain more".  
Technical detail → `references/tooling-guide.md` or README.

### Step 0 — Bootstrap tooling (shell)

**MUST run** from project root (website repo or skill repo):

```powershell
.\scripts\bootstrap-tooling.ps1
```

If script missing (skill-only copy), run equivalent:

```powershell
pip install graphifyy -q
python -m graphify --version
# Gate: see install.ps1 or npx @gatemcp/cli in .cursor/mcp.json
```

#### Scan — use what already exists

| Path | Action |
|------|--------|
| `graphify-out/graph.json` | **Reuse** — query with `python -m graphify query "..."` |
| `.understand-anything/knowledge-graph.json` | **Reuse** — prefer `/understand-chat` or graph queries; do not rebuild Graphify unless user asks |
| No graph + `package.json` or 10+ code files | **Build:** `python -m graphify .` |
| `.gate-mcp/cache.db` | Gate was used before — still call `gate_init` |
| `.cursor/mcp.json` missing | Copy from `.cursor/mcp.json.example`; set `GATE_PROJECT_ROOT` to project absolute path; tell user to restart Cursor |

#### Install if missing

| Missing | Install |
|---------|---------|
| `python -m graphify` fails | `pip install graphifyy` then retry |
| No Gate build | Clone `tools/Gate-MCP`, `npm install --legacy-peer-deps`, `npm run build` OR use `npx -y @gatemcp/cli` in mcp.json |
| Graphify Cursor rule missing | `python -m graphify cursor install` |

Do not skip install because "maybe optional" — **attempt install once**, then report result in Preflight.

### Step 1 — Post Preflight (brief, for user)

```markdown
## Preflight
- Graphify: [ready + graph path | installed + built graph | skip + why]
- Gate: [gate_init OK | MCP offline — restart Cursor]
- Next: aesthetic tuple → goals
```

### Definition of done

- [ ] Bootstrap ran (install or detect documented)  
- [ ] Brief Preflight shown (≤5 lines for user)  
- [ ] `gate_init` called OR MCP offline warned  
- [ ] Graph exists or built or skip reason stated  
- [ ] Gate used for code reads when MCP online  

---

## Graphify — Project Map

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

### vs Understand-Anything

[Understand-Anything](https://github.com/Lum1104/Understand-Anything) = big dashboard + `/understand` plugin (17k★).  
Graphify = lighter graph + `graphify query`.  
This skill uses **Graphify + Gate** by default. If you install Understand-Anything, agent may use `.understand-anything/knowledge-graph.json` instead of `graphify-out/`.

---

## Gate-MCP — Token Compression

Gate shrinks file reads before they hit the AI. **Smaller file previews → same understanding → fewer tokens.**

**Local:** `tools/Gate-MCP` in this repo. **MCP:** `gatemcp` in `.cursor/mcp.json`.

### Session start (once)

```
gate_init
```

Confirms `graphify-out` path, cache DB, project root.

### Gate tools at a glance

| Tool | Use in one sentence |
|------|---------------------|
| `gate_init` | Start Gate for this folder |
| `gate_compress_file` | Read code as short outline, not full file |
| `gate_graph_query` | "What links to X?" without opening every file |
| `gate_clean_response` | Shrink fat JSON replies |
| `gate_optimize_image` | OCR from screenshots for code |

### When to use

| Situation | Tool | Skip when |
|-----------|------|-----------|
| Read large `.ts/.tsx/.py` | `gate_compress_file` depth `signature` | File < ~80 lines and you need exact text |
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

### Mandatory Gate usage during session

1. **First MCP call:** `gate_init`  
2. **Every code read** on `.ts/.tsx/.js/.jsx/.py/.go/.rs` → `gate_compress_file` (`signature`) — **default, not optional**  
3. Only skip Gate Read for: file < 40 lines AND you will edit 100% of it  
4. Config/markdown > 60 lines → `structure`  
5. "What connects X?" → `gate_graph_query` or `graphify_map` / graphify query  
6. Fat JSON → `gate_clean_response`  

### If `gate_*` not in tool list

- Tell user in **one sentence:** "Gate MCP offline — restart Cursor after install.ps1."  
- Do not fake Gate usage  
- Still run Graphify via shell  

### If MCP is red (user troubleshooting)

1. Restart Cursor  
2. Open project folder (website repo, not skill repo only)  
3. Confirm `.cursor/mcp.json` exists  
4. Ask agent: "run gate_init"  

### vs Graphify

| | Graphify | Gate |
|---|----------|------|
| **Job** | Map whole project | Shrink each read |
| **Run** | `python -m graphify .` once | MCP every session |
| **Output** | `graphify-out/` | compressed text in chat |

Use **both**. Graphify first, Gate on every read.

---

## Caveman Mode

Caveman shortens **agent narration**. Tools (Graphify, Gate) shorten **context input**. Both stack.

Between tools: 3–6 words ("Me gate_init." "Me graphify query.").  
To user: **User brief** only — never caveman.

After tools: **User brief** in plain English for the human.

---

## Platform-Specific Setup

### Cursor
- Skill at `.cursor/skills/frontend-cinematic-studio/`
- MCP config at `.cursor/mcp.json`
- Gate tools: `gate_init`, `gate_compress_file`, `gate_graph_query`, `gate_clean_response`
- Graphify rule: `python -m graphify cursor install`

### Antigravity
- Skill at `.agent/skills/frontend-cinematic-studio/`
- MCP config: check Settings → MCP or `.antigravity/mcp.json`
- Gate-MCP may need manual MCP server registration
- If gate_* tools unavailable: use normal file reads, rely on Graphify CLI for architecture queries
- Graphify works via shell: `python -m graphify .` and `python -m graphify query "..."`

### VS Code Copilot
- Skill at `.github/skills/frontend-cinematic-studio/`
- MCP setup varies by extension
