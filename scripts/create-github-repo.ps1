param(
    [Parameter(Mandatory = $true)]
    [string]$Name,

    [string]$Description = "",

    [switch]$Private
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$token = & (Join-Path $PSScriptRoot "get-github-token.ps1")
$headers = @{
    Authorization = "Bearer $token"
    Accept = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2022-11-28"
}

$payload = @{
    name = $Name
    description = $Description
    private = [bool]$Private
    auto_init = $false
}

Invoke-RestMethod `
    -Method Post `
    -Uri "https://api.github.com/user/repos" `
    -Headers $headers `
    -ContentType "application/json" `
    -Body ($payload | ConvertTo-Json -Depth 5)
