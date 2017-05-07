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
		Write-Verbose "The file $credFile was not found. Requesting credentials to the user."
	
		$credentials = Get-Credential
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
Function Set-TFSPowershellTempDir
{
	Param(
		[Parameter(mandatory=$true)]
		[string] $TFSPowershellTempDirLocation
	)
	Write-Verbose "Creating environment variable 'TFSPowershellTempDirLocation'..."
	[Environment]::SetEnvironmentVariable("TFSPowershellTempDirLocation", $TFSPowershellTempDirLocation, "Machine")
}