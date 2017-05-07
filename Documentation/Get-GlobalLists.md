---
external help file: TFSPowershell.Tfs.Help.xml
online version: 
schema: 2.0.0
---

# Get-GlobalLists

## SYNOPSIS
Gets the Global list of the collection.

## SYNTAX

```
Get-GlobalLists [[-CollectionUrl] <String>] [[-Tfs] <TfsTeamProjectCollection>]
```

## DESCRIPTION
Gets the Global list xml of the collection.

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
Note: if the 'Tfs' parameter was informed, this parameter will be ignored.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tfs
An instance of the object TfsTeamProjectCollection, that represents a TeamProjectCollection.
If informed the CollectionUrl will be ignored.

```yaml
Type: TfsTeamProjectCollection
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: $null
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

