if ($Env:TFSPowershellTempDirLocation -ne $null) { $TempDirLocation = $Env:TFSPowershellTempDirLocation } else { $TempDirLocation = "$Env:USERPROFILE" }


#Assemblies folder for TFS Object Model Client
$rootPath = $PSScriptRoot
$AssembliesDir = "$rootPath\Assemblies"

Add-Type -Path "$AssembliesDir\Microsoft.TeamFoundation.VersionControl.Client.dll"

# .ExternalHelp .\MAML\TFSPowershell.SourceControl.Help.xml
Function Convert-FolderToBranch
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true,HelpMessage="Caminho no servidor para a pasta a ser convertida em branch.")]
        [string] $FolderServerPath,        

        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )

    Write-Verbose "Connecting to TFS..."
    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }
    $versionControlService =  $Tfs.GetService("Microsoft.TeamFoundation.VersionControl.Client.VersionControlServer")

    Write-Verbose "Retrieving the folder $FolderServerPath..."
    $itemIdentifier = New-Object  Microsoft.TeamFoundation.VersionControl.Client.ItemIdentifier($FolderServerPath)
    $branchProperties = New-Object Microsoft.TeamFoundation.VersionControl.Client.BranchProperties($itemIdentifier)

    Write-Verbose "Converting the folder to branch..."
    $versionControlService.CreateBranchObject($branchProperties)
    Write-Verbose "Done!"
}

# .ExternalHelp .\MAML\TFSPowershell.SourceControl.Help.xml
Function Add-FolderToTFVC
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true,HelpMessage="Caminho no servidor no qual a pasta será adicionada.")]
        [string] $ServerPathToAddFolder,

        [Parameter(mandatory=$true)]
        [string] $LocalFolderPath,  
        
        [Parameter(mandatory=$true)]
        [string] $CheckinDescription = "",            

        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )
     
    Write-Verbose "Connecting to TFS..."
    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

    $versionControlService =  $tfs.GetService("Microsoft.TeamFoundation.VersionControl.Client.VersionControlServer")

    Write-Verbose "Creating a temporary workspace to execute the operation..."
    $workspace = $versionControlService.CreateWorkspace([Guid]::NewGuid().ToString())
     
    Write-Verbose "Retrieving the parent folder of the folder to be added..."
    $parentLocalFolder = Split-Path $LocalFolderPath -Parent

    Write-Verbose "Mapping ""$ServerPathToAddFolder"" to ""$parentLocalFolder""..."
    $workspace.Map($ServerPathToAddFolder,$parentLocalFolder)

    Write-Verbose "Adding the folder and all your contents to the version control..."
    $workspace.PendAdd($LocalFolderPath,$true)

    Write-Verbose "Retrieving the changes to do the check-in..."
    $pendingChanges = $workspace.GetPendingChanges()

    Write-Verbose "Check-in the folder..."
    $workspace.CheckIn($pendingChanges, $CheckinDescription)
    
    Write-Verbose "Removing the temporary workspace created..."
    $workspace.Delete()

    Write-Verbose "Done!"
}

# .ExternalHelp .\MAML\TFSPowershell.SourceControl.Help.xml
Function Add-ItemToTFVC
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true,HelpMessage="Caminho no servidor no qual o item será adicionado.",ValueFromPipelineByPropertyName=$True)]
        [string] $ServerPathToAddItem,

        [Parameter(mandatory=$true,ValueFromPipelineByPropertyName=$True)]
        [string] $LocalItemPath,  
        
        [Parameter(mandatory=$true)]
        [string] $CheckinDescription = "",            

        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )
    begin
    { 
        Write-Verbose "Connecting to TFS..."
        if ($Tfs -eq $null)
        {
            $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
        }

        $versionControlService =  $tfs.GetService("Microsoft.TeamFoundation.VersionControl.Client.VersionControlServer")

        Write-Verbose "Creating a temporary workspace to execute the operation..."
        $workspace = $versionControlService.CreateWorkspace([Guid]::NewGuid().ToString())

        $countItemsAdded = 0
    }
    Process
    {
        Write-Verbose "Adding the item to the folder $ServerPathToAddItem..."
     
        Write-Verbose "Retrieving the parent folder of the folder that will be added..."
        $parentLocalFolder = Split-Path $LocalItemPath -Parent

        Write-Verbose "Mapping ""$ServerPathToAddItem"" to ""$parentLocalFolder""..."
        $workspace.Map($ServerPathToAddItem,$parentLocalFolder)

        $workspace.PendAdd($LocalItemPath)
        $countItemsAdded++
        Write-Verbose "Itens added: $countItemsAdded..."
    }
    end
    {
        Write-Verbose "Retrieving the changes to do check-in..."
        $pendingChanges = $workspace.GetPendingChanges()

        Write-Verbose "Check-in the folder..."
        $workspace.CheckIn($pendingChanges, $CheckinDescription)
    
        Write-Verbose "Removing the temporary workspace created..."
        $workspace.Delete()

        Write-Verbose "Done!"
    }
}

