---
external help file: TFSPowershell.Workitems.Help.xml
online version: 
schema: 2.0.0
---

# Destroy-WorkItemById

## SYNOPSIS
Deletes a workitem and all its history.

## SYNTAX

```
Destroy-WorkItemById [[-CollectionUrl] <String>] [-WorkitemId] <Int32> [[-Tfs] <TfsTeamProjectCollection>]
```

## DESCRIPTION
Permanently deletes a workitem and all its history.
It will not be moved to recycle bin.

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

### -WorkitemId
The workitem Id.

```yaml
Type: Int32
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
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

