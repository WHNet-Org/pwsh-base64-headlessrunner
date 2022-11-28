Write-Host -ForegroundColor Green "$(Get-Date -Format s) - Initialising..."

#region Imports
Write-Host -NoNewline -ForegroundColor Yellow "$(Get-Date -Format s) - Importing modules ... "
$RequiredModules = @('Helpers')
foreach ($RequiredModule in $RequiredModules) {
    Import-Module -Name $(Join-Path $PSScriptRoot "Modules\$RequiredModule.psm1") -Force
}
Write-Host -NoNewline -ForegroundColor Green "`r$(Get-Date -Format s) - Importing modules ... Done !"
Write-Host ""
#endregion


#region Initialize environment variables
Write-Host -NoNewline -ForegroundColor Yellow "$(Get-Date -Format s) - Initializing environment variables ... "
if (Test-Path -Path $(Join-Path -Path $PSScriptRoot -ChildPath "Conf\Env.ps1")) {
    # Import Conf\Env.ps1 local config if file exist
    . $(Join-Path -Path $PSScriptRoot -ChildPath "Conf\Env.ps1")
}
Else {
    # Empty $EnvFile variable to ensure we are not processing it
    $Global:EnvFile = @{}
}

# Hard coded / read-only variables
$env:AppConfig_Name = "PowerShell Base64 headless runner"
$env:AppConfig_Version = "0.0.1"

# Variables name list and defaults
$EnvVars = @{
    Payload           = ""
    AppConfig_DevMode = "false"
}

Initialize-EnvironmentVariables -Variables $EnvVars
Write-Host -NoNewline -ForegroundColor Green "`r$(Get-Date -Format s) - Initializing environment variables ... Done !"
Write-Host ""
#endregion

Write-Host -ForegroundColor Green "$(Get-Date -Format s) - Starting $env:AppConfig_Name v$env:AppConfig_Version ..."