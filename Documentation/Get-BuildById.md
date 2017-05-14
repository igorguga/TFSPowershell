---
external help file: TFSPowershell.Build.Help.xml
online version: 
schema: 2.0.0
---

# Get-BuildById

## SYNOPSIS
Gets a build by Id.

## SYNTAX

```
Get-BuildById [-CollectionUrl] <String> [-TeamProjectName] <String> [-BuildId] <String>
```

## DESCRIPTION
Gets the build information by its Id.

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
The of of the Team Project that the build belongs.

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

### -BuildId
The Id of the build.

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

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

