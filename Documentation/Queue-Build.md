---
external help file: TFSPowershell.Build.Help.xml
online version: 
schema: 2.0.0
---

# Queue-Build

## SYNOPSIS
Queues a new build.

## SYNTAX

```
Queue-Build [-CollectionUrl] <String> [-TeamProjectName] <String> [-BuildDefinitionName] <String>
 [[-Reason] <String>] [[-SourceBranch] <String>] [-WaitUntilBuildComplete] [<CommonParameters>]
```

## DESCRIPTION
Queues a new build by the build definition name.

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

### -TeamProjectName
The team project name.

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

### -BuildDefinitionName
The build definition name.

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

### -Reason
The reason why the build will be queued.
Accepted values is "manual" or "checkInShelveset" (when is a gated-checkin).

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 3
Default value: Manual
Accept pipeline input: False
Accept wildcard characters: False
```

### -SourceBranch
The branch from which the build will execute.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 4
Default value: ""
Accept pipeline input: False
Accept wildcard characters: False
```

### -WaitUntilBuildComplete
Informs for the function to not ends until the build complete.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
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

