$rootPath = $PSScriptRoot

#Try to find saved crendentials, if not, request the credential for the user
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