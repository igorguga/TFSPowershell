---
external help file: TFSPowershell.SourceControl.Help.xml
online version: 
schema: 2.0.0
---

# Destroy-TFVCServerItem

## SYNOPSIS
Pemanently removes a TFVC server item.

## SYNTAX

```
Destroy-TFVCServerItem [[-CollectionUrl] <String>] [-ServerItemPath] <String> [[-VersionSpec] <VersionSpec>]
 [[-Tfs] <TfsTeamProjectCollection>]
```

## DESCRIPTION
Pemanently removes a TFVC server item.
Caution!
All the history of the item will be lost!

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

### -ServerItemPath
The server path for the item to be permanently removed.

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

### -VersionSpec
The item version specification.
The default value is "Latest".

```yaml
Type: VersionSpec
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
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
Position: 3
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

