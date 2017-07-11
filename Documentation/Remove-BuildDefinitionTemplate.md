---
external help file: TFSPowershell.Build.Help.xml
online version: 
schema: 2.0.0
---

# Remove-BuildDefinitionTemplate

## SYNOPSIS
Deletes a build definition template.

## SYNTAX

```
Remove-BuildDefinitionTemplate [-CollectionUrl] <String> [-TeamProjectName] <String>
 [-BuildDefTemplateId] <String>
```

## DESCRIPTION
Deletes a build definition template.

## EXAMPLES

### Example 1
```
PS C:\> Remove-BuildDefinitionTemplate -CollectionUrl https://myvisual.visualstudio.com -TeamProjectName myTeamproject
 -BuildDefTemplateId "MyCITemplate"
```

Deletes "MyCITemplate" Build Definition Template.

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

### -BuildDefTemplateId
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

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

