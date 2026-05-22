# Frontend Cinematic Studio — Phase 0 installer
# Run from repo root: .\install.ps1

$ErrorActionPreference = "Stop"
$Root = $PSScriptRoot

Write-Host "==> Installing graphifyy (PyPI)..."
pip install graphifyy --upgrade -q
python -m graphify --version

Write-Host "==> Registering Graphify for Cursor..."
Set-Location $Root
python -m graphify cursor install

Write-Host "==> Building Gate-MCP..."
$GatePath = Join-Path $Root "tools\Gate-MCP"
if (-not (Test-Path $GatePath)) {
    New-Item -ItemType Directory -Path (Join-Path $Root "tools") -Force | Out-Null
    git clone https://github.com/Dukeabaddon/Gate-MCP.git $GatePath
}
Set-Location $GatePath
npm install --legacy-peer-deps
npm run build

Write-Host "==> Writing .cursor/mcp.json..."
Set-Location $Root
$rootUnix = $Root -replace '\\', '/'
# Prefer local build if tools/Gate-MCP exists; else npx (portable for fresh clones)
$gateDist = Join-Path $GatePath "dist\main.js"
if (Test-Path $gateDist) {
    $mcp = @{
        mcpServers = @{
            gatemcp = @{
                command = "node"
                args    = @(($gateDist -replace '\\', '/'))
                env     = @{ GATE_PROJECT_ROOT = $rootUnix }
            }
        }
    }
} else {
    $mcp = @{
        mcpServers = @{
            gatemcp = @{
                command = "npx"
                args    = @("-y", "@gatemcp/cli@0.5.5")
                env     = @{ GATE_PROJECT_ROOT = $rootUnix }
            }
        }
    }
}
New-Item -ItemType Directory -Path (Join-Path $Root ".cursor") -Force | Out-Null
$mcp | ConvertTo-Json -Depth 5 | Set-Content -Path (Join-Path $Root ".cursor\mcp.json") -Encoding UTF8

Write-Host "==> Installing skill into .cursor/skills/..."
$skillSrc = Join-Path $Root "frontend-cinematic-studio"
$skillDst = Join-Path $Root ".cursor\skills\frontend-cinematic-studio"
New-Item -ItemType Directory -Path (Join-Path $Root ".cursor\skills") -Force | Out-Null
if (Test-Path $skillDst) { Remove-Item -Recurse -Force $skillDst }
Copy-Item -Recurse $skillSrc $skillDst

Write-Host ""
Write-Host "Done. Next steps:"
Write-Host "  1. Restart Cursor"
Write-Host "  2. Confirm MCP server 'gatemcp' is connected"
Write-Host "  3. In Agent chat: /frontend-cinematic-studio"
Write-Host "  4. Optional: python -m graphify .  (build knowledge graph for this repo)"
