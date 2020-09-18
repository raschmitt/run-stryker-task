# Run Strker.Net - Azure Devops Task [<img src="https://raw.githubusercontent.com/raschmitt/run-stryker-task/master/run-stryker/icon.png" align='right' width="128"/>](https://github.com/raschmitt/run-stryker-tas)

[![Visual Studio Marketplace Version](https://img.shields.io/visual-studio-marketplace/v/raschmitt.run-stryker-net-task?label=Latest%20Version&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=raschmitt.run-stryker-net-task)
[![Visual Studio Marketplace Installs - Azure DevOps Extension](https://img.shields.io/visual-studio-marketplace/azure-devops/installs/total/raschmitt.run-stryker-net-task?label=Installs&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=raschmitt.run-stryker-net-task)
[![Visual Studio Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/raschmitt.run-stryker-net-task?label=User%20Rating&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=raschmitt.run-stryker-net-task)

Azure Devops extension to run mutation tests on .NET Core and .NET Framework projects with [Stryker.Net](https://github.com/stryker-mutator/stryker-net).

**Disclaimer:** This is not an official [Stryker Mutator](https://stryker-mutator.io/) extension.

## How to use

1. Install the extension into your Azure DevOps organization.

  - [Installing Azure DevOps extensions](https://docs.microsoft.com/en-us/azure/devops/marketplace/install-extension?view=azure-devops-2020&tabs=browser). 
  - [Run Stryker .Net Task latest version](https://marketplace.visualstudio.com/items?itemName=raschmitt.run-stryker-net-task).

2. Add the task to your pipeline

  - Simply copy paste the following code, and add your own parameters.

```yml
- task: run-stryker@1
  inputs:
    testProject: ''
    parameters: ''
 ```
 
3. Run your pipeline 

  - To display your mutation results on your pipeline you can use the [Mutation Report Publisher](https://marketplace.visualstudio.com/items?itemName=stryker-mutator.mutation-report-publisher).

## Parameters

| Parameter | Description | Required |
| :---: | --- | :---: |
| testProject | Name of the test project to mutate **(e.g. Sample.Tests.csproj)**. Wild cars are available **(e.g. *Tests.csproj)**. Be sure to match only one test project here.| Yes |
| parameters | Parameters wich will be passed to Stryker **(e.g. --reporters "['html', 'progress']")**. More on the available parameters can be found on the oficcial Stryker .Net [configuration docs](https://github.com/stryker-mutator/stryker-net/blob/master/docs/Configuration.md). | No |

### Sample

```yml
- task: run-stryker@1
    displayName: 'Run mutations'
    inputs:
      testProject: '*Tests.csproj'
      parameters: --reporters "['html', 'dashboard']" --dashboard-api-key $(STRYKER_DASHBOARD_API_KEY) -project github.com/$(Build.Repository.Name) -version $(Build.SourceBranchName)
```

## Contributions

Contributions and feature requests are always welcome.
