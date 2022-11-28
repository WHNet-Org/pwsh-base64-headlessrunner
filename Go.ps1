. $(Join-Path -Path $(Split-Path -Parent -Path $MyInvocation.MyCommand.Definition) -ChildPath "Init.ps1")

pwsh -EncodedCommand $env:Payload