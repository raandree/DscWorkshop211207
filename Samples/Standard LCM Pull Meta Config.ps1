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
            RefreshMode                    = 'Pull'
        }

        ConfigurationRepositoryWeb web {
            ServerURL = 'HTTPS://DSCPULL01.contoso.com:8080/PSDSCPullServer.svc'
            RegistrationKey = 'ec717ee9-b343-49ee-98a2-26e53939eecf'
            ConfigurationNames = $env:COMPUTERNAME
        }
    }
}

Remove-Item -Path C:\DSC\* -ErrorAction SilentlyContinue

LcmConfig -OutputPath C:\DSC

Set-DSCLocalConfigurationManager -Path C:\DSC -Verbose

Update-DscConfiguration -Wait -Verbose