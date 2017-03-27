#Assemblies folder for TFS Object Model Client
$rootPath = $PSScriptRoot
$AssembliesDir = "$rootPath\Assemblies"

#Path to external tools used in this module
$TfsSecurityToolPath = "$AssembliesDir\TFSSecurity.exe" 
$TfToolPath = "$AssembliesDir\tf.exe"

Add-Type -Path "$AssembliesDir\Microsoft.TeamFoundation.Client.dll",
               "$AssembliesDir\Microsoft.TeamFoundation.Common.dll"


# .ExternalHelp .\MAML\TFSPowershell.Security.Help.xml
Function Set-AreaPermissions
{
    [CmdletBinding()]
    Param (
        [Parameter(mandatory=$true)]
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [string] $TeamProjectName,

        [Parameter(mandatory=$true,HelpMessage ="Area path without the Team Project.(Ex.: \Area 1\Sub-area 3).")]
        [string] $AreaPath,
        
        [Parameter(mandatory=$true, HelpMessage ="Users and/or groups to grant permissions.")]
        [string []] $Members,

        [Parameter(mandatory=$true,HelpMessage ="WORK_ITEM_READ,WORK_ITEM_WRITE,GENERIC_READ,GENERIC_WRITE,CREATE_CHILDREN,DELETE,MANAGE_TEST_PLANS")]
        [ValidateSet('WORK_ITEM_READ','WORK_ITEM_WRITE','GENERIC_READ','GENERIC_WRITE','CREATE_CHILDREN','DELETE','MANAGE_TEST_PLANS')]
		[string []] $Actions,

        [switch] $Deny = $false,
               
        [string] $AreaURI = "",

        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )

    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

    if ($AreaURI -eq "")
    {
        $cssService = $Tfs.GetService("Microsoft.TeamFoundation.Server.ICommonStructureService4")

        $areaFullPath = "\$TeamProjectName\Area" + $AreaPath
        $areaNode = $cssService.GetNodeFromPath($areaFullPath)
        $AreaUri = $areaNode.Uri
    }

    $permission = if ($Deny -eq $true) {'Deny'} else {'ALLOW'} 

    foreach ($member in $Members)
    {
        foreach ($Action in $Actions)
        {
            $command = '& "{0}" /a+ CSS "{1}" {2} n:"{3}" {4} /collection:"{5}"' -f $TfsSecurityToolPath, $AreaURI, $Action ,$member, $permission, $CollectionUrl
            Invoke-Expression $command 
        }
    }
}

# .ExternalHelp .\MAML\TFSPowershell.Security.Help.xml
Function Set-IterationPermissions
{
    [CmdletBinding()]
    Param (
        [Parameter(mandatory=$true)]
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [string] $TeamProjectName,

        [Parameter(mandatory=$true,HelpMessage ="Caminho da iteração, sem incluir o team project (Ex.: \Iteration 1\sprint 3).")]
        [string] $IterationPath,
        
        [Parameter(mandatory=$true, HelpMessage ="Usuários ou grupos para conceder a permiss�o.")]
        [string []] $Members,

        [Parameter(mandatory=$true,HelpMessage ="GENERIC_READ,GENERIC_WRITE,CREATE_CHILDREN,DELETE")]
		[ValidateSet('GENERIC_READ','GENERIC_WRITE','CREATE_CHILDREN','DELETE')]
        [string []] $Actions,

        [switch] $Deny = $false,

        [string] $IterationUri = "",          

        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )
    

    if ($IterationUri -eq "")
    {
        if ($Tfs -eq $null)
        {
            $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
        }

        $cssService = $Tfs.GetService("Microsoft.TeamFoundation.Server.ICommonStructureService4")

        $iterationFullPath = "\$TeamProjectName\Iteration" + $IterationPath
        $iterationNode = $cssService.GetNodeFromPath($iterationFullPath)
        $IterationUri = $iterationNode.Uri
    }

    $permission = if ($Deny -eq $true) {'Deny'} else {'ALLOW'} 

    foreach ($member in $Members)
    {
        foreach ($Action in $Actions)
        {
            $command = '& "{0}" /a+ Iteration "{1}" {2} n:"{3}" {4} /collection:"{5}"' -f $TfsSecurityToolPath, $IterationUri, $Action ,$member, $permission, $CollectionUrl
            Invoke-Expression $command 
        }
    }
}

