<p align="center">
<a href="https://github.com/t0rsten/PS.Password.File"><img alt="GitHub top language" src="https://img.shields.io/github/languages/top/t0rsten/PS.Password.File"></a>
<a href="https://www.powershellgallery.com/packages/PS.Password.File/"><img alt="PowerShell Gallery" src="https://img.shields.io/powershellgallery/v/PS.Password.File"></a>
<a href="https://github.com/t0rsten/PS.Password.File/blob/master/LICENSE"><img alt="GitHub" src="https://img.shields.io/github/license/t0rsten/PS.Password.File"></a>
<a href="https://www.powershellgallery.com/packages/PS.Password.File/"><img alt="PowerShell Gallery" src="https://img.shields.io/powershellgallery/p/PS.Password.File?color=blue"></a><br>
</p>


# PS.Password.File
A Powershell Module to handle passwords.

In order to use passwords in Powershell scripts and not to store them as plain text in the script, it is useful to read in the password as a SecureString and export/import it in an encrypted file. The Windows-internal Data Protection API (DPAPI) is used for this purpose. The disadvantage of this is that the encrypted file can only be decrypted by the same user and the same computer.

As an alternative, the password file can be encrypted and decrypted with an AES key. The advantage of this method is that the decryption can be done on any computer and independently of a user. However, a keyfile is absolutely necessary for decryption.

This module can both create these files and read the password back in to use them.

### Table of Contents
**[Functions](#functions)**<br>
**[Installation](#installation)**<br>
**[Examples](#examples-of-usage)**<br>
**[Documentation](#documentation)**<br>
**[Changelog](#changelog)**<br>


### Functions
| Name              | Description                                                                                                                                                                   |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| New-PasswordFile  | The function creates an AES encrypted password file as well as a file with the corresponding AES key. When the function is called, the password to be encrypted is requested. |
| Read-PasswordFile | Reads a password file and decrypts the file using a key file. The password is returned as a secure string.                                                                    |

### Installation
Install from Powershell Gallery

```Powershell
Install-Module -Name PS.Password.File
```

### Examples of usage
Creates password and key file. The password is requested interactively. The cmdlet then creates the files *pwd.key* and *pwd.file*.
``` Powershell
New-PasswordFile -Path 'C:\Temp'
```
Reading the password and creating a credential object
``` Powershell
# read pwd as secure string
$secPwd = Read-PasswordFile -KeyFile 'C:\Temp\pwd.key' -PwdFile 'C:\Temp\pwd.file'

# build credential object
$username = 'John.Doe'
$credObject = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $secPwd
```
### Documentation
[New-PasswordFile](docs/New-PasswordFile.md)<br>
[Read-PasswordFile](docs/Read-PasswordFile.md)
### Changelog
#### Version 1.0.0
- Initial Version
---
Made with :heart: and :coffee: