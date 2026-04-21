param(
    [Parameter(Mandatory = $true)]
    [string]$Owner,

    [Parameter(Mandatory = $true)]
    [string]$Repo
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
    build_type = "workflow"
}

$uri = "https://api.github.com/repos/$Owner/$Repo/pages"

try {
    Invoke-RestMethod `
        -Method Post `
        -Uri $uri `
        -Headers $headers `
        -ContentType "application/json" `
        -Body ($payload | ConvertTo-Json -Depth 5)
}
catch {
    if ($_.Exception.Response.StatusCode.value__ -ne 409) {
        throw
    }

    Invoke-RestMethod `
        -Method Put `
        -Uri $uri `
        -Headers $headers `
        -ContentType "application/json" `
        -Body ($payload | ConvertTo-Json -Depth 5)
}
