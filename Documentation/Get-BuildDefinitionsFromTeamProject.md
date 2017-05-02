---
external help file: TFSPowershell.Build.Help.xml
online version: 
schema: 2.0.0
---

# Get-BuildDefinitionsFromTeamProject

## SYNOPSIS

## SYNTAX

```
Get-BuildDefinitionsFromTeamProject [-CollectionUrl] <String> [-TeamProjectName] <String>
 [[-nameFilter] <String>] [[-typeFilter] <String>] [[-Credentials] <PSCredential>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### Example 1
```
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -CollectionUrl
{{Fill CollectionUrl Description}}

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

### -TeamProjectName
{{Fill TeamProjectName Description}}

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

### -nameFilter
Filters to definitions whose names equal this value.
Append a * to filter to definitions whose names start with this value.
For example: MS*.

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

### -typeFilter
The type of the build definitions to retrieve.
If not specified, all types will be returned.

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

### -Credentials
{{Fill Credentials Description}}

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