# .ExternalHelp .\MAML\TFSPowershell.SourceControl.Help.xml
Function New-TFVCBrach
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [string] $SourcePath,

        [Parameter(mandatory=$true)]
        [string] $DestinationPath,             

        [Microsoft.TeamFoundation.VersionControl.Client.VersionSpec] $VersionSpec = [Microsoft.TeamFoundation.VersionControl.Client.VersionSpec]::Latest,

        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )
     

    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }
                       
    $versionControlService = $Tfs.GetService("Microsoft.TeamFoundation.VersionControl.Client.VersionControlServer")
    $versionControlService.CreateBranch($SourcePath,$DestinationPath,$VersionSpec)
}

# .ExternalHelp .\MAML\TFSPowershell.SourceControl.Help.xml
Function Remove-TFVCServerItem
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true,ValueFromPipeline=$True)]
        [string] $ServerItemPath,
        
        [Microsoft.TeamFoundation.VersionControl.Client.VersionSpec] $VersionSpec = [Microsoft.TeamFoundation.VersionControl.Client.VersionSpec]::Latest,

        [Parameter(ValueFromPipelineByPropertyName=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null,

        [switch] $isDirectory = $false
    )
    begin
    {
        Write-Verbose "Connecting to TFS..."
        if ($Tfs -eq $null)
        {
            $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
        }
                       
        $versionControlService = $Tfs.GetService("Microsoft.TeamFoundation.VersionControl.Client.VersionControlServer")
        
        Write-Debug "Creating temporary workspace to execute the operation..."
        $workspace = $versionControlService.CreateWorkspace([Guid]::NewGuid().ToString())
    }
    process
    {
        Write-Verbose "Removing item $ServerItemPath..."
            
        Write-Debug "Creating a temporary folder to map the workspace..."
        $tempDirPath = "$TempDirLocation\"+[guid]::NewGuid().ToString() 

        New-Item "$tempDirPath" -Type directory -Force | Out-String | Write-Verbose 

        Write-Debug "Mapping ""$ServerItemPath"" to ""$tempDirPath""..."
        if ($isDirectory)
        {
            $workspace.Map($ServerItemPath,$tempDirPath)
        }
        else
        {
            $parentPath = Split-Path $ServerItemPath -Parent
            $workspace.Map($parentPath,$tempDirPath)
        }

        Write-Debug "Synching the workspace..."
        $workspace.Get()

        Write-Debug "Marking the item as deleted..."
        $workspace.PendDelete($ServerItemPath,[Microsoft.TeamFoundation.VersionControl.Client.RecursionType]::Full)

    }
    end
    {
        Write-Debug "Retrieving the changes to do the check-in..."
        $pendingChanges = $workspace.GetPendingChanges()

        Write-Debug "Commiting the delete operation..."
        $workspace.CheckIn($pendingChanges, "Removing item ""$ServerItemPath"".")
    
        Write-Debug "Removing the temporary workspace created..."
        $workspace.Delete()
        Write-Verbose "Done!"
    }
}

