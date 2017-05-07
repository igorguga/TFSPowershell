# TFSPowershell Module
## Description
A Powershell module to interact with Team Foundation Server and Visual Studio Team Services. Makes easy to administer and do batch actions in TFS/VSTS.

The functions are grouped the following categories:

- ## TFS
  ### [Get-AllTFSAlerts](Get-AllTFSAlerts.md)
  Retrieves all the Alerts for a given collection.

  ### [Get-GlobalLists](Get-GlobalLists.md)
  Gets the Global list of a given collection.

  ### [Set-GlobalLists](Set-GlobalLists.md)
  {{Manually Enter Set-GlobalLists Description Here}}

  ### [Get-TeamProject](Get-TeamProject.md)
  {{Manually Enter Get-TeamProject Description Here}}

  ### [Get-TeamProjectCollection](Get-TeamProjectCollection.md)
  {{Manually Enter Get-TeamProjectCollection Description Here}}

  ### [New-TFSAlert](New-TFSAlert.md)
  {{Manually Enter New-TFSAlert Description Here}}

  ### [Remove-TFSAlert](Remove-TFSAlert.md)
  {{Manually Enter Remove-TFSAlert Description Here}}

  ### [Remove-TFSAlertById](Remove-TFSAlertById.md)
  {{Manually Enter Remove-TFSAlertById Description Here}}


- ## Source Control
  ### [Add-FolderToTFVC](Add-FolderToTFVC.md)
  {{Manually Enter Add-FolderToTFVC Description Here}}

  ### [Add-ItemToTFVC](Add-ItemToTFVC.md)
  {{Manually Enter Add-ItemToTFVC Description Here}}

  ### [Convert-FolderToBranch](Convert-FolderToBranch.md)
  {{Manually Enter Convert-FolderToBranch Description Here}}

  ### [Destroy-TFVCServerItem](Destroy-TFVCServerItem.md)
  {{Manually Enter Destroy-TFVCServerItem Description Here}}

  ### [Merge-TFVCServerItems](Merge-TFVCServerItems.md)
  {{Manually Enter Merge-TFVCServerItems Description Here}}

  ### [New-Label](New-Label.md)
  {{Manually Enter New-Label Description Here}}

  ### [New-TFVCBrach](New-TFVCBrach.md)
  {{Manually Enter New-TFVCBrach Description Here}}

  ### [Query-Labels](Query-Labels.md)
  {{Manually Enter Query-Labels Description Here}}

  ### [Remove-TFVCServerItem](Remove-TFVCServerItem.md)
  {{Manually Enter Remove-TFVCServerItem Description Here}}

  ### [Rename-TFVCServerItem](Rename-TFVCServerItem.md)
  {{Manually Enter Rename-TFVCServerItem Description Here}}
  

- ## Build
  ### [Get-BuildById](Get-BuildById.md)
  {{Manually Enter Get-BuildById Description Here}}

  ### [Get-BuildDefinition](Get-BuildDefinition.md)
  {{Manually Enter Get-BuildDefinition Description Here}}

  ### [Get-BuildDefinitionBasicInfo](Get-BuildDefinitionBasicInfo.md)
  {{Manually Enter Get-BuildDefinitionBasicInfo Description Here}}

  ### [Get-BuildDefinitionById](Get-BuildDefinitionById.md)
  {{Manually Enter Get-BuildDefinitionById Description Here}}

  ### [Get-BuildDefinitionsFromTeamProject](Get-BuildDefinitionsFromTeamProject.md)
  {{Manually Enter Get-BuildDefinitionsFromTeamProject Description Here}}

  ### [New-BuildDefinition](New-BuildDefinition.md)
  {{Manually Enter New-BuildDefinition Description Here}}

  ### [Queue-Build](Queue-Build.md)
  {{Manually Enter Queue-Build Description Here}}

  ### [Queue-BuildByDefinitionId](Queue-BuildByDefinitionId.md)
  {{Manually Enter Queue-BuildByDefinitionId Description Here}}

  ### [Remove-BuildDefinition](Remove-BuildDefinition.md)
  {{Manually Enter Remove-BuildDefinition Description Here}}

  ### [Remove-BuildDefinitionById](Remove-BuildDefinitionById.md)
  {{Manually Enter Remove-BuildDefinitionById Description Here}}

  ### [Rename-BuildDefinition](Rename-BuildDefinition.md)
  {{Manually Enter Rename-BuildDefinition Description Here}}

  ### [Update-BuildDefinition](Update-BuildDefinition.md)
  {{Manually Enter Update-BuildDefinition Description Here}}