# .ExternalHelp .\MAML\TFSPowershell.Security.Help.xml
Function New-TeamProjectGroup
{
    [CmdletBinding()]
    Param (
        [Parameter(mandatory=$true)]
        [string] $CollectionUrl, 

        [string] $TeamProjectName, 

        [Parameter(mandatory=$true)]
        [string] $Group,

        [string] $Description = "",

        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null,

        $TeamProject = $null
    )

    if ($TeamProject -eq $null)
    {
        if ($Tfs -eq $null)
        {
            $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
        }  

        $TeamProject = Get-TeamProject -CollectionUrl $CollectionUrl -TeamProjectName $TeamProjectName -Tfs $TFS
    }

    $command = '& "{0}" /gc {1} "{2}" "{3}" /collection:"{4}"' -f $TfsSecurityToolPath, $TeamProject.URI, $Group, $Description, $CollectionUrl
    Invoke-Expression $command 

}

# .ExternalHelp .\MAML\TFSPowershell.Security.Help.xml
Function Remove-TeamProjectGroup
{
    [CmdletBinding()]
    Param (
        [Parameter(mandatory=$true)]
        [string] $CollectionUrl, 

        [string] $TeamProjectName, 

        [Parameter(mandatory=$true)]
        [string] $Group
     )

    $command = '& "{0}" /gd "[{1}]\{2}" /collection:"{3}"' -f $TfsSecurityToolPath, $TeamProjectName, $Group, $CollectionUrl
    Invoke-Expression $command 
}

# .ExternalHelp .\MAML\TFSPowershell.Security.Help.xml
Function Add-MembersToTfsGroup
{
    [CmdletBinding()]
    Param (
        [Parameter(mandatory=$true)]
        [string] $CollectionUrl, 

        [Parameter(mandatory=$true)]
        [string] $Group,

        [Parameter(mandatory=$true,ValueFromPipeline=$True)]
        [string[]] $Members
    )

    Process
    {
        foreach( $member in $Members)
        {
            $command = '& "{0}" /g+ "{1}" n:"{2}" /collection:"{3}"' -f $TfsSecurityToolPath, $Group, $member, $CollectionUrl 
            Invoke-Expression $command 
        }
    }
}

# .ExternalHelp .\MAML\TFSPowershell.Security.Help.xml
Function Remove-MembersFromTfsGroup
{
    [CmdletBinding()]
    Param (
        [Parameter(mandatory=$true)]
        [string] $CollectionUrl, 

        [Parameter(mandatory=$true)]
        [string] $Group,

        [Parameter(mandatory=$true,ValueFromPipeline=$True)]
        [string[]] $Members
    )

    Process
    {
        foreach( $member in $Members)
        {
            $command = '& "{0}" /g- "{1}" n:"{2}" /collection:"{3}"' -f $TfsSecurityToolPath, $Group, $member, $CollectionUrl 
            Invoke-Expression $command 
        }
    }
}

# .ExternalHelp .\MAML\TFSPowershell.Security.Help.xml
Function Set-SourceControlPermissions
{
    [CmdletBinding()]
    Param (
        [Parameter(mandatory=$true)]
        [string] $CollectionUrl,

        [Parameter(mandatory=$true,
                   ValueFromPipeline=$True, 
                   HelpMessage ="Caminho da area, sem incluir o team project (Ex.: \Area 1\Sub-area 3).")]
        [string []] $ServerPaths,
        
        [Parameter(mandatory=$true, HelpMessage ="Usuários ou grupos (separados por vírgula) para conceder a permissão. Não pode misturar usuários e grupos.")]
        [string] $Members,

        [Parameter(mandatory=$true, HelpMessage ="Indicar se o par�metro membros constitui-se de Grupos ou Usu�rios.")]
        [switch] $IsMembersGroups = $false,

        [Parameter(mandatory=$true,HelpMessage ="Read,PendChange,Checkin,Label,Lock,ReviseOther,UnlockOther,UndoOther,LabelOther,CheckinOther,Merge,ManageBranch or * for all")]
        [ValidateSet('Read','PendChange','Checkin','Label','Lock','ReviseOther','UnlockOther','UndoOther','LabelOther','CheckinOther','Merge','ManageBranch','*')]
		[string []] $Permissions,

        [switch] $Deny = $false
    )
    Begin
    {
        $action = if ($Deny -eq $true) {'Deny'} else {'ALLOW'} 
        $scope = if ($IsMembersGroups -eq $true) {'Group'} else {'User'}
    }
    Process
    {
        foreach ($path in $ServerPaths)
        {
			foreach ($permission in $Permissions)
			{
				$command = '& "{0}" permission /{1}:{2} /{3}:"{4}" /collection:"{5}" "{6}"' -f $TfToolPath, $action, $permission, $Scope, $Members,$CollectionUrl,$path
				Invoke-Expression $command 
			}
        }
    }
}

