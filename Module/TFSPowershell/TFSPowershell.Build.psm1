#Rest API version to be used
$BuildApiVersion = "2.0"
$WaitBuildSeconds = 10 

# .ExternalHelp .\MAML\TFSPowershell.Build.Help.xml
Function New-BuildDefinition {
    [CmdletBinding()]
    Param (
        [Parameter(mandatory = $true)]
        [string] $CollectionUrl,

        [Parameter(mandatory = $true)]
        [string] $TeamProjectName,

        [Parameter(mandatory = $true)]
        [string] $TemplateName,

        [Parameter(mandatory = $true)]
        [string] $BuildDefinitionName,

        [string] $TemplateTeamProjectName,
        [hashtable] $OverwriteParameters
    )
    
    if ($TemplateTeamProjectName -eq $null -or $TemplateTeamProjectName -eq "") {
        $TemplateTeamProjectName = $TeamProjectName
    }
     
    Write-Verbose "Retrieving build template $TemplateName from team project $TemplateTeamProjectName..." 
    $getTemplateUrl = "{0}/{1}/_apis/build/definitions/templates/{2}?api-version={3}" -f $CollectionUrl, $TemplateTeamProjectName, $TemplateName, $BuildApiVersion
 
    try {
        $response = Invoke-RestAPICall -Uri $getTemplateUrl -Method "GET" -Verbose:$VerbosePreference
        }
    catch {
        Write-Error "Build Template ""$TemplateName"" not found on Team Project ""$TemplateTeamProjectName"". Url: $getTemplateUrl. Aborting build definition creation. Details: $_.Exception.Message"
        return
    }

    $template = $response.template
    $template.Name = $BuildDefinitionName
    $template.PSObject.Properties.Remove("project")

    Write-Verbose "Editing build parameters informed..." 
    foreach ($key in $OverwriteParameters.Keys) {		
        $propertieCmd = '$template.' + "$key"
        try {
            #Trying to find the variable on the build template
            $propertieValue = Invoke-Expression $propertieCmd
            if ($propertieValue -ne $null) {
                $assignCmd = '$template.' + "$key=" + '$OverwriteParameters.' + """$key"""
                Invoke-Expression $assignCmd
            }	
        }
        #if not found do nothing
        catch { 
            Write-Debug "Parameter '$propertieCmd' or '$assignCmd' not found in the build definition template. It will be ignored."
        }
    }

    Write-Verbose "Creating the build definition $BuildDefinitionName..." 
    $newDefinitionUrl = "{0}/{1}/_apis/build/definitions?api-version={2}" -f $CollectionUrl, $TeamProjectName, $BuildApiVersion
    $method = "POST"
    $body = ConvertTo-Json $template -Depth 20 -Compress
    $newDefinition = Invoke-RestAPICall -Uri $newDefinitionUrl -Method $method -Body ([System.Text.Encoding]::UTF8.GetBytes($body)) -Verbose:$VerbosePreference

    return $newDefinition
}

# .ExternalHelp .\MAML\TFSPowershell.Build.Help.xml
Function Remove-BuildDefinition {
    [CmdletBinding()]
    Param (
        [Parameter(mandatory = $true)]
        [string] $CollectionUrl,

        [Parameter(mandatory = $true)]
        [string] $TeamProjectName,

        [Parameter(mandatory = $true)]
        [string] $BuildDefinitionName
    )
    
    Process {       
        Write-Verbose "Retrieving the id of build definition $BuildDefinitionName..." 
        $getDefinitionsUrl = "{0}/{1}/_apis/build/definitions?api-version={2}&name={3}" -f $CollectionUrl, $TeamProjectName, $BuildApiVersion, $BuildDefinitionName
        
        try {
            $response = Invoke-RestAPICall -Uri $getDefinitionsUrl -Method "GET" -Verbose:$VerbosePreference
        }
        catch {
            Write-Error "Build Definition ""$BuildDefinitionName"" not found. Operation aborted. Details: $_.Exception.Message."
            return
        }

        if ($response.count -eq 0 ) {
            Write-Error "Build Definition ""$BuildDefinitionName"" not found. Operation aborted."
            return
        }
        
        $Id = $response.value.id
        Remove-BuildDefinitionById -CollectionUrl $CollectionUrl -TeamProjectName $TeamProjectName -DefinitionId $Id -Verbose
    }
    End {
        Write-Output "Done."
    }
}

