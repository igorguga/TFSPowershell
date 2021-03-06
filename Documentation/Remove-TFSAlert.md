---
external help file: TFSPowershell.Tfs.Help.xml
online version: 
schema: 2.0.0
---

# Remove-TFSAlert

## SYNOPSIS
Removes a TFS Alert.

## SYNTAX

```
Remove-TFSAlert [[-CollectionUrl] <String>] [-AlertName] <String> [-SubscriberAccountName] <String>
 [[-Tfs] <TfsTeamProjectCollection>]
```

## DESCRIPTION
Removes a TFS Alert by its name.

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

### -AlertName
The name of the alert.

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

### -SubscriberAccountName
The user or group that subscribe to the alert.

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

### -Tfs
An instance of the object TfsTeamProjectCollection, that represents a TeamProjectCollection.
If informed the CollectionUrl will be ignored.

```yaml
Type: TfsTeamProjectCollection
Parameter Sets: (All)
Aliases: 

Required: False
Position: 3
Default value: $null
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

