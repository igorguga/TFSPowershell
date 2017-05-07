---
external help file: TFSPowershell.SourceControl.Help.xml
online version: 
schema: 2.0.0
---

# Add-FolderToTFVC

## SYNOPSIS
Uploads a foder to a TFVC repository.

## SYNTAX

```
Add-FolderToTFVC [[-CollectionUrl] <String>] [-ServerPathToAddFolder] <String> [-LocalFolderPath] <String>
 [-CheckinDescription] <String> [[-Tfs] <TfsTeamProjectCollection>]
```

## DESCRIPTION
Uploads a folder to a TFVC repository.

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

### -ServerPathToAddFolder
The server path where the folder will be uploaded.

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

### -LocalFolderPath
The local path to the folder you want to upload.

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

### -CheckinDescription
The message to be seted with the upload check-in.

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

