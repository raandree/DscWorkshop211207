configuration Test1 {
    node localhost {
        File TestFile1 {
            DestinationPath = 'C:\TestFile1.txt'
            Type = 'File'
            Ensure = 'Present'
            Contents = '123'
        }

        $cred = New-Object pscredential('contoso\install', ('Somepass1' | ConvertTo-SecureString -AsPlainText -Force))

        File TestFile2 {
            DestinationPath = 'C:\TestFile2.txt'
            Type = 'File'
            Ensure = 'Present'
            SourcePath = '\\dscdo01\c$\request.inf'
            Credential = $cred
        }
    }
}

$cd = @{
    AllNodes = @(
        @{
            NodeName = "localhost"
            PSDscAllowPlainTextPassword = $true
            PSDscAllowDomainUser = $true
        }
    )
}

Remove-Item -Path C:\DSC\*

#By calling the configuration like a function a MOF file is created
Test1 -OutputPath C:\DSC -Verbose -ConfigurationData $cd

#this moves the MOF file to C:\Windows\System32\Configuration and starts the LCM 
#which uses the new MOF file and applies it
return

Start-DscConfiguration -Path C:\DSC -Wait -Verbose -Force

#returns whether we could successfully apply the MOF / all config items
Test-DscConfiguration -Detailed

#returns the current DSC configuration (C:\Windows\System32\Configuration\Current.mof)
Get-DscConfiguration

#start the LCM with the existing config (C:\Windows\System32\Configuration\Current.mof)
Start-DscConfiguration -UseExisting -Wait -Verbose