---
external help file: TFSPowershell.Tfs.Help.xml
online version: 
schema: 2.0.0
---

# Set-GlobalLists

## SYNOPSIS
Replace the global list of a collection.

## SYNTAX

```
Set-GlobalLists [[-CollectionUrl] <String>] [-GlobalLists] <String> [[-Tfs] <TfsTeamProjectCollection>]
```

## DESCRIPTION
Replace the global list of a collection, in the form of a XML string.

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

### -GlobalLists
Xml string of the global list to be imported.

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

### -Tfs
An instance of the object TfsTeamProjectCollection, that represents a TeamProjectCollection.
If informed the CollectionUrl will be ignored.

```yaml
Type: TfsTeamProjectCollection
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
Default value: $null
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

