param (
	[Parameter(Mandatory=$false)]
	[ValidateSet("Standard", "Unreal", "")]
	[string]$WorkspaceProfile = "",

	[Parameter(Mandatory=$false)]
	[ValidateSet("Xcerpt", "NativeIDE", "")]
	[string]$ToolingMode = ""
)

$RepoBase = "https://raw.githubusercontent.com/Stinger05189/agent-forge/master/template/.agents"
$TargetDir = Join-Path (Get-Location).Path ".agents"

# Display Interactive Initializer Banner
Write-Host ""
Write-Host "===========================================================" -ForegroundColor Cyan
Write-Host "  AGENT FORGE WORKSPACE INITIALIZER" -ForegroundColor Cyan
Write-Host "===========================================================" -ForegroundColor Cyan

# 1. Resolve Workspace Profile
if ([string]::IsNullOrWhiteSpace($WorkspaceProfile)) {
	Write-Host "Select Workspace Profile:" -ForegroundColor White
	Write-Host "  [1] Standard Software Engineering (TypeScript, Python, Go, Rust, C#, Web/Backend)"
	Write-Host "  [2] Unreal Engine (C++20, Slate, UMG, LWC, GC Roots, Engine Macros, Tabs)"
	$pChoice = Read-Host "Enter choice [1-2] (Default: 1)"
	if ($pChoice -eq "2") {
		$WorkspaceProfile = "Unreal"
	} else {
		$WorkspaceProfile = "Standard"
	}
}

# 2. Resolve Tooling Integration Mode
if ([string]::IsNullOrWhiteSpace($ToolingMode)) {
	Write-Host ""
	Write-Host "Select Tooling Integration Mode:" -ForegroundColor White
	Write-Host "  [1] Xcerpt-Optimized (Deterministic boundary tokens <<<FILE_START>>>, outer 4-backtick fences)"
	Write-Host "  [2] Native IDE Merge (Standard code fences with Line 1 paths, optimized for VS Code / Rider diffs)"
	$tChoice = Read-Host "Enter choice [1-2] (Default: 1)"
	if ($tChoice -eq "2") {
		$ToolingMode = "NativeIDE"
	} else {
		$ToolingMode = "Xcerpt"
	}
}

# 3. Check for Existing .agents Directory
if (Test-Path $TargetDir) {
	Write-Host ""
	Write-Host "Warning: An .agents directory already exists in this project." -ForegroundColor Yellow
	$response = Read-Host "Do you want to overwrite existing template files? (y/N)"
	if ($response -notmatch '^[Yy]$') {
		Write-Host "Initialization aborted." -ForegroundColor Gray
		exit
	}
} else {
	New-Item -ItemType Directory -Path $TargetDir | Out-Null
}

# 4. Resolve Protocol Source File
$AgentFileName = ""
if ($WorkspaceProfile -eq "Unreal") {
	$AgentFileName = if ($ToolingMode -eq "NativeIDE") { "agent.unreal.native.md" } else { "agent.unreal.md" }
} else {
	$AgentFileName = if ($ToolingMode -eq "NativeIDE") { "agent.native.md" } else { "agent.md" }
}

$BaseFiles = @("plan.md", "devlog.md", "conventions.md")

Write-Host ""
Write-Host "Forging Agent Forge workspace..." -ForegroundColor Cyan
Write-Host "  -> Profile:  $WorkspaceProfile" -ForegroundColor Gray
Write-Host "  -> Tooling:  $ToolingMode" -ForegroundColor Gray
Write-Host "  -> Protocol: $AgentFileName -> .agents/agent.md" -ForegroundColor Gray

# Download and save designated agent protocol as .agents/agent.md
$AgentUrl = "$RepoBase/$AgentFileName"
$AgentDest = Join-Path $TargetDir "agent.md"
Invoke-WebRequest -Uri $AgentUrl -OutFile $AgentDest -UseBasicParsing

# Download remaining state files
foreach ($File in $BaseFiles) {
	$Url = "$RepoBase/$File"
	$Dest = Join-Path $TargetDir $File
	Write-Host "  -> Downloading $File" -ForegroundColor Gray
	Invoke-WebRequest -Uri $Url -OutFile $Dest -UseBasicParsing
}

Write-Host ""
Write-Host "SUCCESS: Agent Forge initialized ($WorkspaceProfile | $ToolingMode)!" -ForegroundColor Green
Write-Host "Drop the .agents/ directory into your AI context window to begin." -ForegroundColor White
Write-Host ""
Write-Host "===========================================================" -ForegroundColor Cyan
Write-Host "  NEXT STEPS: Session Kickoff & Teardown" -ForegroundColor Cyan
Write-Host "===========================================================" -ForegroundColor Cyan
Write-Host "1. Kickoff Prompt:  https://github.com/Stinger05189/agent-forge#1-initialization-the-handshake"
Write-Host "2. Issue 'GREENLIGHT' after Phase 1 Triangulation."
Write-Host "3. Teardown Prompt: https://github.com/Stinger05189/agent-forge#4-phase-3-the-teardown"
Write-Host "===========================================================" -ForegroundColor Cyan
Write-Host ""
