---
external help file: TFSPowershell.ServiceEndpoint.Help.xml
online version: 
schema: 2.0.0
---

# Get-ServiceEndpoints

## SYNOPSIS
Gets the service enpoints for a given Team Project.

## SYNTAX

```
Get-ServiceEndpoints [-CollectionUrl] <String> [-TeamProjectName] <String>
```

## DESCRIPTION
Gets the service enpoints for a given Team Project.

## EXAMPLES

### Example 1
```
PS C:\> Get-ServiceEndpoints -CollectionUrl https://myvisual.visualstudio.com -TeamProject myTeamproject
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
The Team Project name.

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

## INPUTS

### None


## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

