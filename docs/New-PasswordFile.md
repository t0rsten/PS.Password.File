# New-PasswordFile

## SYNOPSIS
New-PasswordFile

## SYNTAX

```
New-PasswordFile [[-Path] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
The function creates an AES encrypted password file as well as a file with the corresponding AES key.
When the function is called, the password to be encrypted is requested.

## EXAMPLES

### EXAMPLE 1
```
New-PasswordFile -Path 'C:\Temp'
```

Creates in the folder C:\Temp the password and AESKey file

## PARAMETERS

### -Path
Specifies the path where the files will be created.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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

Requires -Version 5.1

## RELATED LINKS
