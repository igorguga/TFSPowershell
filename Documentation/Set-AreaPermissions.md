---
external help file: TFSPowershell.Security.Help.xml
online version: 
schema: 2.0.0
---

# Set-AreaPermissions

## SYNOPSIS
Grants permissions in Areas.

## SYNTAX

```
Set-AreaPermissions [-CollectionUrl] <String> [-TeamProjectName] <String> [-AreaPath] <String>
 [-Members] <String[]> [-Actions] <String[]> [-Deny] [[-AreaURI] <String>] [[-Tfs] <TfsTeamProjectCollection>]
```

## DESCRIPTION
Grants permissions for users and/groups in Areas.

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

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TeamProjectName
The name of the Team Project the Area belongs.

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

### -AreaPath
Area path without the Team Project (Ex.: \Area 1\Sub-area 3).

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

### -Members
Users and/or groups to grant permissions.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Actions
Actions to be granted: WORK_ITEM_READ, WORK_ITEM_WRITE, GENERIC_READ, GENERIC_WRITE, CREATE_CHILDREN, DELETE, MANAGE_TEST_PLANS

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Deny
If informed, will deny the the action for the user and/or group informed.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AreaURI
The area URI.
Got from New-Area.
Ex.: vstfs:///Classification/Node/71e08ab3-62f7-4a9a-8430-fdcfca626401.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 5
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
Position: 6
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