# .ExternalHelp .\MAML\TFSPowershell.SourceControl.Help.xml
Function Rename-TFVCServerItem
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true,ValueFromPipelineByPropertyName=$True)]
        [string] $ServerItemPath,

        [Parameter(mandatory=$true,ValueFromPipelineByPropertyName=$True)]
        [string] $NewName,
        
        [Microsoft.TeamFoundation.VersionControl.Client.VersionSpec] $VersionSpec = [Microsoft.TeamFoundation.VersionControl.Client.VersionSpec]::Latest,

        [Parameter(ValueFromPipelineByPropertyName=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )
    begin
    {
        Write-Verbose "Connecting to TFS..."
        if ($Tfs -eq $null)
        {
            $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
        }
                       
        $versionControlService = $Tfs.GetService("Microsoft.TeamFoundation.VersionControl.Client.VersionControlServer")
        
        Write-Debug "Creating a temporary workspace to execute the operation..."
        $workspace = $versionControlService.CreateWorkspace([Guid]::NewGuid().ToString())
    }
    process
    {
        Write-Verbose "Renaming item $ServerItemPath to $NewName..."
            
        Write-Debug "Creating a temporary folder to map the workspace..."
        $tempDirPath = "$TempDirLocation\"+[guid]::NewGuid().ToString() 

        New-Item "$tempDirPath" -Type directory -Force | Out-String | Write-Verbose 
                
        $parentPath = Split-Path $ServerItemPath -Parent
        Write-Debug "Mapping ""$parentPath"" to ""$tempDirPath""..."
        $workspace.Map($parentPath,$tempDirPath) | Out-Null


        Write-Debug "Synching the workspace..."
        $getStatus = $workspace.Get($ServerItemPath,$VersionSpec,[Microsoft.TeamFoundation.VersionControl.Client.RecursionType]::OneLevel,[Microsoft.TeamFoundation.VersionControl.Client.GetOptions]::GetAll)
        
        if ($getStatus.NoActionNeeded)
        {
            Write-Warning "The item ""$ServerItemPath"" was not found. No operation was done!"
            return
        }

        $pathArray = $ServerItemPath -split "/"
        $oldfile = ($ServerItemPath -split "/")[$($pathArray.Length-1)]
        $newPath = $ServerItemPath -replace $oldfile, $NewName
        Write-Debug "Rename the item..."
        $workspace.PendRename($ServerItemPath,$newPath) | Out-Null
    }
    end
    {
        Write-Debug "Retrieving the changes to do check-in..."
        $pendingChanges = $workspace.GetPendingChanges()

        if ($pendingChanges.Count -ne 0)
        {
            Write-Debug "Doing check-in of the folder..."
            $workspace.CheckIn($pendingChanges, "Renamed item ""$ServerItemPath"" to ""$newPath"".") | Out-Null
        }
        else
        {
            Write-Warning "No items was found to be renamed. No operation was done."
        }

        Write-Debug "Removing the temporary workspace created..."
        $workspace.Delete() | Out-Null
        Write-Verbose "Done!"
    }
}

# .ExternalHelp .\MAML\TFSPowershell.SourceControl.Help.xml
Function Destroy-TFVCServerItem
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [string] $ServerItemPath,
        
        [Microsoft.TeamFoundation.VersionControl.Client.VersionSpec] $VersionSpec = [Microsoft.TeamFoundation.VersionControl.Client.VersionSpec]::Latest,

        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )
     
    Write-Verbose "Connecting to TFS..."
    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }
                       
    $versionControlService = $Tfs.GetService("Microsoft.TeamFoundation.VersionControl.Client.VersionControlServer")
    
    Write-Verbose "Retrieving the item to be destroyed..."
    $itemSpec = New-Object  Microsoft.TeamFoundation.VersionControl.Client.ItemSpec($ServerItemPath,[Microsoft.TeamFoundation.VersionControl.Client.RecursionType]::Full)

    Write-Verbose "destroying the item..."
    $detroyedItems = $versionControlService.Destroy($itemSpec,$VersionSpec,$null,[Microsoft.TeamFoundation.VersionControl.Common.DestroyFlags]::None)

    Write-Verbose "Done!"
}

