#Rest API version to be used
$BuildApiVersion = "3.0-preview.1"

 # .ExternalHelp .\MAML\TFSPowershell.ServiceEndpoint.Help.xml
Function Get-ServiceEndpoints {
    [CmdletBinding()]
    Param (
        [Parameter(mandatory = $true)]
        [string] $CollectionUrl,

        [Parameter(mandatory = $true)]
        [string] $TeamProjectName
    )
    
    # For compatibility with TFS2015
    Write-Verbose "Retrieving team project Guid (for compatibility with TFS 2015)..." 
    $getTeamProjectUrl = "{0}/_apis/projects/{1}?api-version=1.0" -f $CollectionUrl, $TeamProjectName, $BuildApiVersion
    $teamProject = Invoke-RestAPICall -Uri $getTeamProjectUrl -Method "GET" -Verbose:$VerbosePreference

    Write-Verbose "Retrieving service enpoints for TeamProject ""$TeamProject""..." 
    $getServiceEndpointUrl = "{0}/{1}/_apis/distributedtask/serviceendpoints?api-version={2}" -f $CollectionUrl, $($teamProject.id), $BuildApiVersion
 
    $response = Invoke-RestAPICall -Uri $getServiceEndpointUrl -Method "GET" -Verbose:$VerbosePreference

    return $response
}

 # .ExternalHelp .\MAML\TFSPowershell.ServiceEndpoint.Help.xml
Function New-ServiceEndpoint {
    [CmdletBinding()]
    Param (
        [Parameter(mandatory = $true)]
        [string] $CollectionUrl,

        [Parameter(mandatory = $true)]
        [string] $TeamProjectName,

        [Parameter(mandatory = $true)]
        [string] $NewEndPointJson
    )
    
    # For compatibility with TFS2015
    Write-Verbose "Retrieving team project Guid (for compatibility with TFS 2015)..." 
    $getTeamProjectUrl = "{0}/_apis/projects/{1}?api-version=1.0" -f $CollectionUrl, $TeamProjectName, $BuildApiVersion
    $teamProject = Invoke-RestAPICall -Uri $getTeamProjectUrl -Method "GET" -Verbose:$VerbosePreference
    $teamProjectGuid = $($teamProject.id)

    # Validating endpoint Json body
    try {
        ConvertFrom-Json $NewEndPointJson -ErrorAction Stop
        $body = ([System.Text.Encoding]::UTF8.GetBytes($NewEndPointJson))
    } 
    catch {
        $error = $_.Exception.Message
        Write-Error "The inputed string on parameter 'NewEndPointJson' is not a valid json. Details: ""$error""."
        return
    }

    Write-Verbose "Creating the new endpoint ..." 
    $newDefinitionUrl = "{0}/{1}/_apis/distributedtask/serviceendpoints?api-version={2}" -f $CollectionUrl, $teamProjectGuid, $BuildApiVersion
    $method = "POST"
    $newEndpoint = Invoke-RestAPICall -Uri $newDefinitionUrl -Method $method -Body $body -Verbose:$VerbosePreference

    return $newEndpoint
}