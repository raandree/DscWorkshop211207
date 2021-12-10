[DscLocalConfigurationManager()]
Configuration LcmConfig
{
    Node localhost
    {
        Settings
        {
            ActionAfterReboot              = 'ContinueConfiguration'
            AllowModuleOverWrite           = $True
            ConfigurationMode              = 'ApplyAndAutoCorrect'
            ConfigurationModeFrequencyMins = 15
            RefreshFrequencyMins           = 30
            StatusRetentionTimeInDays      = 7
            RebootNodeIfNeeded             = $True
            RefreshMode                    = 'Push'
            CertificateID                  = 'b4b5525e1dd484f36561a13aacce6bd247aaa6cd'
        }
    }
}

Remove-Item -Path C:\DSC\* -ErrorAction SilentlyContinue

LcmConfig -OutputPath C:\DSC

Set-DSCLocalConfigurationManager -Path C:\DSC -Verbose
