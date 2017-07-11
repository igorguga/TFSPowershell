#Rest API version to be used
$BuildApiVersion = "1.0"

#Assemblies folder for TFS Object Model Client
$rootPath = $PSScriptRoot
$AssembliesDir = "$rootPath\Assemblies"

Add-Type -Path "$AssembliesDir\Microsoft.TeamFoundation.Client.dll",
               "$AssembliesDir\Microsoft.TeamFoundation.Common.dll",
               "$AssembliesDir\Microsoft.VisualStudio.Services.Common.dll",
               "$AssembliesDir\Microsoft.TeamFoundation.WorkItemTracking.Client.DataStoreLoader.dll",                                        
               "$AssembliesDir\Microsoft.TeamFoundation.WorkItemTracking.Client.dll"

# .ExternalHelp .\MAML\TFSPowershell.Tfs.Help.xml
Function Get-TeamProjectCollection
{
    [CmdletBinding()]
    Param (
        [Parameter(mandatory=$true)]
        [string] $CollectionUrl
    )
    
    # Get TFS
    $tfs = [Microsoft.TeamFoundation.Client.TfsTeamProjectCollectionFactory]::GetTeamProjectCollection($CollectionUrl)
    $tfs.EnsureAuthenticated()

    Write-Output $tfs
}

# .ExternalHelp .\MAML\TFSPowershell.Tfs.Help.xml
Function Get-TeamProject
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [string] $TeamProjectName,

        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )

    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

    # Get Team Project
    $cssService = $Tfs.GetService("Microsoft.TeamFoundation.Server.ICommonStructureService4")
    Write-Output $cssService.GetProjectFromName($TeamProjectName)
}

# .ExternalHelp .\MAML\TFSPowershell.Tfs.Help.xml
Function Get-TeamProjects
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl
    )
    
    $getdUrl = "{0}/_apis/projects?api-version={1}" -f $CollectionUrl, $BuildApiVersion        
    $response = Invoke-RestAPICall -Uri $getdUrl -Method "Get" -Verbose:$VerbosePreference
    return $response
}

# .ExternalHelp .\MAML\TFSPowershell.Tfs.Help.xml
Function Get-AllTFSAlerts
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )

    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

    $eventService = $tfs.GetService("Microsoft.TeamFoundation.Framework.Client.IEventService")
    $identityService = $tfs.GetService("Microsoft.TeamFoundation.Framework.Client.IIdentityManagementService")
 
    foreach ($sub in $eventService.GetAllEventSubscriptions())
    {
        #First resolve the subscriber ID
        $tfsId = $identityService.ReadIdentity([Microsoft.TeamFoundation.Framework.Common.IdentitySearchFactor]::Identifier, 
                                               $sub.Subscriber,
                                               [Microsoft.TeamFoundation.Framework.Common.MembershipQuery]::None, 
                                               [Microsoft.TeamFoundation.Framework.Common.ReadIdentityOptions]::None )
        if ($tfsId.UniqueName)
        {
            $subscriberId = $tfsId.UniqueName
        }
        else
        {
            $subscriberId = $tfsId.DisplayName
        }
 
        #then create custom PSObject
        $subPSObj = New-Object PSObject -Property @{
                        ID             = $sub.ID
                        Device         = $sub.Device
                        Condition      = $sub.ConditionString
                        EventType      = $sub.EventType
                        Address        = $sub.DeliveryPreference.Address
                        Schedule       = $sub.DeliveryPreference.Schedule
                        DeliveryType   = $sub.DeliveryPreference.Type
                        SubscriberName = $subscriberId
                        Tag            = $sub.Tag
                        }
 
        #Send object to the pipeline. You could store it on an Arraylist, but that just
        #consumes more memory
        $subPSObj
    }
}

