# Read-PasswordFile

## SYNOPSIS
Read-PasswordFile

## SYNTAX

```
Read-PasswordFile [-KeyFile] <String[]> [-PwdFile] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Reads a password file and decrypts the file using a key file.
The password is returned as a secure string.

## EXAMPLES

### EXAMPLE 1
```
$secPassword = Read-PasswordFile -KeyFile 'C:\Temp\pwd.key' -PwdFile 'C:\Temp\pwd.file'
```

## PARAMETERS

### -KeyFile
Specifies the file to AES key.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PwdFile
Specifies the date to the encrypted password.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Author: Torsten Demmich
Mail: torsten.demmich@gmail.com

## RELATED LINKS