# .ExternalHelp .\MAML\TFSPowershell.Build.Help.xml
Function Remove-BuildDefinitionById {
    [CmdletBinding()]
    Param (
        [Parameter(mandatory = $true)]
        [string] $CollectionUrl,

        [Parameter(mandatory = $true)]
        [string] $TeamProjectName,

        [Parameter(mandatory = $true)]
        [int] $DefinitionId
    )
    
    Process {       
        Write-Verbose "Removing build definition of Id $DefinitionId..." 
        $deleteUrl = "{0}/{1}/_apis/build/definitions/{2}?api-version={3}" -f $CollectionUrl, $TeamProjectName, $DefinitionId, $BuildApiVersion     
        $response = Invoke-RestAPICall -Uri $deleteUrl -Method "DELETE" -Verbose:$VerbosePreference
    }
    End {
        Write-Output "Done."
    }
}

# .ExternalHelp .\MAML\TFSPowershell.Build.Help.xml
Function Get-BuildDefinitionBasicInfo {
    [CmdletBinding()]
    Param (
        [Parameter(mandatory = $true)]
        [string] $CollectionUrl,

        [Parameter(mandatory = $true)]
        [string] $TeamProjectName,

        [Parameter(mandatory = $true)]
        [string] $BuildDefinitionName
    )
       
    Write-Verbose "Retrieving the id of build definition $BuildDefinitionName..." 
    $getDefinitionsUrl = "{0}/{1}/_apis/build/definitions?api-version={2}&name={3}" -f $CollectionUrl, $TeamProjectName, $BuildApiVersion, $BuildDefinitionName
        
    try {
        $response = Invoke-RestAPICall -Uri $getDefinitionsUrl -Method "GET" -Verbose:$VerbosePreference
    }
    catch {
        Write-Error "Build Definition ""$BuildDefinitionName"" not found. Operation aborted. Details: $_.Exception.Message."
        return
    }

    if ($response.count -eq 0 ) {
        Write-Error "Build Definition ""$BuildDefinitionName"" not found. Operation aborted."
        return
    }
        
    return $response.value[0]
}

# .ExternalHelp .\MAML\TFSPowershell.Build.Help.xml
Function Get-BuildDefinitionById {
    [CmdletBinding()]
    Param (
        [Parameter(mandatory = $true)]
        [string] $CollectionUrl,

        [Parameter(mandatory = $true)]
        [string] $TeamProjectName,

        [Parameter(mandatory = $true)]
        [int] $DefinitionId
    )
         
    Write-Verbose "Retrieving the build definition from Id $DefinitionId..." 
    $getUrl = "{0}/{1}/_apis/build/definitions/{2}?api-version={3}" -f $CollectionUrl, $TeamProjectName, $DefinitionId, $BuildApiVersion     
    return Invoke-RestAPICall -Uri $getUrl -Method "GET" -Verbose:$VerbosePreference
}

# .ExternalHelp .\MAML\TFSPowershell.Build.Help.xml
Function Get-BuildDefinition {
    [CmdletBinding()]
    Param (
        [Parameter(mandatory = $true)]
        [string] $CollectionUrl,

        [Parameter(mandatory = $true)]
        [string] $TeamProjectName,

        [Parameter(mandatory = $true)]
        [string] $BuildDefinitionName
    )
    
    $info = Get-BuildDefinitionBasicInfo -CollectionUrl $CollectionUrl -TeamProjectName $TeamProjectName -BuildDefinitionName $BuildDefinitionName
	
    if ($info -ne $null -or $info -ne "") {
        return Get-BuildDefinitionById -CollectionUrl $CollectionUrl -TeamProjectName $TeamProjectName -DefinitionId $info.id
    }
}

