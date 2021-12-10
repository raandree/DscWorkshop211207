configuration Test1 {

    Import-DscResource -ModuleName RemoveLargeFile
    
    node ('DSCFile01') {
        File TestFile1 {
            DestinationPath = 'C:\TestFile.txt'
            Type = 'File'
            Ensure = 'Absent'
            Contents = '123'
        }

        RemoveLargeFile removeTest1 {
            Path = 'C:\Test1'
            Size = 100KB
        }

        RemoveLargeFile removeTest2 {
            Path = 'C:\Test2'
            Size = 100KB
        }
    }
}

Remove-Item -Path C:\DSC\*

#By calling the configuration like a function a MOF file is created
Test1 -OutputPath C:\DSC -Verbose

Start-DscConfiguration -Path C:\DSC -Wait -Verbose
