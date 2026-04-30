param(
    [Parameter(Mandatory = $true)]
    [string]$Owner,

    [Parameter(Mandatory = $true)]
    [string]$Repo,

    [string]$Description = "",

    [string]$Homepage = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$token = & (Join-Path $PSScriptRoot "get-github-token.ps1")
$headers = @{
    Authorization = "Bearer $token"
    Accept = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2022-11-28"
}

$payload = @{}
if (-not [string]::IsNullOrWhiteSpace($Description)) {
    $payload.description = $Description
}
if (-not [string]::IsNullOrWhiteSpace($Homepage)) {
    $payload.homepage = $Homepage
}

if ($payload.Count -eq 0) {
    throw "Provide at least one field to update: -Description or -Homepage."
}

Invoke-RestMethod `
    -Method Patch `
    -Uri "https://api.github.com/repos/$Owner/$Repo" `
    -Headers $headers `
    -ContentType "application/json" `
    -Body ($payload | ConvertTo-Json -Depth 5)
