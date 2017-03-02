#Assemblies folder for TFS Object Model Client
$rootPath = $PSScriptRoot
$AssembliesDir = "$rootPath\..\Assemblies"

Add-Type -Path "$AssembliesDir\Microsoft.TeamFoundation.Client.dll",
               "$AssembliesDir\Microsoft.TeamFoundation.Common.dll",
               "$AssembliesDir\Microsoft.TeamFoundation.ProjectManagement.dll"

# .ExternalHelp TFSPowershell.ProjectManagement.psm1-Help.xml
Function New-Team
{
    [CmdletBinding()]
    Param (
        
        [string] $CollectionUrl,

        [string] $TeamProjectName,

        [Parameter(mandatory=$true)]
        [string] $TeamName,

        [string] $Description = "",

        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null,

        $TeamProject = $null
    )
    
    if ($TFS -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

    if ($TeamProject -eq $null)
    {
        $TeamProject = Get-TeamProject -CollectionUrl $CollectionUrl -TeamProjectName $TeamProjectName -Tfs $TFS
    }

    # Create Team
    Write-Verbose "Creating team $TeamName..." 
    
    $teamService = $tfs.GetService("Microsoft.TeamFoundation.Client.TfsTeamService")
    $Team = $teamService.CreateTeam($TeamProject.Uri, $TeamName, $Description, $null) 
    Write-Output $Team 

    Write-Verbose "Done!"    
 
}

# .ExternalHelp TFSPowershell.ProjectManagement.psm1-Help.xml
Function New-Area
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [string] $TeamProjectName,

        [Parameter(mandatory=$true)]
        [string] $AreaName,
        
        #Path from the team project name, including '\'
        [string] $ParentPath ="",

        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )

    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

    $cssService = $Tfs.GetService("Microsoft.TeamFoundation.Server.ICommonStructureService4")

    $areaParentPath = "\$TeamProjectName\Area" + $ParentPath
    $areaParentNode = $cssService.GetNodeFromPath($areaParentPath)
    $areaURI = $cssService.CreateNode($AreaName,$areaParentNode.Uri)

    Write-Output $areaURI
}

# .ExternalHelp TFSPowershell.ProjectManagement.psm1-Help.xml
Function New-Iteration
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [string] $TeamProjectName,

        [Parameter(mandatory=$true)]
        [string] $IterationName,
        
        #Path from the team project name, including '\'
        [string] $ParentPath ="",

        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )

    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

    $cssService = $Tfs.GetService("Microsoft.TeamFoundation.Server.ICommonStructureService4")


    $iterationParentPath = "\$TeamProjectName\Iteration" + $ParentPath
    $iterationParentNode = $cssService.GetNodeFromPath($iterationParentPath)
    $iterationURI = $cssService.CreateNode($IterationName,$iterationParentNode.Uri)

    Write-Output $iterationURI
}

# .ExternalHelp TFSPowershell.ProjectManagement.psm1-Help.xml
Function Get-Team
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [string]$TeamProjectName,

		[Parameter(mandatory=$true)]
        [string] $TeamName,
        
        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )

    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

	$TeamProject = Get-TeamProject -CollectionUrl $CollectionUrl -TeamProjectName $TeamProjectName -Tfs $TFS
	$teamService = $tfs.GetService("Microsoft.TeamFoundation.Client.TfsTeamService")
	$team = $teamService.ReadTeam($TeamProject.Uri, $TeamName,@('Description'))

    Write-Output $team
}

# .ExternalHelp TFSPowershell.ProjectManagement.psm1-Help.xml
Function Get-TeamSettings
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [Microsoft.TeamFoundation.Client.TeamFoundationTeam]$Team,
        
        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )

    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

    $teamSettingsService = $Tfs.GetService("Microsoft.TeamFoundation.ProcessConfiguration.Client.TeamSettingsConfigurationService")
    $teamIds = New-Object Collections.Generic.List[Guid]
    $teamIds.Add($Team.Identity.TeamFoundationId)
    $teamConfigurations = $teamSettingsService.GetTeamConfigurations($teamIds)
    Write-Output $teamConfigurations
}

# .ExternalHelp TFSPowershell.ProjectManagement.psm1-Help.xml
Function Update-Team
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [Microsoft.TeamFoundation.Client.TeamFoundationTeam]$Team,
        
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )
    
    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

	$teamService = $tfs.GetService("Microsoft.TeamFoundation.Client.TfsTeamService")
	$teamService.UpdateTeam($Team)
}

