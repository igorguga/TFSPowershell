---
external help file: TFSPowershell.SourceControl.Help.xml
online version: 
schema: 2.0.0
---

# Merge-TFVCServerItems

## SYNOPSIS
Merges to branches of a TFVC Repository.

## SYNTAX

```
Merge-TFVCServerItems [[-CollectionUrl] <String>] [-FromServerItemPath] <String>
 [-TargetServerItemPath] <String> [[-FromVersionSpec] <VersionSpec>] [[-TargetVersionSpec] <VersionSpec>]
 [[-LockLevel] <LockLevel>] [[-RecursionType] <RecursionType>] [[-MergeOptions] <MergeOptions>]
 [[-Tfs] <TfsTeamProjectCollection>] [<CommonParameters>]
```

## DESCRIPTION
Merges to branches of a TFVC Repository.

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

### -FromServerItemPath
The server path for the source branch of the merge.

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

### -TargetServerItemPath
The server path for the target branche of the merge.

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

### -FromVersionSpec
The version specification of the source branch of the merge. If null, the latest version will be considered.

```yaml
Type: VersionSpec
Parameter Sets: (All)
Aliases: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetVersionSpec
The version specification of the target branch of the merge. If null, the latest version will be considered.

```yaml
Type: VersionSpec
Parameter Sets: (All)
Aliases: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LockLevel
The lock level to be used during the merge. 'None' is the default version.

```yaml
Type: LockLevel
Parameter Sets: (All)
Aliases: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RecursionType
The recursion type of the merge. The default value is Full.

```yaml
Type: RecursionType
Parameter Sets: (All)
Aliases: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MergeOptions
Optional merge options to be set. The default is 'None'.

```yaml
Type: MergeOptions
Parameter Sets: (All)
Aliases: 

Required: False
Position: 7
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
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

