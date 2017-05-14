# TFSPowershell
A Powershell module to interact with Team Foundation Server. Makes easy to administer and do batch actions in TFS. 

## Context

About two years ago, I needed to make a lot of batch administration work for TFS. Things like create Teams, Builds, repository folders, give permissions for Teams, source code folders, areas, iterations, tests, etc. I decided to build some powershell scripts to make my work easier, so I looked for commandlets and modules to help me in this task. But, at that time, there was a lack of Powershell commandlets or modules to handle TFS objects such as Areas, Iterations, Team, etc. Most of command line tools dealed with version control or administration tasks. So I begin incrementaly build this module by myself. 

In the first version of this module, the TFS was in the 2013 version. Since them, I update it for every new TFS Update. After these years I noticed how big this module became and I decide to share with the community. It is in prodution with one of my customers, so it is stable. But I'll really apreciate any feedbacks and contributions. 

## Architecture

TFSPowershell uses three kinds of interfaces to interact with TFS/VSTS:
- [**Microsoft Team Foundation Server Extended Client**](https://www.nuget.org/packages/Microsoft.TeamFoundationServer.ExtendedClient/14.95.3): most of the modules;  
- **TF.exe and TFSSecurity.exe tools**: the Security module;
- [**REST API**](https://www.visualstudio.com/en-us/docs/integrate/api/build/overview): only the Build module;

The first version of TFSPowershell, used the dlls of the TFS client object model that were installed on the GAC (Global Assembly Cache). With the changes introduced by TFS 2015, TFSPowershell started to be packed with the TFS clients dlls.

Since the begining, the security module was built using the classical tools TF.exe (for TFVC security) and TFSSecurity.exe. The intention was, not to rewrite code that works very well with these tools. In future, will be necessary to use the REST APIs to communicate with the new features that have been delivered. 

When the REST APIs were delivered for TFS, a new world of possibilities was created. Also, the REST API became the only way to interact with "new" features, as kanban boards, git and the web version of builds and releases. So for the build module TFSPowershell uses the Build REST API.

### Authentication

When using TFSPowershell with TFS, the module will always get the current user to authenticate in the server. The Build module, that uses the REST API, also follow this behavior by default. But is possible to set a specific user for the REST API calls (see Settings).

When using TFSPowershell with VSTS, the first time you call a function of a module that not uses the REST APIs (all except the Build module), it will prompt for the credentials. You can inform the credentials you use to log in the VSTS portal. Depending of your security settings, this credential will be cached, and you will not be prompted again. To use modules that calls REST APIs (Build), you will need to create a [Personal Access Token (PAT)](https://www.visualstudio.com/en-us/docs/integrate/get-started/auth/overview), and call the command Set-RestApiCredentials to store these credential (see bellow).   

## Supported TFS/VSTS version

The actual version of TFSPowershell is using version 14.95.3 of the [extended TFS client Object Model](https://www.nuget.org/packages/Microsoft.TeamFoundationServer.ExtendedClient/14.95.3), the TFS 2015.3 versions of TF.exe and TFSSecurity.exe and up to version 2.0 of the REST API. Everything supported for these versions of the components will be supported by the TFSPowershell modules. 

Teorically, all functions released will work with TFS 2015/2017 and VSTS.

If you find any issue, please let me know.
  

## How to Install

Install TFSPowershell module from the PowerShell Gallery:

```powershell
Install-Module -Name TFSPowershell -Scope CurrentUser

Import-Module TFSPowershell
```

> If your Powershell version is inferior than 5, you will need to install PowerShellGet. Visit the site of [Powershell Gallery](https://www.powershellgallery.com/) for more instructions.

## Settings

### Credentials
- **TFS**: no extra configuration is necessary. All functions will be executed with the credentials of the current user, even the ones that use the REST APIs. For the REST APIs it's possible to set a specific user. Call
   ```powershell
   Set-RestApiCredentials
   ```
   and inform the username and password of the user.

- **VSTS**: for the REST APIs calls is necessary to set the credential to be used. First, you will need to create a PAT (Personal Access Token). Follow [this](https://www.visualstudio.com/en-us/docs/integrate/get-started/auth/overview) guide to create a PAT.

   Then, execute the command:
   ```powershell
   Set-RestApiCredentials
   ```
   It will prompt for a user name and password. Inform any user name (like 'user') and for the password, inform your PAT.

   > When creating the PAT, remember to give access for the necessary actions that TFSPowershell will execute. 

If necessary, you can call:

```powershell
Clear-RestApiCredentials
```
to clear all stored REST API credentials and set a new one again.

## How to Use

Just call the functions and inform the parameters. Most functions have a CollectionURL parameter. Some of them support pipeline. Consult the [documentation](./Documentation/TFSPowershell.md) for more details.

Example:

```powershell
Update-BuildDefinition -CollectionUrl "https://mysubscription.visualstudio.com" -TeamProjectName "myteamproject" -DefinitionId 58 -BuildDefinitionJsonBody $body
```

## Documentation

[Here](./Documentation/TFSPowershell.md) you will find an online documentation for the function's module.

