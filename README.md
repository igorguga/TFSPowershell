# TFSPowershell
A Powershell module to interact with Team Foundation Server. Makes easy to administer and do batch actions in TFS. 

## Context

About two years ago, I needed to make a lot of batch administration work for TFS. Things like create Teams, Builds, repository folders, give permissions for Teams, source code folders, areas, iterations, tests, etc. I decided to build some powershell scripts to make my work easyier, so I looked for Commandlets and modules to help me in this task. But, at that time, there was a lack of Powershell commandlets or modules to handle TFS objects such as Areas, Iterations, Team, etc. Most of command line tools dealed with version control or administration tasks. So I begin incrementaly build this module by myself. 

In the first version of this module, the TFS was in the 2013 version. Since them, I update it for every new TFS Update. After these years I noticed how big this module became and I decide to share with the community. It is in prodution with one of my customers, so it is kind stable. But I'll really apreciate any feedbacks and contributions. 

## Suported TFS version

This version supports TFS 2015.3, but I'm planning to support TFS 2017 and VSTS also. I did'nt test yet, but considering the back compatibility history of the API,  I think it will works with TFS 2017 with very low issues. With VSTS the history is other, and probably will issues with authentication stuff. I'll update here as soon as I test. Also, feel free to share yours experiences about this.    

## How to Install

Install TFSPowershell module from the PowerShell Gallery:

```powershell
Install-Module -Name TFSPowershell -Scope CurrentUser
Import-Module TFSPowershell
```

## How to Use

Just call the functions and inform the parameters. Most functions have a CollectionURL parameter. Some of them support pipeline. Consult the documentation for more details.


## Contributions

## Documentation

[https://github.com/igorguga/TFSPowershell/blob/master/Documentation/TFSPowershell.md]()

