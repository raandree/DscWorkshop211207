configuration Test1 {

    Import-DscResource -ModuleName NetworkingDsc
    
    node ('DSCFile01') {
        File TestFile1 {
            DestinationPath = 'C:\TestFile.txt'
            Type = 'File'
            Ensure = 'Absent'
            Contents = '123'
        }

        IPAddress ip1 {
            IPAddress = '192.168.111.101'
            InterfaceAlias = 'DscWorkshop 0'
            AddressFamily = 'IPv4'
        }
    }
}

Remove-Item -Path C:\DSC\*

#By calling the configuration like a function a MOF file is created
Test1 -OutputPath C:\DSC -Verbose
