configuration Test1 {

    Import-DscResource -ModuleName RemoveLargeFile
    
    node localhost {
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

Invoke-LabDscConfiguration -Configuration (Get-Command -Name Test1) -ComputerName DSCDC01 -Wait -Verbose