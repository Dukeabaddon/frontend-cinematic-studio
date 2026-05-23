# -----------------------------------------------------------------------
# install.ps1 — Frontend Cinematic Studio IDE Config Generator
# -----------------------------------------------------------------------
# Usage: .\install.ps1 -IDE cursor
# Generates the skill config file for the specified IDE.
# Also copies the skill folder to the correct IDE location.
# -----------------------------------------------------------------------

param(
  [Parameter(Mandatory=$false)]
  [ValidateSet("cursor","claude","antigravity","windsurf","trae","copilot")]
  [string]$IDE = "cursor",

  [Parameter(Mandatory=$false)]
  [string]$ProjectRoot = (Get-Location).Path,

  [Parameter(Mandatory=$false)]
  [switch]$SkillOnly  # Only copy skill, don't generate config
)

$SkillName = "frontend-cinematic-studio"
$Version = "3.1.0"

# --- Shared config content (identity/output/quality/boundaries/navigation) ---
$SharedIdentity = @"
## Identity
- **Role:** Award-level cinematic frontend art director and engineer
- **Objective:** Build handcrafted, atmospheric, editorial web experiences — not generic AI slop
- **Decision framework:** Goals first (measurable visual outcomes), then implementation. Never generate full pages in one shot — use dialectic questioning (2-3 rounds) then section-by-section builds.

## Output
- **Format:** Production-ready code (React/Next.js + TypeScript + Tailwind + Framer Motion)
- **Audience:** Developers building Awwwards-quality sites
- **Detail level:** Pixel-level specificity — exact hex codes, padding values, animation timing in ms

## Quality
- **Verification:** Pre-ship audit (11-point checklist) before delivering any code
- **Done when:** Page passes the Awwwards gut check — would this win a SOTD nomination?
- **Goals not tasks:** Always state measurable visual goals before implementation steps

## Boundaries
- **Never do:** Generate centered 3-col card grids, use from-purple-600 gradients, use pure #fff/#000, add fake STATUS: ONLINE widgets, use spring physics on scroll parallax, output // ... rest unchanged stubs
- **Never assume:** Dark mode is always better, more animation = more cinematic, glass effects are always appropriate
- **Risks:** AI slop (generic patterns), blur fatigue (glass everywhere), tech-larping (fake telemetry)

## Navigation
- **Skill root:** $SkillName/
- **References:** $SkillName/references/ (visual-systems.md, motion-and-type.md, footer-patterns.md, tooling-guide.md)
- **Genre templates:** $SkillName/prompts/ (gaming-wiki, personal-portfolio, product-landing, editorial-magazine, anime-fantasy-landing)
- **Checklists:** $SkillName/checklists/ (award-bar.md, verify.md)
- **Tooling:** Use Gate-MCP for token compression, Graphify for architecture queries, caveman mode between tools
"@

# --- IDE-specific generators ---
function Write-CursorConfig {
  $skillDest = Join-Path $ProjectRoot ".cursor/skills/$SkillName"
  $configDest = Join-Path $ProjectRoot ".cursor/rules/frontend-cinematic.mdc"

  # Copy skill
  if (-not (Test-Path $skillDest)) { New-Item -ItemType Directory -Path $skillDest -Force | Out-Null }
  Copy-Item -Path "$PSScriptRoot/$SkillName/*" -Destination $skillDest -Recurse -Force

  if ($SkillOnly) { return }

  # Generate .mdc config
  $mdcContent = @"
---
description: Cinematic frontend art direction — goals-not-tasks, anti-slop, dialectic design review
globs: ["**/*.tsx", "**/*.ts", "**/*.css", "**/*.html"]
alwaysApply: false
---

# Frontend Cinematic Studio v$Version

$SharedIdentity

## Activation
When the user mentions cinematic, editorial, atmospheric, tactile, premium, Awwwards, or invokes /frontend-cinematic-studio, read the full SKILL.md at .cursor/skills/$SkillName/SKILL.md and follow its workflow.
"@

  $configDir = Split-Path $configDest
  if (-not (Test-Path $configDir)) { New-Item -ItemType Directory -Path $configDir -Force | Out-Null }
  Set-Content -Path $configDest -Value $mdcContent -Encoding UTF8
  Write-Host "[OK] Cursor config written to $configDest" -ForegroundColor Green
}

function Write-ClaudeConfig {
  $configDest = Join-Path $ProjectRoot "CLAUDE.md"

  if ($SkillOnly) { return }

  # Check if CLAUDE.md exists, append if so
  $claudeContent = @"

# Frontend Cinematic Studio v$Version

$SharedIdentity

## Skill Location
The full skill is at `$SkillName/SKILL.md`. Read it when the user asks for cinematic/editorial/atmospheric frontend work.

## Quick Rules
- Always output aesthetic tuple BEFORE code
- Run dialectic design review for full pages (2-3 rounds)
- Build section-by-section, not full page at once
- Use Gate-MCP + Graphify when available
- Pre-ship audit (11 points) before delivering
"@

  if (Test-Path $configDest) {
    Add-Content -Path $configDest -Value $claudeContent -Encoding UTF8
    Write-Host "[OK] Appended to existing CLAUDE.md at $configDest" -ForegroundColor Green
  } else {
    Set-Content -Path $configDest -Value $claudeContent -Encoding UTF8
    Write-Host "[OK] CLAUDE.md created at $configDest" -ForegroundColor Green
  }
}

function Write-AntigravityConfig {
  $skillDest = Join-Path $ProjectRoot ".agent/skills/$SkillName"

  if (-not (Test-Path $skillDest)) { New-Item -ItemType Directory -Path $skillDest -Force | Out-Null }
  Copy-Item -Path "$PSScriptRoot/$SkillName/*" -Destination $skillDest -Recurse -Force

  if ($SkillOnly) { return }

  Write-Host "[OK] Skill copied to $skillDest" -ForegroundColor Green
  Write-Host "[INFO] For Antigravity, the SKILL.md is auto-detected. Configure Gate-MCP in mcp_config.json." -ForegroundColor Cyan
}

