[CmdletBinding()]
param(
[Parameter(Mandatory=$False)]
[string] $parameters,
[Parameter(Mandatory=$True)]
[string] $testProject
)

install dotnet-stryker --tool-path $(Agent.BuildDirectory)/tools

$testPath = Get-ChildItem -Filter $testProject -Recurse | Select-Object -Expand Directory -First 1

Set-Location $testPath

$(Agent.BuildDirectory)/tools/dotnet-stryker $parameters
