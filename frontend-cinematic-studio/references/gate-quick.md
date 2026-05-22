# Gate-MCP — brief guide (for you)

Gate shrinks file reads before they hit the AI. **Always use it** when the skill is on.

## One-line what it does

**Smaller file previews → same understanding → fewer tokens.**

## Every session (agent does this)

1. `gate_init` — handshake, finds graphify map if present  
2. Before opening a big code file → `gate_compress_file`  
3. Big JSON from tools → `gate_clean_response`  

## You only need to check

| Check | Where |
|-------|--------|
| MCP on? | Cursor → Settings → MCP → **gatemcp** green |
| First time? | Run `.\install.ps1` or `.\scripts\bootstrap-tooling.ps1`, restart Cursor |

## If MCP is red

1. Restart Cursor  
2. Open project folder (website repo, not skill repo only)  
3. Confirm `.cursor/mcp.json` exists  
4. Ask agent: “run gate_init”  

## Plain English tools

| Tool | Use in one sentence |
|------|---------------------|
| `gate_init` | Start Gate for this folder |
| `gate_compress_file` | Read code as short outline, not full file |
| `gate_graph_query` | “What links to X?” without opening every file |
| `gate_clean_response` | Shrink fat JSON replies |

## vs Graphify

| | Graphify | Gate |
|---|----------|------|
| **Job** | Map whole project | Shrink each read |
| **Run** | `python -m graphify .` once | MCP every session |
| **Output** | `graphify-out/` | compressed text in chat |

Use **both**. Graphify first, Gate on every read.

## vs [Understand-Anything](https://github.com/Lum1104/Understand-Anything)

Understand-Anything = big dashboard + `/understand` plugin (17k★).  
Graphify = lighter graph + `graphify query`.  
This skill uses **Graphify + Gate** by default. If you install Understand-Anything, agent may use `.understand-anything/knowledge-graph.json` instead of `graphify-out/`.
