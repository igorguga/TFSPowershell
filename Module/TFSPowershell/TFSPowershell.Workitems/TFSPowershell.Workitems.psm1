#Assemblies folder for TFS Object Model Client
$rootPath = $PSScriptRoot
$AssembliesDir = "$rootPath\..\Assemblies"

Add-Type -Path  "$AssembliesDir\Microsoft.IdentityModel.Clients.ActiveDirectory.dll",
                "$AssembliesDir\Microsoft.IdentityModel.Clients.ActiveDirectory.WindowsForms.dll",                           
                "$AssembliesDir\Microsoft.ServiceBus.dll",
                "$AssembliesDir\Microsoft.TeamFoundation.Client.dll",                   
                "$AssembliesDir\Microsoft.TeamFoundation.Common.dll",                   
                "$AssembliesDir\Microsoft.TeamFoundation.Controls.dll",                 
                "$AssembliesDir\Microsoft.TeamFoundation.Core.WebApi.dll",              
                "$AssembliesDir\Microsoft.TeamFoundation.Diff.dll",                    
                "$AssembliesDir\Microsoft.TeamFoundation.Sync.Mapping.dll",             
                "$AssembliesDir\Microsoft.TeamFoundation.Sync.Project.Server.Library.dll",                                                    
                "$AssembliesDir\Microsoft.TeamFoundation.Sync.ProjectServerApi.dll",    
                "$AssembliesDir\Microsoft.TeamFoundation.Sync.Shared.dll",              
                "$AssembliesDir\Microsoft.TeamFoundation.VersionControl.Client.dll",    
                "$AssembliesDir\Microsoft.TeamFoundation.VersionControl.Common.dll",    
                "$AssembliesDir\Microsoft.TeamFoundation.WorkItemTracking.Client.DataStoreLoader.dll",                                        
                "$AssembliesDir\Microsoft.TeamFoundation.WorkItemTracking.Client.dll",  
                "$AssembliesDir\Microsoft.TeamFoundation.WorkItemTracking.Client.QueryLanguage.dll",                                          
                "$AssembliesDir\Microsoft.TeamFoundation.WorkItemTracking.Common.dll",  
                "$AssembliesDir\Microsoft.TeamFoundation.WorkItemTracking.Controls.dll",
                "$AssembliesDir\Microsoft.TeamFoundation.WorkItemTracking.ControlsCore.dll",                                                  
                "$AssembliesDir\Microsoft.TeamFoundation.WorkItemTracking.Proxy.dll" ,  
                "$AssembliesDir\Microsoft.VisualStudio.Services.Client.dll",            
                "$AssembliesDir\Microsoft.VisualStudio.Services.Common.dll",            
                "$AssembliesDir\Microsoft.VisualStudio.Services.WebApi.dll",                                                          
                "$AssembliesDir\Newtonsoft.Json.dll",                                   
                "$AssembliesDir\System.Net.Http.Formatting.dll"

# .ExternalHelp TFSPowershell.Workitems.Help.xml
Function Get-WorkItemById
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [int] $WorkitemId,

        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )

    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }
  
    $workItemStore = $Tfs.GetService("Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItemStore")
    Write-Output $workItemStore.GetWorkItem($WorkitemId);
}

# .ExternalHelp TFSPowershell.Workitems.Help.xml
Function Update-WorkItemField
{ 
    Write-Warning "Function not yet implemented!!"
}

# .ExternalHelp TFSPowershell.Workitems.Help.xml
Function Destroy-WorkItemById
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [int] $WorkitemId,

        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )


    if ($Tfs -eq $null)
    {
        Write-Verbose "Connecting to TFS..."
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }
    
    Write-Verbose "Destroying the Workitem $WorkitemId..."
    $workItemStore = $Tfs.GetService("Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItemStore")
    $workItems = New-Object Collections.Generic.List[int]
    $workItems.Add($WorkitemId)
    $workItemStore.DestroyWorkItems($workItems)
    Write-Verbose "Done!"
}
