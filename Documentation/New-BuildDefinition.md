---
external help file: TFSPowershell.Build.Help.xml
online version: 
schema: 2.0.0
---

# New-BuildDefinition

## SYNOPSIS
Creates a new build definition.

## SYNTAX

```
New-BuildDefinition [-CollectionUrl] <String> [-TeamProjectName] <String> [-TemplateName] <String>
 [-BuildDefinitionName] <String> [[-TemplateTeamProjectName] <String>] [[-OverwriteParameters] <Hashtable>]
 [<CommonParameters>]
```

## DESCRIPTION
Creates a new build definition from a build definition template informed.
Optionally you can inform a hashtable with paths e values of build definitons properties to be overwrited during the creation of the build definition.
Ex:

$parameters = @{
    "repository.properties.tfvcMapping" = "\"{\"\"mappings\"\":\[{\"\"serverPath\"\":\"\"$repositoryServerPath\"\",\"\"mappingType\"\":\"\"map\"\",\"\"localPath\"\":\"\"\\\\\"\"}\]}\"";
    "variables.BranchName.value" = "$BranchName";
    "triggers\[0\].pathFilters" = "\[System.Array\[\]\]@(\"+$repositoryServerPath\")";
    "build\[1\].inputs.connectedServiceName" = "$sonarEndpointId"
}

New-BuildDefinition -CollectionUrl $Tfs.Uri.AbsoluteUri -TeamProjectName $TeamProjectName -TemplateName $templateName  -BuildDefinitionName $buildDefinitionName -TemplateTeamProjectName $TeamProjectBuildTemplate -OverwriteParameters $parameters

## EXAMPLES

### Example 1
```
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -CollectionUrl
The TeamProjectCollection URL.
Ex.: https://tfs2015.local/tfs/defaultcollection.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TeamProjectName
The Team Project Name.

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

### -TemplateName
The name of the template from the new build definition will be created.

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

### -BuildDefinitionName
The name of the new build definition.

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

### -TemplateTeamProjectName
The name of the Team Project where the build definition template belongs.
If not informed, it will be assumed the same team project of the new build definition that will be created.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OverwriteParameters
A hashtable with the path (in the json of the build definition template) and value for parameters of build definition to be overwrited.
Ex.:

@{
     "repository.properties.tfvcMapping" = "\"{\"\"mappings\"\":\[{\"\"serverPath\"\":\"\"$repositoryServerPath\"\",\"\"mappingType\"\":\"\"map\"\",\"\"localPath\"\":\"\"\\\\\"\"}\]}\"";
     "variables.BranchName.value" = "$BranchName";
     "triggers\[0\].pathFilters" = "\[System.Array\[\]\]@(\"+$repositoryServerPath\")";
     "build\[1\].inputs.connectedServiceName" = "$sonarEndpointId"
  }

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