# .ExternalHelp .\MAML\TFSPowershell.Build.Help.xml
Function Get-BuildDefinitionsFromTeamProject {
    [CmdletBinding()]
    Param (
        [Parameter(mandatory = $true)]
        [string] $CollectionUrl,

        [Parameter(mandatory = $true)]
        [string] $TeamProjectName,

        [Parameter(HelpMessage = "Filters to definitions whose names equal this value. Append a * to filter to definitions whose names start with this value. For example: MS*.")]
        [string] $nameFilter,

        [Parameter(HelpMessage = "The type of the build definitions to retrieve. If not specified, all types will be returned.")]
        [ValidateSet('build', 'xaml')]
        [string] $typeFilter
    )
             
    Write-Verbose "Retrieving build definitions from Team Project $TeamProjectName..." 

    $filters = ""
    if ($nameFilter) {$filters += "&name=$nameFilter"}
    if ($typeFilter) {$filters += "&type=$typeFilter"}

    $getUrl = "{0}/{1}/_apis/build/definitions?api-version={2}{3}" -f $CollectionUrl, $TeamProjectName, $BuildApiVersion, $filters     
    return Invoke-RestAPICall -Uri $getUrl -Method "GET" -Verbose:$VerbosePreference
}

# .ExternalHelp .\MAML\TFSPowershell.Build.Help.xml
Function Update-BuildDefinition {
    [CmdletBinding()]
    Param (
        [Parameter(mandatory = $true)]
        [string] $CollectionUrl,

        [Parameter(mandatory = $true)]
        [string] $TeamProjectName,

        [Parameter(mandatory = $true)]
        [int] $DefinitionId,

        [Parameter(mandatory = $true)]
        [string] $BuildDefinitionJsonBody
    )
   
    Write-Verbose "Updating build definition '$DefinitionId' from Team Project '$TeamProjectName'..." 

    $updateDefinitionUrl = "{0}/{1}/_apis/build/definitions/{2}?api-version={3}" -f $CollectionUrl, $TeamProjectName, $DefinitionId, $BuildApiVersion
    $method = "PUT"
    $body = $BuildDefinitionJsonBody
    return Invoke-RestAPICall -Uri $updateDefinitionUrl -Method $method -Body ([System.Text.Encoding]::UTF8.GetBytes($body)) -Verbose:$VerbosePreference
}

# .ExternalHelp .\MAML\TFSPowershell.Build.Help.xml
Function Rename-BuildDefinition {
    [CmdletBinding()]
    Param (
        [Parameter(mandatory = $true)]
        [string] $CollectionUrl,

        [Parameter(mandatory = $true)]
        [string] $TeamProjectName,

        [Parameter(mandatory = $true)]
        [string] $BuildDefinitionName,
	
        [Parameter(mandatory = $true)]
        [string] $NewName
    )
  
    Write-Verbose "Retrieving the id of build definition $BuildDefinitionName..." 
    $getDefinitionsUrl = "{0}/{1}/_apis/build/definitions?api-version={2}&name={3}" -f $CollectionUrl, $TeamProjectName, $BuildApiVersion, $BuildDefinitionName
        
    try {
        $response = Invoke-RestAPICall -Uri $getDefinitionsUrl -Method "GET" -Verbose:$VerbosePreference
    }
    catch {
        Write-Error "Build Definition ""$BuildDefinitionName"" not found. Operation aborted. Details: $_.Exception.Message."
        return
    }

    if ($response.count -eq 0 ) {
        Write-Error "Build Definition ""$BuildDefinitionName"" not found. Operation aborted."
        return
    }
        
    $buildDef = $response.value[0]
    $buildDef.name = $NewName
		
    $putDefinitionUrl = "{0}/{1}/_apis/build/definitions/{2}?api-version={3}" -f $CollectionUrl, $TeamProjectName, $($buildDef.id), $BuildApiVersion
    $method = "PUT"
    $body = ConvertTo-Json $buildDef -Depth 20 -Compress
		
    try {
        $response = Invoke-RestAPICall -Uri $putDefinitionUrl -Method $method -Body ([System.Text.Encoding]::UTF8.GetBytes($body)) -Verbose:$VerbosePreference
    }
    catch {
        Write-Error "Fail renaming ""$BuildDefinitionName"" to ""$NewName"". Details: $_.Exception.Message."
        return
    }
    Write-Output "Buid definition ""$BuildDefinitionName"" renamed to ""$NewName""."

}

