---
external help file: TFSPowershell.Build.Help.xml
online version: 
schema: 2.0.0
---

# Get-BuildDefinitionById

## SYNOPSIS
Gets a build definition by its Id.

## SYNTAX

```
Get-BuildDefinitionById [-CollectionUrl] <String> [-TeamProjectName] <String> [-DefinitionId] <Int32>
```

## DESCRIPTION
Gets the full information of a build definition by its Id.

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

### -DefinitionId
The Id of the build definition.

```yaml
Type: Int32
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

