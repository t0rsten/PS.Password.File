function New-PasswordFile {
  <#
    .SYNOPSIS
      New-PasswordFile

    .DESCRIPTION
      The function creates an AES encrypted password file as well as a file with the corresponding AES key. When the function is called, the password to be encrypted is requested.

    .PARAMETER Path
      Specifies the path where the files will be created.

    .EXAMPLE
      New-PasswordFile -Path 'C:\Temp'
      Creates in the folder C:\Temp the password and AESKey file

    .NOTES
      Author: Torsten Demmich
      Mail: torsten.demmich@gmail.com
  #>
  #Requires -Version 5.1

  [CmdletBinding()]
  param (
    [Parameter(Mandatory=$false,ValueFromPipeline=$false)]
    [ValidateScript({
      If(Test-Path -Path $_ -PathType Container){
        $true }
      else {
        throw '{0} is not a valid Directory' -f $_
      }
    })]
    [string[]]$Path
  )

    $pwdKey = '{0}\{1}' -f $Path.TrimEnd('\'), 'pwd.key'
    $pwdFile = '{0}\{1}' -f $Path.TrimEnd('\'), 'pwd.file'
    $password = Read-Host 'Enter password' -AsSecureString

    $AESKey = New-Object Byte[] 32
    [Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($AESKey)
    Set-Content -Value $AESKey -Path $pwdKey
    $password | ConvertFrom-SecureString -key (Get-Content $pwdKey) | Set-Content $pwdFile

}

function Read-PasswordFile {
  <#
    .SYNOPSIS
      Read-PasswordFile

    .DESCRIPTION
      Reads a password file and decrypts the file using a key file. The password is returned as a secure string.

    .PARAMETER KeyFile
      Specifies the file to AES key.

    .PARAMETER PwdFile
      Specifies the date to the encrypted password.

    .EXAMPLE
      $secPassword = Read-PasswordFile -KeyFile 'C:\Temp\pwd.key' -PwdFile 'C:\Temp\pwd.file'

    .NOTES
      Author: Torsten Demmich
      Mail: torsten.demmich@gmail.com
  #>

  #Requires -Version 5.1

  [CmdletBinding()]
  param (
    [Parameter(Mandatory=$true,ValueFromPipeline=$false)]
    [ValidateScript({
      If(Test-Path -Path $_ -PathType leaf){
        $true }
      else {
        throw '{0} is not a valid file' -f ($_)
      }
    })]
    [string[]]$KeyFile,

    [Parameter(Mandatory=$true,ValueFromPipeline=$false)]
    [ValidateScript({
      If(Test-Path -Path $_ -PathType leaf){
        $true }
      else {
        throw '{0} is not a valid file' -f ($_)
      }
    })]
    [string[]]$PwdFile
  )

  process {

    $AESKey = Get-Content $KeyFile
    $pwdHash = Get-Content $PwdFile
    $securePwd = $pwdHash | ConvertTo-SecureString -Key $AESKey

  }

  end {

    return $securePwd

  }
}