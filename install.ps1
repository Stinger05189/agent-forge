param (
    [string]$TargetDir = "."
)

# Ensure target directory exists
if (-not (Test-Path -Path $TargetDir)) {
    Write-Error "Error: Target directory '$TargetDir' does not exist."
    exit 1
}

# Define paths relative to where the script is located
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$TemplateDir = Join-Path $ScriptDir "template\.agents"
$TargetAgentDir = Join-Path $TargetDir ".agents"

# Check if .agents already exists in the target to prevent accidental overwrites
if (Test-Path -Path $TargetAgentDir) {
    Write-Host "Warning: An .agents directory already exists in $TargetDir." -ForegroundColor Yellow
    $response = Read-Host "Do you want to overwrite the core template files? (y/N)"
    if ($response -notmatch '^[Yy]$') {
        Write-Host "Aborted."
        exit 1
    }
} else {
    New-Item -ItemType Directory -Path $TargetAgentDir | Out-Null
}

# Copy the templates
Copy-Item -Path "$TemplateDir\*" -Destination $TargetAgentDir -Force

Write-Host "SUCCESS: Agent Forge initialized in $TargetAgentDir" -ForegroundColor Green
Write-Host "You are ready to begin the Handshake."
