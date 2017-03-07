---
external help file: TFSPowershell.Build.Help.xml
online version: 
schema: 2.0.0
---

# Queue-BuildByDefinitionId

## SYNOPSIS
Queues a new build by the build definition Id.

## SYNTAX

```
Queue-BuildByDefinitionId [-CollectionUrl] <String> [-TeamProjectName] <String> [-DefinitionId] <Int32>
 [[-Reason] <String>] [[-SourceBranch] <String>] [-WaitUntilBuildComplete] [[-Credentials] <PSCredential>]
```

## DESCRIPTION
Queues a new build by the build definition Id.

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

### -DefinitionId
The build definition Id.

```yaml
Type: Int32
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
Default value: None
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
Default value: None
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

### -Credentials
The credentials to be used when queueing the build.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

