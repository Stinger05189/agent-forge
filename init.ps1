# agent-forge/init.ps1
param (
	[Parameter(Mandatory=$false)]
	[ValidateSet("Standard", "Unreal")]
	[string]$Profile = ""
)

$RepoBase = "https://raw.githubusercontent.com/Stinger05189/agent-forge/master/template/.agents"
$TargetDir = Join-Path (Get-Location).Path ".agents"

# Resolve profile selection if not provided via parameter
if ([string]::IsNullOrWhiteSpace($Profile)) {
	Write-Host ""
	Write-Host "===========================================================" -ForegroundColor Cyan
	Write-Host " ⚒️  AGENT FORGE WORKSPACE INITIALIZER" -ForegroundColor Cyan
	Write-Host "===========================================================" -ForegroundColor Cyan
	Write-Host "Select workspace profile:"
	Write-Host "  [1] Standard (General Web, Backend, Systems, Mobile)"
	Write-Host "  [2] Unreal Engine (C++20, Slate, UMG, LWC, GC Safety)"
	$selection = Read-Host "Enter choice [1-2] (Default: 1)"
	if ($selection -eq "2") {
		$Profile = "Unreal"
	} else {
		$Profile = "Standard"
	}
}

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

$AgentFileName = if ($Profile -eq "Unreal") { "agent.unreal.md" } else { "agent.md" }
$BaseFiles = @("plan.md", "devlog.md", "conventions.md")

Write-Host ""
Write-Host "Forging Agent Forge workspace ($Profile Profile)..." -ForegroundColor Cyan

# Download the appropriate agent protocol and save as agent.md
$AgentUrl = "$RepoBase/$AgentFileName"
$AgentDest = Join-Path $TargetDir "agent.md"
Write-Host "  -> Downloading $AgentFileName as agent.md"
Invoke-WebRequest -Uri $AgentUrl -OutFile $AgentDest -UseBasicParsing

# Download remaining state files
foreach ($File in $BaseFiles) {
	$Url = "$RepoBase/$File"
	$Dest = Join-Path $TargetDir $File
	Write-Host "  -> Downloading $File"
	Invoke-WebRequest -Uri $Url -OutFile $Dest -UseBasicParsing
}

Write-Host ""
Write-Host "SUCCESS: Agent Forge initialized ($Profile Profile)!" -ForegroundColor Green
Write-Host "Drop the .agents/ directory into your AI context window to begin."
Write-Host ""
Write-Host "===========================================================" -ForegroundColor Cyan
Write-Host " 📌 NEXT STEPS: Grab Your Workflow Prompts" -ForegroundColor Cyan
Write-Host "===========================================================" -ForegroundColor Cyan
Write-Host "Kickoff Prompt:  https://github.com/Stinger05189/agent-forge#1-initialization-context-loading"
Write-Host "Teardown Prompt: https://github.com/Stinger05189/agent-forge#4-phase-3-the-teardown"
Write-Host "===========================================================" -ForegroundColor Cyan
Write-Host ""