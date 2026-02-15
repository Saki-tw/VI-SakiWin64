# install.ps1 — Vi for Windows, one-click install
# Usage: irm https://raw.githubusercontent.com/Saki-tw/Vi-SakiWin64/main/install.ps1 | iex
#
# Vi — the original Vi, not Vim.

$ErrorActionPreference = 'Stop'
$repo = 'Saki-tw/Vi-SakiWin64'
$installDir = "$env:LOCALAPPDATA\Programs\vi"

Write-Host "Vi — the original Vi, not Vim." -ForegroundColor Magenta
Write-Host ""

# Get latest release
$release = Invoke-RestMethod "https://api.github.com/repos/$repo/releases/latest"
$asset = $release.assets | Where-Object { $_.name -eq 'vi.exe' }
if (-not $asset) {
    Write-Host "Error: vi.exe not found in latest release." -ForegroundColor Red
    exit 1
}

$version = $release.tag_name
Write-Host "Installing Vi $version ..." -ForegroundColor Cyan

# Download
New-Item -ItemType Directory -Path $installDir -Force | Out-Null
$outPath = Join-Path $installDir 'vi.exe'
Write-Host "  Downloading vi.exe ..."
Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $outPath

# Add to PATH if not already
$userPath = [Environment]::GetEnvironmentVariable('Path', 'User')
if ($userPath -notlike "*$installDir*") {
    Write-Host "  Adding $installDir to User PATH ..."
    [Environment]::SetEnvironmentVariable('Path', "$userPath;$installDir", 'User')
    $env:Path = "$env:Path;$installDir"
}

Write-Host ""
Write-Host "Done. Type 'vi' to start." -ForegroundColor Green
Write-Host "  vi --version    # verify"
Write-Host "  vi file.txt     # edit"
Write-Host ""
Write-Host "To uninstall: Remove-Item '$installDir' -Recurse" -ForegroundColor DarkGray
