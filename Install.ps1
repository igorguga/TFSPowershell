<#
.SYNOPSIS
    Installs the TFSPowershell module. 

.DESCRIPTION
    Copy the module files to the informed install path, adds the install path to PSModulePath environment variable and configure module temporary directories location.

.PARAMETER InstallationPath
    Path where the module will be installed. 
    Ex.: 'C:\TFSAdministration\TFSPowerShell'

.PARAMETER TFSPowershellTempDirLocation
    Path where all temporary workspaces used to handle vertion control operations will be created.
    Ex.: 'D:\temp'

.EXAMPLE
    InstallModules -InstallationPath "C:\TFSAdministration" -TFSPowershellTempDirLocation "D:\temp"
  
#>
Param(
    [Parameter(Mandatory=$true,HelpMessage="Path where the module will be installed. Ex.: 'C:\Program Files'")]
    [string]$InstallationPath,

    [Parameter(Mandatory=$true,HelpMessage="Path where all temporary workspaces used to handle vertion control operations will be created. Ex.: D:\Temp")]
    [string]$TFSPowershellTempDirLocation
)

#Adiciona a pasta dos módulos a variavel de ambiente que mapeia todas as pastas de modulos Powershell do sistema
Write-Output "Begining installation..."

Write-Output "Copying module to ""$InstallationPath""..."
Copy-item "$PSScriptRoot\Module\TFSPowershell" "$InstallationPath" -Recurse

$ModulePath = "$InstallationPath\TFSPowershell"
Write-Output "Adding ""$ModulePath"" to 'PSModulePath' environment variable..."
$newvalue = [environment]::GetEnvironmentVariable("PSModulePath","Machine")
$newvalue = $newvalue + ";"+"$ModulePath"
[Environment]::SetEnvironmentVariable("PSModulePath", $newvalue, "Machine")

Write-Verbose "Creating environment variable 'TFSPowershellTempDirLocation'..."
[Environment]::SetEnvironmentVariable("TFSPowershellTempDirLocation", $TFSPowershellTempDirLocation, "Machine")

Write-Verbose "Saving credentials securelly to be used in TFS REST API calls..."
.\GenerateRestCredential.ps1 -CredentialsFilePath "$ModulePath"

Write-Output "TFSPowershell module installation successfully done!"