# .ExternalHelp TFSPowershell.ProjectManagement.psm1-Help.xml
Function Set-TeamSettings
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [Guid]$TeamId,

        [Parameter(mandatory=$true)]
        [ Microsoft.TeamFoundation.ProcessConfiguration.Client.TeamSettings]$TeamSettings,
        
        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )

    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

    $teamSettingsService = $Tfs.GetService("Microsoft.TeamFoundation.ProcessConfiguration.Client.TeamSettingsConfigurationService")
    $teamSettingsService.SetTeamSettings($TeamId,$TeamSettings)
}

# .ExternalHelp TFSPowershell.ProjectManagement.psm1-Help.xml
Function Set-TeamDefaultAreaAndIteration
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [Microsoft.TeamFoundation.Client.TeamFoundationTeam]$Team,

        [Parameter(mandatory=$true)]
        [string]$IterationPath,

        [Parameter(mandatory=$true)]
        [string]$AreaPath,
        
        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )
    
    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

    Write-Verbose "Retrieving Team Configurations..."
    $teamConfigurations = Get-TeamSettings -Tfs $Tfs -Team $Team
    
    Write-Verbose "Setting Iteration path..."
    $teamSettings = $teamConfigurations[0].TeamSettings
    $teamSettings.BacklogIterationPath = "$IterationPath"
    $teamSettings.IterationPaths = @("$IterationPath")

    Write-Verbose "Setting Area path..."
    $tfv = New-Object  Microsoft.TeamFoundation.ProcessConfiguration.Client.TeamFieldValue
    $tfv.IncludeChildren = $true
    $tfv.Value = "$AreaPath"
    $teamSettings.TeamFieldValues = @($tfv);

    Write-Verbose "Updating Team Settings..."
    Set-TeamSettings -Tfs $Tfs -TeamId $Team.Identity.TeamFoundationId -TeamSettings $teamSettings
    Write-Verbose "Done!"
}

# .ExternalHelp TFSPowershell.ProjectManagement.psm1-Help.xml
Function Remove-Area
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [string] $TeamProjectName,

        [Parameter(mandatory=$true,HelpMessage="Area path from the team project name. Ex.: beeing area path 'teamproject\area\sub-are'a so you have to inform '\area\sub-area'.")]
        [string] $AreaPathWithoutTeamProjectName,
        
        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )

    Write-Verbose "Connecting to TFS..."
    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

    $cssService = $Tfs.GetService("Microsoft.TeamFoundation.Server.ICommonStructureService4")

    Write-Verbose "Retrieving the area..."
    $areaPath = "\$TeamProjectName\Area" + $AreaPathWithoutTeamProjectName
    $areaNode = $cssService.GetNodeFromPath($areaPath)

    Write-Verbose "Retrieving the path to the parent area node..."
    $areaParentPath = Split-Path $areaPath -Parent
    $areaParentNode = $cssService.GetNodeFromPath($areaParentPath)

    Write-Verbose "Removing the area and linking workitems to the parent node..."
    $cssService.DeleteBranches(@($areaNode.Uri),$areaParentNode.Uri)
}

# .ExternalHelp TFSPowershell.ProjectManagement.psm1-Help.xml
Function Remove-Iteration
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [string] $TeamProjectName,

        [Parameter(mandatory=$true,HelpMessage="Iteration path apartir do nome do Team Project Ex.: sendo iteration path 'teamproject\Iteration0\Sprint1'a então deve-se informar '\Iteration0\Sprint1'.")]
        [string] $IterationPathWithoutTeamProjectName,
        
        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )

    Write-Verbose "Connecting to TFS..."
    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

    $cssService = $Tfs.GetService("Microsoft.TeamFoundation.Server.ICommonStructureService4")

    Write-Verbose "Retrieving the Iteration..."
    $iterationPath = "\$TeamProjectName\Iteration" + $IterationPathWithoutTeamProjectName
    $iterationNode = $cssService.GetNodeFromPath($iterationPath)

    Write-Verbose "Retrieving the path to the parent iteration..."
    $iterationParentPath = Split-Path $iterationPath -Parent
    $iterationParentNode = $cssService.GetNodeFromPath($iterationParentPath)

    Write-Verbose "Removing the iteration and linking Workitems to the parent node..."
    $cssService.DeleteBranches(@($iterationNode.Uri),$iterationParentNode.Uri)
}