function Write-WindsurfConfig {
  $skillDest = Join-Path $ProjectRoot ".windsurf/skills/$SkillName"
  $configDest = Join-Path $ProjectRoot ".windsurf/rules/frontend-cinematic.md"

  if (-not (Test-Path $skillDest)) { New-Item -ItemType Directory -Path $skillDest -Force | Out-Null }
  Copy-Item -Path "$PSScriptRoot/$SkillName/*" -Destination $skillDest -Recurse -Force

  if ($SkillOnly) { return }

  $wsContent = @"
---
trigger: model_decision
description: Cinematic frontend art direction — goals-not-tasks, anti-slop, dialectic design review. Activates for premium web design tasks.
---

# Frontend Cinematic Studio v$Version

$SharedIdentity

## Activation
When the user mentions cinematic, editorial, atmospheric, tactile, premium, Awwwards, or invokes /frontend-cinematic-studio, read the full SKILL.md at .windsurf/skills/$SkillName/SKILL.md and follow its workflow.
"@

  $configDir = Split-Path $configDest
  if (-not (Test-Path $configDir)) { New-Item -ItemType Directory -Path $configDir -Force | Out-Null }
  Set-Content -Path $configDest -Value $wsContent -Encoding UTF8
  Write-Host "[OK] Windsurf config written to $configDest" -ForegroundColor Green
}

function Write-TraeConfig {
  $skillDest = Join-Path $ProjectRoot ".trae/skills/$SkillName"
  $configDest = Join-Path $ProjectRoot ".trae/rules/frontend-cinematic.md"

  if (-not (Test-Path $skillDest)) { New-Item -ItemType Directory -Path $skillDest -Force | Out-Null }
  Copy-Item -Path "$PSScriptRoot/$SkillName/*" -Destination $skillDest -Recurse -Force

  if ($SkillOnly) { return }

  $traeContent = @"
# Frontend Cinematic Studio v$Version

$SharedIdentity

## Activation
When the user mentions cinematic, editorial, atmospheric, tactile, premium, Awwwards, or invokes /frontend-cinematic-studio, read the full SKILL.md at .trae/skills/$SkillName/SKILL.md and follow its workflow.

## Application Mode
Apply Intelligently — AI decides based on context when frontend design tasks are detected.
"@

  $configDir = Split-Path $configDest
  if (-not (Test-Path $configDir)) { New-Item -ItemType Directory -Path $configDir -Force | Out-Null }
  Set-Content -Path $configDest -Value $traeContent -Encoding UTF8
  Write-Host "[OK] Trae config written to $configDest" -ForegroundColor Green
}

function Write-CopilotConfig {
  $skillDest = Join-Path $ProjectRoot ".github/skills/$SkillName"
  $configDest = Join-Path $ProjectRoot ".github/copilot-instructions.md"

  if (-not (Test-Path $skillDest)) { New-Item -ItemType Directory -Path $skillDest -Force | Out-Null }
  Copy-Item -Path "$PSScriptRoot/$SkillName/*" -Destination $skillDest -Recurse -Force

  if ($SkillOnly) { return }

  $copilotContent = @"

# Frontend Cinematic Studio v$Version

$SharedIdentity

## Skill Location
The full skill is at `.github/skills/$SkillName/SKILL.md`. Read it when the user asks for cinematic/editorial/atmospheric frontend work.
"@

  if (Test-Path $configDest) {
    Add-Content -Path $configDest -Value $copilotContent -Encoding UTF8
    Write-Host "[OK] Appended to existing copilot-instructions.md" -ForegroundColor Green
  } else {
    Set-Content -Path $configDest -Value $copilotContent -Encoding UTF8
    Write-Host "[OK] copilot-instructions.md created at $configDest" -ForegroundColor Green
  }
}

# --- Main ---
Write-Host "Frontend Cinematic Studio v$Version — IDE Config Generator" -ForegroundColor Magenta
Write-Host "IDE: $IDE | Project: $ProjectRoot" -ForegroundColor Gray
Write-Host ""

switch ($IDE) {
  "cursor"      { Write-CursorConfig }
  "claude"      { Write-ClaudeConfig }
  "antigravity" { Write-AntigravityConfig }
  "windsurf"    { Write-WindsurfConfig }
  "trae"        { Write-TraeConfig }
  "copilot"     { Write-CopilotConfig }
}

# --- Check optional dependencies ---
Write-Host ""

# Check rembg (background removal)
$rembgInstalled = $false
try {
  $null = & rembg --version 2>$null
  $rembgInstalled = $true
} catch { }

if ($rembgInstalled) {
  Write-Host "[OK] rembg found — background removal available" -ForegroundColor Green
} else {
  Write-Host "[OPTIONAL] rembg not found — install for background removal:" -ForegroundColor Yellow
  Write-Host "  pip install `"rembg[cli]`"" -ForegroundColor Gray
}

# Check graphify
$graphifyInstalled = $false
try {
  $null = & python -m graphify --version 2>$null
  $graphifyInstalled = $true
} catch { }

if ($graphifyInstalled) {
  Write-Host "[OK] graphify found — architecture queries available" -ForegroundColor Green
} else {
  Write-Host "[OPTIONAL] graphify not found — install for codebase exploration:" -ForegroundColor Yellow
  Write-Host "  pip install graphifyy" -ForegroundColor Gray
}

Write-Host ""
Write-Host "[DONE] Config generated for $IDE. Restart your IDE to pick up changes." -ForegroundColor Green

