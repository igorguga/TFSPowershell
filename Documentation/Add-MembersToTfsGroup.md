---
external help file: TFSPowershell.Security.Help.xml
online version: 
schema: 2.0.0
---

# Add-MembersToTfsGroup

## SYNOPSIS
Adds a user to a TFS Group.

## SYNTAX

```
Add-MembersToTfsGroup [-CollectionUrl] <String> [-Group] <String> [-Members] <String[]>
```

## DESCRIPTION
Adds a user to a TFS Group.

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

### -Group
The name of the TFS security Group.

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

### -Members
A comma separeted list of users.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

