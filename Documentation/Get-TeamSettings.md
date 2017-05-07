---
external help file: TFSPowershell.ProjectManagement.Help.xml
online version: 
schema: 2.0.0
---

# Get-TeamSettings

## SYNOPSIS
Gets the team settings.

## SYNTAX

```
Get-TeamSettings [[-CollectionUrl] <String>] [-Team] <TeamFoundationTeam> [[-Tfs] <TfsTeamProjectCollection>]
```

## DESCRIPTION
Gets the settings of the team: BacklogIterationPath, CurrentIteratinPath, IterationPaths, TeamField, etc (https://msdn.microsoft.com/en-us/library/microsoft.teamfoundation.processconfiguration.client(v=vs.110).aspx)

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

### -Team
The object representing the Team.
You can use Get-Team to retrieve this object.

```yaml
Type: TeamFoundationTeam
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

