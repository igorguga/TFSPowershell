---
external help file: TFSPowershell.ProjectManagement.Help.xml
online version: 
schema: 2.0.0
---

# Remove-Iteration

## SYNOPSIS
Removes the iteration.

## SYNTAX

```
Remove-Iteration [[-CollectionUrl] <String>] [-TeamProjectName] <String>
 [-IterationPathWithoutTeamProjectName] <String> [[-Tfs] <TfsTeamProjectCollection>] [<CommonParameters>]
```

## DESCRIPTION
Removes the iteration and links any related workitem to the parent iteration node.

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

### -TeamProjectName
The name of the team project.

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

### -IterationPathWithoutTeamProjectName
Iteration path from the Team Project name.
Ex.: beeing iteration path 'teamproject\Iteration0\Sprint1' so you have to inform '\Iteration0\Sprint1'.

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
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

