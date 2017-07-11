---
external help file: TFSPowershell.Build.Help.xml
online version: 
schema: 2.0.0
---

# Get-BuildDefinitionTemplates

## SYNOPSIS
Gets all build definition templates of a given Team Project.

## SYNTAX

```
Get-BuildDefinitionTemplates [-CollectionUrl] <String> [-TeamProjectName] <String>
```

## DESCRIPTION
Gets all build definition templates of a given Team Project.

## EXAMPLES

### Example 1
```
PS C:\> Get-BuildDefinitionTemplates -CollectionUrl https://myvisual.visualstudio.com -TeamProject myTeamproject
```

Retrieves all Build Definition Templates from "myTeamproject" team project.

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

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