# .ExternalHelp .\MAML\TFSPowershell.SourceControl.Help.xml
Function Merge-TFVCServerItems
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [string] $FromServerItemPath,

        [Parameter(mandatory=$true)]
        [string] $TargetServerItemPath,
        
        [Microsoft.TeamFoundation.VersionControl.Client.VersionSpec] $FromVersionSpec = $null,
		[Microsoft.TeamFoundation.VersionControl.Client.VersionSpec] $TargetVersionSpec = $null,  
        [Microsoft.TeamFoundation.VersionControl.Client.LockLevel] $LockLevel = [Microsoft.TeamFoundation.VersionControl.Client.LockLevel]::None,
        [Microsoft.TeamFoundation.VersionControl.Client.RecursionType] $RecursionType = [Microsoft.TeamFoundation.VersionControl.Client.RecursionType]::Full,
        [Microsoft.TeamFoundation.VersionControl.Client.MergeOptions] $MergeOptions = [Microsoft.TeamFoundation.VersionControl.Client.MergeOptions]::None,
        #[Microsoft.TeamFoundation.VersionControl.Common.MergeOptionsEx] $MergeOptions = [Microsoft.TeamFoundation.VersionControl.Common.MergeOptionsEx]::Conservative,        

        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )
    begin
    {
        Write-Verbose "Connecting to TFS..."
        if ($Tfs -eq $null)
        {
            $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
        }
                       
        $versionControlService = $Tfs.GetService("Microsoft.TeamFoundation.VersionControl.Client.VersionControlServer")
        
        Write-Debug "Creating a temporary workspace to execute the operation..."
        $workspace = $versionControlService.CreateWorkspace([Guid]::NewGuid().ToString())
    }
	End
	{
        Write-Verbose "Merging $FromServerItemPath to $TargetServerItemPath..."
            
        Write-Debug "Creating a temporary directory to map the workspace..."
        $tempDirPath = "$TempDirLocation\"+[guid]::NewGuid().ToString() 

        New-Item "$tempDirPath" -Type directory -Force | Out-String | Write-Verbose 
        
		$parentPath = Split-Path $TargetServerItemPath -Parent
		Write-Debug "Mapping ""$parentPath"" to ""$tempDirPath""..."
		$workspace.Map($parentPath,$tempDirPath)

        Write-Debug "Doing the merge..."
        $getStatus = $workspace.Merge($FromServerItemPath,$TargetServerItemPath,$FromVersionSpec,$TargetVersionSpec,$LockLevel,$RecursionType,$MergeOptions)

        if ($getStatus.NumConflicts -gt 0)
        {
            $conflicts = $workspace.QueryConflicts(@($FromServerItemPath,$TargetServerItemPath),$true)
            Write-Error "Conflicts was found during the merge operation. Resolve the conflicts and try again. The merge was aborted."
        }
        else
        {
            Write-Debug "Retrieving the changes to check-in the merge..."
            $pendingChanges = $workspace.GetPendingChanges()

            if ($pendingChanges.Count -ne 0)
            {
                Write-Debug "Doing the check-in of the merge..."
                $workspace.CheckIn($pendingChanges, "Merge done from ""$FromServerItemPath"" to ""$TargetServerItemPath"".")
            }
            else
            {
                Write-Warning "No items found to do the merge. No operation was done."
            }
        }
        Write-Debug "Removing the temporary workspace created..."
        $workspace.Delete() | Out-Null
        Write-Verbose "Feito!"
        return $conflicts
    }
}

# .ExternalHelp .\MAML\TFSPowershell.SourceControl.Help.xml
Function New-Label
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [string] $Label,

        [Parameter(mandatory=$true)]
        [string] $ServerPath,

        [Parameter(mandatory=$true)]
        [string] $Comments,             

        [Microsoft.TeamFoundation.VersionControl.Client.VersionSpec] $VersionSpec = [Microsoft.TeamFoundation.VersionControl.Client.VersionSpec]::Latest,

        [string] $Scope = $null,
        
        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )
     

    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }
                       
    $versionControlService = $Tfs.GetService("Microsoft.TeamFoundation.VersionControl.Client.VersionControlServer")
    $versionControlLabel = New-Object Microsoft.TeamFoundation.VersionControl.Client.VersionControlLabel($versionControlService, $Label, $versionControlService.AuthenticatedUser, $Scope, $Comments);

    #$itemsSpec = @()
    $itemSpec = New-Object Microsoft.TeamFoundation.VersionControl.Client.ItemSpec($ServerPath,[Microsoft.TeamFoundation.VersionControl.Client.RecursionType]::Full)

    #$itemSpecs.Add($itemsSpec)
    $labelItemSpec = New-Object Microsoft.TeamFoundation.VersionControl.Client.LabelItemSpec($itemSpec,$VersionSpec,$false)

    $labelItemsSpec = @($labelItemSpec)
    #$labelItemsSpec.Add($labelItemSpec)

    $versionControlService.CreateLabel($versionControlLabel, $labelItemsSpec, [Microsoft.TeamFoundation.VersionControl.Client.LabelChildOption]::Replace)
}

# .ExternalHelp .\MAML\TFSPowershell.SourceControl.Help.xml
Function Query-Labels
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [string] $Label = "*",

        [string] $filterServerPath = $null,

        [string] $Owner = $null,             

        [Microsoft.TeamFoundation.VersionControl.Client.VersionSpec] $VersionSpec = [Microsoft.TeamFoundation.VersionControl.Client.VersionSpec]::Latest,

        [string] $Scope = $null,
        
        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )
     

    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }
                       
    $versionControlService = $Tfs.GetService("Microsoft.TeamFoundation.VersionControl.Client.VersionControlServer")
    return $versionControlService.QueryLabels($Label,$Scope,$Owner,$false,$filterServerPath,$VersionSpec)
}
