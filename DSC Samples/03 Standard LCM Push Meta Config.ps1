[DscLocalConfigurationManager()]
Configuration LcmConfig
{
    Node localhost
    {
        Settings
        {
            ActionAfterReboot              = 'ContinueConfiguration'
            DebugMode                      = 'ForceModuleImport'
            AllowModuleOverWrite           = $True
            ConfigurationMode              = 'ApplyAndAutoCorrect'
            ConfigurationModeFrequencyMins = 15
            RefreshFrequencyMins           = 30
            StatusRetentionTimeInDays      = 7
            RebootNodeIfNeeded             = $True
            RefreshMode                    = 'Push'
        }
    }
}

Remove-Item -Path C:\DSC\* -ErrorAction SilentlyContinue

LcmConfig -OutputPath C:\DSC

Set-DSCLocalConfigurationManager -Path C:\DSC -Verbose
