$csv = Import-Csv -Path .\microsoftbloat.csv
foreach ($line in $csv) {
    Get-AppxPackage -Name $line.app | Remove-AppxPackage
    Write-Host Windows bloat, $line.name removed!
}
