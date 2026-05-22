# Mandatory Session Preflight (non-skippable)

When `/frontend-cinematic-studio` is invoked — **before** goals or code.

## User brief rule (accessibility)

Talk to the user in **short plain English** — max **3 bullets**, one sentence each.  
No long tables or essays unless they ask “explain more”.  
Technical detail → `references/gate-quick.md` or README.

---

## Step 0 — Bootstrap tooling (shell)

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

### Scan — use what already exists

| Path | Action |
|------|--------|
| `graphify-out/graph.json` | **Reuse** — query with `python -m graphify query "..."` |
| `.understand-anything/knowledge-graph.json` | **Reuse** — prefer `/understand-chat` or graph queries; do not rebuild Graphify unless user asks |
| No graph + `package.json` or 10+ code files | **Build:** `python -m graphify .` |
| `.gate-mcp/cache.db` | Gate was used before — still call `gate_init` |
| `.cursor/mcp.json` missing | Copy from `.cursor/mcp.json.example`; set `GATE_PROJECT_ROOT` to project absolute path; tell user to restart Cursor |

### Install if missing

| Missing | Install |
|---------|---------|
| `python -m graphify` fails | `pip install graphifyy` then retry |
| No Gate build | Clone `tools/Gate-MCP`, `npm install --legacy-peer-deps`, `npm run build` OR use `npx -y @gatemcp/cli` in mcp.json |
| Graphify Cursor rule missing | `python -m graphify cursor install` |

Do not skip install because “maybe optional” — **attempt install once**, then report result in Preflight.

---

## Step 1 — Post Preflight (brief, for user)

```markdown
## Preflight
- Graphify: [ready + graph path | installed + built graph | skip + why]
- Gate: [gate_init OK | MCP offline — restart Cursor]
- Next: aesthetic tuple → goals
```

---

## Step 2 — Gate-MCP (**always when tools exist**)

1. **First MCP call:** `gate_init`  
2. **Every code read** on `.ts/.tsx/.js/.jsx/.py/.go/.rs` → `gate_compress_file` (`signature`) — **default, not optional**  
3. Only skip Gate Read for: file &lt; 40 lines AND you will edit 100% of it  
4. Config/markdown &gt; 60 lines → `structure`  
5. “What connects X?” → `gate_graph_query` or `graphify_map` / graphify query  
6. Fat JSON → `gate_clean_response`  

If `gate_*` **not in tool list:**

- Tell user in **one sentence:** “Gate MCP offline — restart Cursor after install.ps1.”  
- Do not fake Gate usage  
- Still run Graphify via shell  

---

## Step 3 — Graphify (shell)

If `graphify-out/graph.json` missing and project has app code:

```bash
python -m graphify .
```

Then explore with `python -m graphify query "..."` — **not** 5+ full file Reads for architecture.

---

## Step 4 — Caveman (tool narration only)

Between tools: 3–6 words (“Me gate_init.” “Me graphify query.”).  
To user: **User brief** only — never caveman.

---

## Definition of done

- [ ] Bootstrap ran (install or detect documented)  
- [ ] Brief Preflight shown (≤5 lines for user)  
- [ ] `gate_init` called OR MCP offline warned  
- [ ] Graph exists or built or skip reason stated  
- [ ] Gate used for code reads when MCP online  