# .ExternalHelp .\MAML\TFSPowershell.Tfs.Help.xml
Function New-TFSAlert
{
    #FilterExpression "CoreFields/StringFields/Field[Name='Area Path']/NewValue" = '\AreaPath' AND 
    #                 "CoreFields/StringFields/Field[Name='Authorized As']/NewValue" <> '@@MyDisplayName@@' AND 
    #                 ("CoreFields/StringFields/Field[Name='Work Item Type']/NewValue" = 'Requirement' OR 
    #                  "CoreFields/StringFields/Field[Name='Work Item Type']/NewValue" = 'Issue' OR 
    #                  "CoreFields/StringFields/Field[Name='Work Item Type']/NewValue" = 'Bug') AND 
    #                  " ""CoreFields/StringFields/Field[Name='State']/NewValue"" <> ""CoreFields/StringFields/Field[Name='State']/OldValue"" "
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [string] $AlertName,

        [Parameter(mandatory=$true)]
        [string] $SubscriberAccountName,

        [Parameter(mandatory=$true)]
        [string] $FilterExpression,

        [Parameter(mandatory=$true)]
        [string] $EventType,

        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )

    Write-Verbose "Connecting to TFS..."
    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

    $eventService = $tfs.GetService("Microsoft.TeamFoundation.Framework.Client.IEventService")
    $identityService = $tfs.GetService("Microsoft.TeamFoundation.Framework.Client.IIdentityManagementService")

    Write-Verbose "Retrieving account identification $SubscriberAccountName..."
    $subsIdentity = $identityService.ReadIdentity([Microsoft.TeamFoundation.Framework.Common.IdentitySearchFactor]::AccountName,
                                             $SubscriberAccountName,
                                             [Microsoft.TeamFoundation.Framework.Common.MembershipQuery]::None,
                                             [Microsoft.TeamFoundation.Framework.Common.ReadIdentityOptions]::None)
    $subsID = $subsIdentity.Descriptor.Identifier

    Write-Verbose "Creating alert $AlertName..."
    $deliveryPreference = New-Object Microsoft.TeamFoundation.Framework.Client.DeliveryPreference 
    $deliveryPreference.Schedule = [Microsoft.TeamFoundation.Framework.Client.DeliverySchedule]::Immediate
    $deliveryPreference.Type = [Microsoft.TeamFoundation.Framework.Client.DeliveryType]::EmailHtml
    $eventID = $eventService.SubscribeEvent($subsID,$EventType,$FilterExpression,$deliveryPreference,$AlertName)
    Write-Verbose "Done."
    Write-Output $eventID  
}

# .ExternalHelp .\MAML\TFSPowershell.Tfs.Help.xml
Function Remove-TFSAlert
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true)]
        [string] $AlertName,

        [Parameter(mandatory=$true)]
        [string] $SubscriberAccountName,

        [Parameter(ValueFromPipeline=$True)]
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )
 
    Write-Verbose "Connecting to TFS..."
    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

    $eventService = $tfs.GetService("Microsoft.TeamFoundation.Framework.Client.IEventService")
    $identityService = $tfs.GetService("Microsoft.TeamFoundation.Framework.Client.IIdentityManagementService")

    Write-Verbose "Retrieving account identification $SubscriberAccountName..."
    $subsIdentity = $identityService.ReadIdentity([Microsoft.TeamFoundation.Framework.Common.IdentitySearchFactor]::AccountName,
                                             $SubscriberAccountName,
                                             [Microsoft.TeamFoundation.Framework.Common.MembershipQuery]::None,
                                             [Microsoft.TeamFoundation.Framework.Common.ReadIdentityOptions]::None)
    $subscriberID = $subsIdentity.Descriptor.Identifier

    Write-Verbose "Retrieving alert $AlertName information..."
    $subscriptions = $eventService.GetEventSubscriptions($subscriberID, "$AlertName")

    Write-Verbose "Retrieving alert ID..."
    $subscriptionId = $subscriptions[0].ID

    Write-Verbose "Removing alert $AlertName..."
    $eventService.UnsubscribeEvent($subscriptionId)
    Write-Verbose "Done."
}

# .ExternalHelp .\MAML\TFSPowershell.Tfs.Help.xml
Function Remove-TFSAlertById
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,

        [Parameter(mandatory=$true,ValueFromPipeline = $true)]
        [int] $Id,

        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )
 
    Write-Verbose "Connecting to TFS..."
    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

    $eventService = $Tfs.GetService("Microsoft.TeamFoundation.Framework.Client.IEventService")

    Write-Verbose "Removing alert $AlertName..."
    $eventService.UnsubscribeEvent($Id)
    Write-Verbose "Done."
}

# .ExternalHelp .\MAML\TFSPowershell.Tfs.Help.xml
Function Get-GlobalLists
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )
    Write-Verbose "Connecting to TFS..."
    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }

    $workItemStore = $tfs.GetService("Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItemStore")
    return $workItemStore.ExportGlobalLists() 
}

# .ExternalHelp .\MAML\TFSPowershell.Tfs.Help.xml
Function Set-GlobalLists
{
    [CmdletBinding()]
    Param (
        [string] $CollectionUrl,
        [Parameter(mandatory=$true)]
        [string] $GlobalLists,
        [Microsoft.TeamFoundation.Client.TfsTeamProjectCollection]$Tfs = $null
    )
    Write-Verbose "Connecting to TFS..."
    if ($Tfs -eq $null)
    {
        $Tfs = Get-TeamProjectCollection -CollectionUrl $CollectionUrl
    }
                      
    $workItemStore = $tfs.GetService("Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItemStore")
    $workItemStore.ImportGlobalLists($GlobalLists)   
}