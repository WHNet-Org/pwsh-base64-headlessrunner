function Initialize-EnvironmentVariables ([hashtable]$Variables) {
    foreach ($EnvVar in $Variables.Keys) {
        If (![string]::IsNullOrEmpty($Global:EnvFile[$EnvVar])) {
            # Set variable to Env.ps1 value
            [Environment]::SetEnvironmentVariable($EnvVar, $Global:EnvFile[$EnvVar], 'Process')
        }
        Else {
            if (![string]::IsNullOrEmpty($([Environment]::GetEnvironmentVariable($EnvVar, 'Machine')))) {
                # Set variable to machine Env
                [Environment]::SetEnvironmentVariable($EnvVar, $([Environment]::GetEnvironmentVariable($EnvVar, 'Machine')), 'Process')
            }
            elseif (![string]::IsNullOrEmpty($([Environment]::GetEnvironmentVariable($EnvVar, 'Process')))) {
                # Set variable to process Env (Docker)
                [Environment]::SetEnvironmentVariable($EnvVar, $([Environment]::GetEnvironmentVariable($EnvVar, 'Process')), 'Process')
            }
            Else {
                # Set variable to default
                [Environment]::SetEnvironmentVariable($EnvVar, $EnvVars[$EnvVar], 'Process')
            }
        }
    }
}

Export-ModuleMember -Function *