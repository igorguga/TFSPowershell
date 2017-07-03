# TFSPowershell Module
## Description
A Powershell module to interact with Team Foundation Server and Visual Studio Team Services entities. Makes easy to administer and do batch actions in TFS/VSTS.

The functions are grouped in the following Modules:

- ## TFS
  ### [Get-AllTFSAlerts](Get-AllTFSAlerts.md)
  ### [Get-GlobalLists](Get-GlobalLists.md)
  ### [Set-GlobalLists](Set-GlobalLists.md)
  ### [Get-TeamProject](Get-TeamProject.md)
  ### [Get-TeamProjectCollection](Get-TeamProjectCollection.md)
  ### [New-TFSAlert](New-TFSAlert.md)
  ### [Remove-TFSAlert](Remove-TFSAlert.md)
  ### [Remove-TFSAlertById](Remove-TFSAlertById.md)

- ## Source Control
  ### [Add-FolderToTFVC](Add-FolderToTFVC.md)
  ### [Add-ItemToTFVC](Add-ItemToTFVC.md)
  ### [Convert-FolderToBranch](Convert-FolderToBranch.md)
  ### [Destroy-TFVCServerItem](Destroy-TFVCServerItem.md)
  ### [Merge-TFVCServerItems](Merge-TFVCServerItems.md)
  ### [New-Label](New-Label.md)
  ### [New-TFVCBrach](New-TFVCBrach.md)
  ### [Query-Labels](Query-Labels.md)
  ### [Remove-TFVCServerItem](Remove-TFVCServerItem.md)
  ### [Rename-TFVCServerItem](Rename-TFVCServerItem.md)

- ## Build *(uses TFS/VSTS REST APIs)*
  ### [Get-BuildById](Get-BuildById.md)
  ### [Get-BuildDefinition](Get-BuildDefinition.md)
  ### [Get-BuildDefinitionBasicInfo](Get-BuildDefinitionBasicInfo.md)
  ### [Get-BuildDefinitionById](Get-BuildDefinitionById.md)
  ### [Get-BuildDefinitionsFromTeamProject](Get-BuildDefinitionsFromTeamProject.md)
  ### [New-BuildDefinition](New-BuildDefinition.md)
  ### [Queue-Build](Queue-Build.md)
  ### [Queue-BuildByDefinitionId](Queue-BuildByDefinitionId.md)
  ### [Remove-BuildDefinition](Remove-BuildDefinition.md)
  ### [Remove-BuildDefinitionById](Remove-BuildDefinitionById.md)
  ### [Rename-BuildDefinition](Rename-BuildDefinition.md)
  ### [Update-BuildDefinition](Update-BuildDefinition.md)

- ## Utils
  ### [Get-RestApiCredentials](Get-RestApiCredentials.md)
  ### [Set-RestApiCredentials](Set-RestApiCredentials.md)
  ### [Set-TFSPowershellTempDir](Set-TFSPowershellTempDir.md)
  ### [Clear-RestAPICredentials](Clear-RestAPICredentials.md)
  ### [Invoke-RestAPICall](Invoke-RestAPICall.md)
  

- ## Project Management
  ### [Get-Team](Get-Team.md)
  ### [Get-TeamSettings](Get-TeamSettings.md)
  ### [New-Area](New-Area.md)
  ### [Remove-Area](Remove-Area.md)
  ### [New-Iteration](New-Iteration.md)
  ### [Remove-Iteration](Remove-Iteration.md)
  ### [New-Team](New-Team.md)
  ### [Update-Team](Update-Team.md)
  ### [Set-TeamDefaultAreaAndIteration](Set-TeamDefaultAreaAndIteration.md)
  ### [Set-TeamSettings](Set-TeamSettings.md)

- ## Workitems
  ### [Get-WorkItemById](Get-WorkItemById.md)
  ### [Update-WorkItemField](Update-WorkItemField.md)
  ### [Destroy-WorkItemById](Destroy-WorkItemById.md)

- ## Security *(uses TF.exe and TFSSecurity.exe)*
  ### [New-TeamProjectGroup](New-TeamProjectGroup.md)
  ### [Add-MembersToTfsGroup](Add-MembersToTfsGroup.md)
  ### [Remove-MembersFromTfsGroup](Remove-MembersFromTfsGroup.md)
  ### [Remove-TeamProjectGroup](Remove-TeamProjectGroup.md)
  ### [Set-AreaPermissions](Set-AreaPermissions.md)
  ### [Set-BuildDefinitionPermissions](Set-BuildDefinitionPermissions.md)
  ### [Set-BuildDefinitionPermissionsByIds](Set-BuildDefinitionPermissionsByIds.md)
  ### [Set-BuildDefinitionPermissionsByTeamProjectOMApi](Set-BuildDefinitionPermissionsByTeamProjectOMApi.md)
  ### [Set-IterationPermissions](Set-IterationPermissions.md)
  ### [Set-SourceControlPermissions](Set-SourceControlPermissions.md)

- ## Service EndPoints *(uses TFS/VSTS REST APIs)*
  ### [Get-ServiceEndpoints](Get-ServiceEndpoints.md)
  ### [New-ServiceEndpoint](New-ServiceEndpoint.md)