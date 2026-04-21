param(
    [Parameter(Mandatory = $true)]
    [string]$Date,

    [Parameter(Mandatory = $true)]
    [string]$Name,

    [Parameter(Mandatory = $true)]
    [string]$Repo,

    [Parameter(Mandatory = $true)]
    [string]$Category,

    [Parameter(Mandatory = $true)]
    [string]$Summary,

    [string]$PagesUrl = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$historyPath = Join-Path $PSScriptRoot "..\history\projects.json"
$resolvedHistoryPath = [System.IO.Path]::GetFullPath($historyPath)

$existing = @()
if (Test-Path $resolvedHistoryPath) {
    $raw = Get-Content -LiteralPath $resolvedHistoryPath -Raw
    if (-not [string]::IsNullOrWhiteSpace($raw)) {
        $existing = $raw | ConvertFrom-Json
    }
}

if ($existing -isnot [System.Collections.IEnumerable] -or $existing -is [string]) {
    $existing = @($existing)
}

$entry = [PSCustomObject]@{
    date = $Date
    name = $Name
    repo = $Repo
    category = $Category
    summary = $Summary
    pages_url = $PagesUrl
}

$updated = @($existing) + $entry
$jsonItems = foreach ($item in @($updated)) {
    $item | ConvertTo-Json -Depth 5
}

$json = "[`n" + ($jsonItems -join ",`n") + "`n]"
$json | Set-Content -LiteralPath $resolvedHistoryPath -Encoding utf8
