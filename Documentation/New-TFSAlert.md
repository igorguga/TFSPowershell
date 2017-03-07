---
external help file: TFSPowershell.Tfs.Help.xml
online version: 
schema: 2.0.0
---

# New-TFSAlert

## SYNOPSIS
Creates a new TFS Alert.

## SYNTAX

```
New-TFSAlert [[-CollectionUrl] <String>] [-AlertName] <String> [-SubscriberAccountName] <String>
 [-FilterExpression] <String> [-EventType] <String> [[-Tfs] <TfsTeamProjectCollection>]
```

## DESCRIPTION
Creates a new TFS Alert for a specific collection.

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
The user or group that will subscribe to the alert.

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

### -FilterExpression
The filter expression used by the alert. 
Ex:
  "CoreFields/StringFields/Field\[Name='Area Path'\]/NewValue" = '\AreaPath' AND 
  "CoreFields/StringFields/Field\[Name='Authorized As'\]/NewValue" \<\> '@@MyDisplayName@@' AND 
  ("CoreFields/StringFields/Field\[Name='Work Item Type'\]/NewValue" = 'Requirement' OR 
   "CoreFields/StringFields/Field\[Name='Work Item Type'\]/NewValue" = 'Issue' OR 
   "CoreFields/StringFields/Field\[Name='Work Item Type'\]/NewValue" = 'Bug') AND 
   " ""CoreFields/StringFields/Field\[Name='State'\]/NewValue"" \<\> ""CoreFields/StringFields/Field\[Name='State'\]/OldValue"" "

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

### -EventType
The name of the event that will be subscribed.
Ex.: "WorkItemChangedEvent"

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 4
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
Position: 5
Default value: $null
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

