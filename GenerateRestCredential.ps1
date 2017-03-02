<#
.SYNOPSIS
    Saves a credentials object into a file securely. 

.DESCRIPTION
    Saves a credentials object into a file securely in a path informed.

.PARAMETER CredentialsFilePath
    Path where to save the credentials file. 
    Ex.: 'C:\TFSAdministration\TFSPowerShell'  
#>
Param(
    [Parameter(Mandatory=$true)]
    [string]$CredentialsFilePath
)

$credentials = Get-Credential
$username = $credentials.UserName
$user = $username.Replace("\","-")

$fileName = "restcreds`_$env:COMPUTERNAME.xml"
$credentials | Export-Clixml "$CredentialsFilePath\$fileName"