# .ExternalHelp .\MAML\TFSPowershell.Security.Help.xml
Function Set-BuildDefinitionPermissions
{
    [CmdletBinding()]
    Param (
        [Parameter(mandatory=$true)]
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [string] $TeamProjectName,

        [Parameter(mandatory=$true,HelpMessage ="Build definition Name.")]
        [string] $BuildDefinitionName,
        
        [Parameter(mandatory=$true, HelpMessage ="Users or groups to grant permission.")]
        [string []] $Members,

        [Parameter(mandatory=$true,HelpMessage ="ViewBuilds, EditBuildQuality, RetainIndefinitely, DeleteBuilds, ManageBuildQualities, DestroyBuilds, UpdateBuildInformation, QueueBuilds, ManageBuildQueue, StopBuilds, ViewBuildDefinition, EditBuildDefinition, DeleteBuildDefinition, OverrideBuildCheckInValidation, AdministerBuildPermissions")]
        [ValidateSet('ViewBuilds', 'EditBuildQuality', 'RetainIndefinitely', 'DeleteBuilds', 'ManageBuildQualities', 'DestroyBuilds', 'UpdateBuildInformation', 'QueueBuilds', 'ManageBuildQueue', 'StopBuilds', 'ViewBuildDefinition', 'EditBuildDefinition', 'DeleteBuildDefinition', 'OverrideBuildCheckInValidation', 'AdministerBuildPermissions')]
		[string []] $Actions,

        [switch] $Deny = $false,

        [pscredential] $Credential = $null
    )
    
    Begin
    {
		if (!$Credentials)
		{
			$Credential = Get-RestApiCredentials 
		}
    }

    End
    {
        $build = Get-BuildDefinitionBasicInfo -CollectionUrl $CollectionUrl -TeamProjectName $TeamProjectName -BuildDefinitionName $BuildDefinitionName -Credentials $Credential
        
        if ($build -eq $null)
        {
            Write-Error "Build definition $BuildDefinitionName n�o encontrado no team project $TeamProjectName."
            return
        }
        
        $buildDefinitionToken = "$($build.project.id)/$($build.id)"
        $permission = if ($Deny -eq $true) {'Deny'} else {'ALLOW'} 

        foreach ($member in $Members)
        {
            foreach ($Action in $Actions)
            {
                $command = '& "{0}" /a+ Build "{1}" {2} n:"{3}" {4} /collection:"{5}"' -f $TfsSecurityToolPath, $buildDefinitionToken, $Action ,$member, $permission, $CollectionUrl
                Invoke-Expression $command 
            }
        }
    }
}

