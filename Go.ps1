. $(Join-Path -Path $(Split-Path -Parent -Path $MyInvocation.MyCommand.Definition) -ChildPath "Init.ps1")
#$InvocationPath = $MyInvocation.MyCommand.Definition

$Script = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($env:Payload))

powershell -EncodedCommand $env:Payload