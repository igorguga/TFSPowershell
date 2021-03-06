---
external help file: TFSPowershell.ProjectManagement.Help.xml
online version: 
schema: 2.0.0
---

# Set-TeamDefaultAreaAndIteration

## SYNOPSIS
Sets the default Area and Iteration for a Team.

## SYNTAX

```
Set-TeamDefaultAreaAndIteration [[-CollectionUrl] <String>] [-Team] <TeamFoundationTeam>
 [-IterationPath] <String> [-AreaPath] <String> [[-Tfs] <TfsTeamProjectCollection>]
```

## DESCRIPTION
Sets the default Area and Iteration for a Team.

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
The TeamFoundatinTeam object that represents a team.
Can be retrieved by the function Get-Team.

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

### -IterationPath
The full iteration path (including the team project).
Ex.: "\TeamProjectName\IterationPath"

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

### -AreaPath
The full area path (including the team project).
Ex.: "\TeamProjectName\AreaPath"

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

### -Tfs
An instance of the object TfsTeamProjectCollection, that represents a TeamProjectCollection.
If informed the CollectionUrl will be ignored.

```yaml
Type: TfsTeamProjectCollection
Parameter Sets: (All)
Aliases: 

Required: False
Position: 4
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

