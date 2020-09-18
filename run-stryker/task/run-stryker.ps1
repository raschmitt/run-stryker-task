[CmdletBinding()]
param(
    [Parameter(Mandatory = $False)]
    [string] $parameters,
    [Parameter(Mandatory = $True)]
    [string] $testProject
)

$testProjectPath = Get-ChildItem -Filter $testProject -Recurse | Select-Object -Expand Directory -First 1

Set-Location $testProjectPath

dotnet tool install -g dotnet-stryker

Invoke-Expression "dotnet-stryker $parameters"
