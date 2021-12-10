configuration Test1 {
    param (
        [string[]]$Credential
    )

    Import-DscResource -ModuleName NetworkingDsc
    
    node $AllNodes.NodeName {
        if ($node.Role -eq 'WebServer') {
            WindowsFeature IIS {
                Name = 'WebServer'
                Ensure = 'Present'
            }
        }

        File TestFile1 {
            DestinationPath = 'C:\TestFile1.txt'
            Type = 'File'
            Ensure = 'Absent'
            Contents = $node.TestFile1Contents
        }

        File TestFile2 {
            DestinationPath = 'C:\TestFile2.txt'
            Type = 'File'
            Ensure = 'Present'
            SourcePath = '\\dscdo01\c$\request.inf'
            Credential = $cred
        }

        IPAddress ip1 {
            IPAddress = $node.IpAddress
            InterfaceAlias = $node.InterfaceAlias
            AddressFamily = 'IPv4'
        }
    }
}

$cd = Import-PowerShellDataFile -Path "$PSScriptRoot\09 Config Data in PSD1.psd1"

Remove-Item -Path C:\DSC\* -ErrorAction SilentlyContinue

$cred = New-Object pscredential('contoso\install', ('Somepass1' | ConvertTo-SecureString -AsPlainText -Force))
Test1 -Credential $cred -ConfigurationData $cd -OutputPath C:\DSC -Verbose