# .ExternalHelp .\MAML\TFSPowershell.Security.Help.xml
Function Set-BuildDefinitionPermissionsByIds
{
    [CmdletBinding()]
    Param (
        [Parameter(mandatory=$true)]
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [string] $TeamProjectGuid,

        [Parameter(mandatory=$true,HelpMessage ="Build definition Id. Browse to the desired build definition and get the last number in the URL.")]
        [int] $BuildDefinitionId,
        
        [Parameter(mandatory=$true, HelpMessage ="Users and groups to grant permission.")]
        [string []] $Members,

        [Parameter(mandatory=$true,HelpMessage ="ViewBuilds, EditBuildQuality, RetainIndefinitely, DeleteBuilds, ManageBuildQualities, DestroyBuilds, UpdateBuildInformation, QueueBuilds, ManageBuildQueue, StopBuilds, ViewBuildDefinition, EditBuildDefinition, DeleteBuildDefinition, OverrideBuildCheckInValidation, AdministerBuildPermissions")]
        [ValidateSet('ViewBuilds', 'EditBuildQuality', 'RetainIndefinitely', 'DeleteBuilds', 'ManageBuildQualities', 'DestroyBuilds', 'UpdateBuildInformation', 'QueueBuilds', 'ManageBuildQueue', 'StopBuilds', 'ViewBuildDefinition', 'EditBuildDefinition', 'DeleteBuildDefinition', 'OverrideBuildCheckInValidation', 'AdministerBuildPermissions')]
		[string []] $Actions,

        [switch] $Deny = $false
    )
    
    $buildDefinitionToken = "$TeamProjectGuid/$BuildDefinitionId"
    $permission = if ($Deny -eq $true) {'Deny'} else {'ALLOW'} 

    foreach ($member in $Members)
    {
        foreach ($Action in $Actions)
        {
            $command = '& "{0}" /a+ Build "{1}" {2} n:"{3}" {4} /collection:"{5}"' -f $TfsSecurityToolPath, $buildDefinitionToken, $Action ,$member, $permission, $CollectionUrl
            Invoke-Expression $command 
        }
    }
}

# .ExternalHelp .\MAML\TFSPowershell.Security.Help.xml
Function Set-BuildDefinitionPermissionsByTeamProjectOMApi
{
    [CmdletBinding()]
    Param (
        [Parameter(mandatory=$true)]
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [string] $TeamProjectName,

        [Parameter(mandatory=$true,HelpMessage ="Build definition Id. Browse to the desired build definition and get the last number in the URL.")]
        [int] $BuildDefinitionId,
        
        [Parameter(mandatory=$true, HelpMessage = "Users and groups to grant permission.")]
        [string []] $Members,

        [Parameter(mandatory=$true,HelpMessage ="ViewBuilds, EditBuildQuality, RetainIndefinitely, DeleteBuilds, ManageBuildQualities, DestroyBuilds, UpdateBuildInformation, QueueBuilds, ManageBuildQueue, StopBuilds, ViewBuildDefinition, EditBuildDefinition, DeleteBuildDefinition, OverrideBuildCheckInValidation, AdministerBuildPermissions")]
        [ValidateSet('ViewBuilds', 'EditBuildQuality', 'RetainIndefinitely', 'DeleteBuilds', 'ManageBuildQualities', 'DestroyBuilds', 'UpdateBuildInformation', 'QueueBuilds', 'ManageBuildQueue', 'StopBuilds', 'ViewBuildDefinition', 'EditBuildDefinition', 'DeleteBuildDefinition', 'OverrideBuildCheckInValidation', 'AdministerBuildPermissions')]
		[string []] $Actions,

        [switch] $Deny = $false,

        [string] $TeamProjectGuid = "",          

        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )
    
    if ($TeamProjectGuid -eq "")
    {
        if ($Tfs -eq $null)
        {
            $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
        }  

        $TeamProject = Get-TeamProject -CollectionUrl $CollectionUrl -TeamProjectName $TeamProjectName -Tfs $TFS
        $teamProjUriArray = $TeamProject.Uri -split "/"
        $TeamProjectGuid = $teamProjUriArray[$($teamProjUriArray.Count - 1)]
    }
  
    $buildDefinitionToken = "$TeamProjectGuid/$BuildDefinitionId"
    $permission = if ($Deny -eq $true) {'Deny'} else {'ALLOW'} 

    foreach ($member in $Members)
    {
        foreach ($Action in $Actions)
        {
            $command = '& "{0}" /a+ Build "{1}" {2} n:"{3}" {4} /collection:"{5}"' -f $TfsSecurityToolPath, $buildDefinitionToken, $Action ,$member, $permission, $CollectionUrl
            Invoke-Expression $command 
        }
    }
}