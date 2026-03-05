# URL to the raw templates in your GitHub repo
$RepoBase = "https://raw.githubusercontent.com/Stinger05189/agent-forge/master/template/.agents"
$TargetDir = Join-Path (Get-Location).Path ".agents"

# Check if .agents already exists to prevent accidental overwrites
if (Test-Path $TargetDir) {
    Write-Host "Warning: An .agents directory already exists in this project." -ForegroundColor Yellow
    $response = Read-Host "Do you want to overwrite the core template files? (y/N)"
    if ($response -notmatch '^[Yy]$') {
        Write-Host "Aborted."
        exit
    }
} else {
    New-Item -ItemType Directory -Path $TargetDir | Out-Null
}

$Files = @("agent.md", "plan.md", "devlog.md", "conventions.md")

Write-Host "Forging Agent workspace..." -ForegroundColor Cyan

# Download each file directly from GitHub
foreach ($File in $Files) {
    $Url = "$RepoBase/$File"
    $Dest = Join-Path $TargetDir $File
    Write-Host "  -> Downloading $File"
    Invoke-WebRequest -Uri $Url -OutFile $Dest -UseBasicParsing
}

Write-Host ""
Write-Host "SUCCESS: Agent Forge initialized!" -ForegroundColor Green
Write-Host "Drop the .agents/ directory into your AI context window to begin."
Write-Host ""
Write-Host "===========================================================" -ForegroundColor Cyan
Write-Host " 📌 NEXT STEPS: Grab Your Workflow Prompts" -ForegroundColor Cyan
Write-Host "===========================================================" -ForegroundColor Cyan
Write-Host "To maintain the workflow, use the standardized session prompts."
Write-Host "Ctrl+Click the links below to copy them to your prompt manager:"
Write-Host ""
Write-Host "🚀 Kickoff Prompt:  https://github.com/Stinger05189/agent-forge#1-initialization-context-loading"
Write-Host "🛑 Teardown Prompt: https://github.com/Stinger05189/agent-forge#4-phase-3-the-teardown"
Write-Host "===========================================================" -ForegroundColor Cyan
Write-Host ""
