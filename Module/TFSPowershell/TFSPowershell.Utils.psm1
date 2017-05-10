$rootPath = $PSScriptRoot

# .ExternalHelp .\MAML\TFSPowershell.Utils.Help.xml
Function Get-RestApiCredentials
{
	[CmdletBinding()]
    Param ()
	$credFile = "$rootPath\restcreds`_$env:COMPUTERNAME.xml"
	
	try
	{
		$credentials = Import-Clixml $credFile
	}
	catch 
	{
		$exception = $_.Exception.Message
		"Credentials file: $credFile. Exception: $exception" | Out-File "c:\temp\log.txt"
		Write-Verbose "The credential file $credFile was not found. Use Set-RestApiCredentials to save the credentials."
	
		$credentials = $null
	}
	
    return $credentials
}

# .ExternalHelp .\MAML\TFSPowershell.Utils.Help.xml
Function Set-RestApiCredentials
{
	Param()
	$credentials = Get-Credential
	$username = $credentials.UserName
	$user = $username.Replace("\","-")

	$fileName = "restcreds`_$env:COMPUTERNAME.xml"
	$credentials | Export-Clixml "$rootPath\$fileName"
}

# .ExternalHelp .\MAML\TFSPowershell.Utils.Help.xml
Function Clear-RestAPICredentials
{
	$credFile = "$rootPath\restcreds`_$env:COMPUTERNAME.xml"
	if (Test-Path $credFile)
	{
		Remove-Item $credFile -Force
	}
	else 
	{
		Write-Verbose "No credentials found. No operation done."	
	}
}

# .ExternalHelp .\MAML\TFSPowershell.Utils.Help.xml
Function Set-TFSPowershellTempDir
{
	Param(
		[Parameter(mandatory=$true)]
		[string] $TFSPowershellTempDirLocation
	)
	Write-Verbose "Creating environment variable 'TFSPowershellTempDirLocation'..."
	[Environment]::SetEnvironmentVariable("TFSPowershellTempDirLocation", $TFSPowershellTempDirLocation, "Machine")
}

# .ExternalHelp .\MAML\TFSPowershell.Utils.Help.xml
Function Invoke-RestAPICall
{
	Param(
		[Parameter(mandatory=$true)]
		[string] $Uri,
		[Parameter(mandatory=$true)]
		[string] $Method,
		[string] $Headers,
		[string] $Body
	)

	$command = "Invoke-RestMethod -Uri ""$Uri"" -Method ""$Method"" -ContentType application/json "
	$credentials = Get-RestApiCredentials

	#Selecting authentication method
	if (!$credentials)
	{
		Write-Verbose "No rest api credentials found. The default credentials will be considered to the call."
		$command += "-UseDefaultCredentials "
	}
	else 
	{
		if ($Uri.EndsWith(".visualstudio.com"))
		{
			$base64authinfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $credentials.UserName, $credentials.GetNetworkCredential().Password)))
			$Headers += @{Authorization=("Basic {0}" -f $base64authinfo)}

			$command += '-Headers $Headers '
		}
		else 
		{
			$command += '-Credential $credentials '
		}
	}
	if ($Method -ne "GET" -and $Method -eq "DELETE")
	{
		$command += '-Body $body '
	}

	return Invoke-Expression $command
}