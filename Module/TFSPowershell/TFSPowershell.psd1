#
# Module manifest for module 'PSGet_TFSPowershell'
#
# Generated by: Igor Macedo
#
# Generated on: 5/6/2017
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'TFSPowershell.Tfs'

# Version number of this module.
ModuleVersion = '0.3.0'

# ID used to uniquely identify this module
GUID = '245d95e7-7b7f-4237-b2ba-db410a10b894'

# Author of this module
Author = 'Igor Macedo'

# Company or vendor of this module
CompanyName = 'Igor Macedo'

# Copyright statement for this module
Copyright = '(c) 2015 Igor Macedo. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Functions to handle TFS Entities.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @('TFSPowershell.Security', 
               'TFSPowershell.ProjectManagement', 
               'TFSPowershell.Workitems', 
               'TFSPowershell.SourceControl', 
               'TFSPowershell.Build', 
               'TFSPowershell.Utils',
               'TFSPowershell.ServiceEndpoint')


# Cmdlets to export from this module
# CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module
# AliasesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess
# PrivateData = ''
PrivateData = @{ 

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'TFS,VSTS,DEVOPS,Automation'

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/igorguga/TFSPowershell/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/igorguga/TFSPowershell'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = 'Support for PAT credentials.'

        # External dependent modules of this module
        # ExternalModuleDependencies = ''

    } # End of PSData hashtable
    
 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