- ## Utils
  ### [Get-RestApiCredentials](Get-RestApiCredentials.md)
  {{Manually Enter Get-RestApiCredentials Description Here}}

  ### [Set-RestApiCredentials](Set-RestApiCredentials.md)
  {{Manually Enter Set-RestApiCredentials Description Here}}

  ### [Set-TFSPowershellTempDir](Set-TFSPowershellTempDir.md)
  {{Manually Enter Set-TFSPowershellTempDir Description Here}}


- ## Project Management
  ### [Get-Team](Get-Team.md)
  {{Manually Enter Get-Team Description Here}}

  ### [Get-TeamSettings](Get-TeamSettings.md)
  {{Manually Enter Get-TeamSettings Description Here}}

  ### [New-Area](New-Area.md)
  {{Manually Enter New-Area Description Here}}
  
  ### [Remove-Area](Remove-Area.md)
  {{Manually Enter Remove-Area Description Here}}

  ### [New-Iteration](New-Iteration.md)
  {{Manually Enter New-Iteration Description Here}}

  ### [Remove-Iteration](Remove-Iteration.md)
  {{Manually Enter Remove-Iteration Description Here}}

  ### [New-Team](New-Team.md)
  {{Manually Enter New-Team Description Here}}

  ### [Update-Team](Update-Team.md)
  {{Manually Enter Update-Team Description Here}}

  ### [Set-TeamDefaultAreaAndIteration](Set-TeamDefaultAreaAndIteration.md)
  {{Manually Enter Set-TeamDefaultAreaAndIteration Description Here}}

  ### [Set-TeamSettings](Set-TeamSettings.md)
  {{Manually Enter Set-TeamSettings Description Here}}
  

- ## Workitems
  ### [Get-WorkItemById](Get-WorkItemById.md)
  {{Manually Enter Get-WorkItemById Description Here}}

  ### [Update-WorkItemField](Update-WorkItemField.md)
  {{Manually Enter Update-WorkItemField Description Here}}

  ### [Destroy-WorkItemById](Destroy-WorkItemById.md)
  {{Manually Enter Destroy-WorkItemById Description Here}}
 

- ## Security
  ### [New-TeamProjectGroup](New-TeamProjectGroup.md)
  {{Manually Enter New-TeamProjectGroup Description Here}}

  ### [Add-MembersToTfsGroup](Add-MembersToTfsGroup.md)
  {{Manually Enter Add-MembersToTfsGroup Description Here}}

  ### [Remove-MembersFromTfsGroup](Remove-MembersFromTfsGroup.md)
  {{Manually Enter Remove-MembersFromTfsGroup Description Here}}

  ### [Remove-TeamProjectGroup](Remove-TeamProjectGroup.md)
  {{Manually Enter Remove-TeamProjectGroup Description Here}}

  ### [Set-AreaPermissions](Set-AreaPermissions.md)
  {{Manually Enter Set-AreaPermissions Description Here}}

  ### [Set-BuildDefinitionPermissions](Set-BuildDefinitionPermissions.md)
  {{Manually Enter Set-BuildDefinitionPermissions Description Here}}

  ### [Set-BuildDefinitionPermissionsByIds](Set-BuildDefinitionPermissionsByIds.md)
  {{Manually Enter Set-BuildDefinitionPermissionsByIds Description Here}}

  ### [Set-BuildDefinitionPermissionsByTeamProjectOMApi](Set-BuildDefinitionPermissionsByTeamProjectOMApi.md)
  {{Manually Enter Set-BuildDefinitionPermissionsByTeamProjectOMApi Description Here}}

  ### [Set-IterationPermissions](Set-IterationPermissions.md)
  {{Manually Enter Set-IterationPermissions Description Here}}

  ### [Set-SourceControlPermissions](Set-SourceControlPermissions.md)
  {{Manually Enter Set-SourceControlPermissions Description Here}}





