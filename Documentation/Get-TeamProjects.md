---
external help file: TFSPowershell.Tfs.Help.xml
online version: 
schema: 2.0.0
---

# Get-TeamProjects

## SYNOPSIS
Gets all Collection Team Projects.
## SYNTAX

```
Get-TeamProjects [[-CollectionUrl] <String>]
```

## DESCRIPTION
Gets all Team Projects information of a given Collection/Subscription.

## EXAMPLES

### Example 1
```
PS C:\> Get-TeamProjects -CollectionUrl https://myvisual.visualstudio.com
```

Gets all team projects from "myvisual" collection.

## PARAMETERS

### -CollectionUrl
The TeamProjectCollection URL.
Ex.: https://tfs2015.local/tfs/defaultcollection. 

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

