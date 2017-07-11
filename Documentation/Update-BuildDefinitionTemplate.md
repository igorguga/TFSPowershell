---
external help file: TFSPowershell.Build.Help.xml
online version: 
schema: 2.0.0
---

# Update-BuildDefinitionTemplate

## SYNOPSIS
Updates a build definition template.

## SYNTAX

```
Update-BuildDefinitionTemplate [-CollectionUrl] <String> [-TeamProjectName] <String> [-TemplateId] <String>
 [-UpdatedBuildDefTemplateJson] <String>
```

## DESCRIPTION
Updates a build definition template.

## EXAMPLES

### Example 1
```
PS C:\> Update-BuildDefinitionTemplate -CollectionUrl https://tfs2015.local/tfs/defaultcollection -TeamProjectName MyTeamProjet -TemplateId "My CI Builds" -UpdatedBuildDefTemplateJson $buildDefTemplateJsonString
```

```
$buildDefTemplateJsonString = @"
{
  "name": "My CI Builds",
  "description": "A custom template for My CI builds",
  "template": {
    "build": [
      {
        "enabled": true,
        "continueOnError": false,
        "alwaysRun": false,
        "displayName": "Build solution **\\*.sln",
        "task": {
          "id": "71a9a2d3-a98a-4caa-96ab-affca411ecda",
          "versionSpec": "*"
        },
        "inputs": {
          "solution": "**\\*.sln",
          "msbuildArgs": "",
          "platform": "$(platform)",
          "configuration": "$(config)",
          "clean": "false",
          "restoreNugetPackages": "true",
          "vsLocationMethod": "version",
          "vsVersion": "latest",
          "vsLocation": "",
          "msbuildLocationMethod": "version",
          "msbuildVersion": "latest",
          "msbuildArchitecture": "x86",
          "msbuildLocation": "",
          "logProjectEvents": "true"
        }
      },
      {
        "enabled": true,
        "continueOnError": false,
        "alwaysRun": false,
        "displayName": "Test Assemblies **\\*test*.dll;-:**\\obj\\**",
        "task": {
          "id": "ef087383-ee5e-42c7-9a53-ab56c98420f9",
          "versionSpec": "*"
        },
        "inputs": {
          "testAssembly": "**\\*test*.dll;-:**\\obj\\**",
          "testFiltercriteria": "",
          "runSettingsFile": "",
          "codeCoverageEnabled": "true",
          "otherConsoleOptions": "",
          "vsTestVersion": "14.0",
          "pathtoCustomTestAdapters": ""
        }
      }
    ],
    "buildNumberFormat": "$(date:yyyyMMdd)$(rev:.r)",
    "jobAuthorizationScope": "projectCollection",
    "triggers": [
      {
        "batchChanges": false,
        "branchFilters": "",
        "triggerType": "continuousIntegration"
      }
    ],
    "variables": {
      "forceClean": {
        "value": "false",
        "allowOverride": true
      },
      "config": {
        "value": "debug, release",
        "allowOverride": true
      },
      "platform": {
        "value": "any cpu",
        "allowOverride": true
      }
    }
  }
}
"@
```

## PARAMETERS

### -CollectionUrl
The TeamProjectCollection URL.
Ex.: https://tfs2015.local/tfs/defaultcollection. 

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TeamProjectName
The Team Project name.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TemplateId
The Id of the Build Definition Template. Usually it is the same as the Build Definition Template name.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UpdatedBuildDefTemplateJson
A JSON string with the updated build definition template data. See on "Example 1" a sample string for this parameter. More details [here](https://www.visualstudio.com/en-us/docs/integrate/api/build/definition-templates#create-or-update-a-build-definition-template).

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

