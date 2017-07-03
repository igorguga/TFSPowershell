---
external help file: TFSPowershell.ServiceEndpoint.Help.xml
online version: 
schema: 2.0.0
---

# New-ServiceEndpoint

## SYNOPSIS
Creates a new service endpoint.

## SYNTAX

```
New-ServiceEndpoint [-CollectionUrl] <String> [-TeamProjectName] <String> [-NewEndPointJson] <String>
```

## DESCRIPTION
Creates a new service endpoint.

## EXAMPLES

### Example 1
```
PS C:\> New-ServiceEndpoint -CollectionUrl https://tfs2015.local/tfs/defaultcollection -TeamProjectName MyTeamProjet -NewEndPointJson $endpointJsonString
```
```
$endpointJsonString = @"
{
  "name": "SonarQube",
  "type": "sonarqube",
  "url": "https://mysonarqubeserver:9000",
  "authorization": {
    "scheme": "UsernamePassword",
    "parameters": {
      "username": "someUsername",
      "password": "sonarqubetoken"
    }
  }
}
"@
```

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

### -NewEndPointJson
A JSON string with the new endpoint data. See above an example for the string. More details [here](https://www.visualstudio.com/en-us/docs/integrate/api/endpoints/endpoints#create-a-service-endpoint).

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

### -TeamProjectName
The Team Project name.

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

## INPUTS

### None


## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