# .ExternalHelp .\MAML\TFSPowershell.Build.Help.xml
Function Queue-Build {
    [CmdletBinding()]
    Param (
        [Parameter(mandatory = $true)]
        [string] $CollectionUrl,

        [Parameter(mandatory = $true)]
        [string] $TeamProjectName,

        [Parameter(mandatory = $true)]
        [string] $BuildDefinitionName,

        [ValidateSet("manual", "checkInShelveset")]
        [string] $Reason = "manual",

        [string] $SourceBranch = "",
        [switch] $WaitUntilBuildComplete
    )
           
    Write-Verbose "Retrieving the id of build definition $BuildDefinitionName..." 
    $getDefinitionsUrl = "{0}/{1}/_apis/build/definitions?api-version={2}&name={3}" -f $CollectionUrl, $TeamProjectName, $BuildApiVersion, $BuildDefinitionName
        
    try {
        $response = Invoke-RestAPICall -Uri $getDefinitionsUrl -Method "GET" -Verbose:$VerbosePreference
    }
    catch {
        Write-Error "Build Definition ""$BuildDefinitionName"" not found. Operation aborted. Details: $_.Exception.Message."
        return
    }

    if ($response.count -eq 0 ) {
        Write-Error "Build Definition ""$BuildDefinitionName"" not found. Operation aborted."
        return
    }
        
    $Id = $response.value.id

    Queue-BuildByDefinitionId -CollectionUrl $CollectionUrl -TeamProjectName $TeamProjectName -DefinitionId $Id -Reason $Reason -SourceBranch $SourceBranch -WaitUntilBuildComplete:$WaitUntilBuildComplete.IsPresent -Verbose
    
}

# .ExternalHelp .\MAML\TFSPowershell.Build.Help.xml
Function Queue-BuildByDefinitionId {
    [CmdletBinding()]
    Param (
        [Parameter(mandatory = $true)]
        [string] $CollectionUrl,

        [Parameter(mandatory = $true)]
        [string] $TeamProjectName,

        [Parameter(mandatory = $true)]
        [int] $DefinitionId,

        [ValidateSet("manual", "checkInShelveset")]
        [string] $Reason = "manual",

        [string] $SourceBranch = "",
        [switch] $WaitUntilBuildComplete
    )
      
    Write-Verbose "Queueing a new build for the build definition with Id $DefinitionId..." 
    $queueBuildUrl = "{0}/{1}/_apis/build/builds?api-version={2}" -f $CollectionUrl, $TeamProjectName, $BuildApiVersion  
        
    $bodyObject = @{
        "definition" = @{"id" = $DefinitionId};
        "reason" = "$Reason";
        "sourceBranch" = "$SourceBranch"
    }
    $body = ConvertTo-Json $bodyObject -Depth 20 -Compress
        
    $response = Invoke-RestAPICall -Uri $queueBuildUrl -Method "Post" -Body $body -Verbose:$VerbosePreference
    $buildId = $response.id
    $buildStatus = $response.status

    if ($WaitUntilBuildComplete.IsPresent) {
        While ( $buildStatus -ne "completed" ) {
            Start-Sleep -Seconds $WaitBuildSeconds
            $build = Get-BuildById -CollectionUrl $CollectionUrl -TeamProjectName $TeamProjectName -BuildId $buildId
            $buildStatus = $build.status
        }
        return $build
    }
    else {
        return $response
    }
}

# .ExternalHelp .\MAML\TFSPowershell.Build.Help.xml
Function Get-BuildById {
    param(
        [Parameter(mandatory = $true)]
        [string] $CollectionUrl,

        [Parameter(mandatory = $true)]
        [string] $TeamProjectName,

        [Parameter(mandatory = $true)]
        [string] $BuildId
    )

    $getdUrl = "{0}/{1}/_apis/build/builds/{2}?api-version={3}" -f $CollectionUrl, $TeamProjectName, $BuildId, $BuildApiVersion        
    $response = Invoke-RestAPICall -Uri $getdUrl -Method "Get" -Verbose:$VerbosePreference
    return $response
}