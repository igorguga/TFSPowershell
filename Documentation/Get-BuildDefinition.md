---
external help file: TFSPowershell.Build.Help.xml
online version: 
schema: 2.0.0
---

# Get-BuildDefinition

## SYNOPSIS
Gets a build definition.

## SYNTAX

```
Get-BuildDefinition [-CollectionUrl] <String> [-TeamProjectName] <String> [-BuildDefinitionName] <String>
 [[-Credentials] <PSCredential>]
```

## DESCRIPTION
Gets the build definition full information by its name.

## EXAMPLES

### Example 1
```
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -CollectionUrl
The Team Project Collection URL.
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
The Team Projact Name where the build definition belongs.

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

### -Credentials
The credentials to be used when retrieving the build definiton information.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

