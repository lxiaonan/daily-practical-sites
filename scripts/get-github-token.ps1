Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$credentialRequest = "protocol=https`nhost=github.com`n`n"
$rawResponse = $credentialRequest | git credential-manager get

$pairs = @{}
foreach ($line in ($rawResponse -split "`r?`n")) {
    if ([string]::IsNullOrWhiteSpace($line)) {
        continue
    }

    $parts = $line -split "=", 2
    if ($parts.Count -eq 2) {
        $pairs[$parts[0]] = $parts[1]
    }
}

if (-not $pairs.ContainsKey("password")) {
    throw "Unable to retrieve a GitHub token from Git Credential Manager."
}

$pairs["password"]
