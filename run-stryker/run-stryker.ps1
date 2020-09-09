[CmdletBinding()]
param(
    [Parameter(Mandatory = $False)]
    [string] $parameters,
    [Parameter(Mandatory = $True)]
    [string] $testProject
)

install dotnet-stryker --tool-path $env:Agent_BuildDirectory/tools

$testPath = Get-ChildItem -Filter $testProject -Recurse | Select-Object -Expand Directory -First 1

Set-Location $testPath

$env:Agent_BuildDirectory/tools/dotnet-stryker
