param(
    [Parameter(Mandatory=$true)][string]$Platform,
    [Parameter(Mandatory=$true)][string]$Name
)

$TargetDir = "problems/$Platform"
$TargetFile = "$TargetDir/$Name.cpp"

New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null

if (Test-Path $TargetFile) {
    Write-Host "Already exists: $TargetFile"
    exit 1
}

Copy-Item "templates/main.cpp" $TargetFile
Write-Host "Created: $TargetFile"
