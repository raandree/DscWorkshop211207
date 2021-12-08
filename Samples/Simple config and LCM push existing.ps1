configuration Test1 {
    node localhost {
        File TestFile1 {
            DestinationPath = 'C:\Test\TestFile.txt'
            Type = 'File'
            Ensure = 'Present'
            Contents = '456'
            DependsOn = '[File]TestFolder1'
        }

        File TestFolder1 {
            DestinationPath = 'C:\Test'
            Type = 'Directory'
            Ensure = 'Present'
        }
    }
}

Remove-Item -Path C:\DSC\*

#By calling the configuration like a function a MOF file is created
Test1 -OutputPath C:\DSC -Verbose

#this moves the MOF file to C:\Windows\System32\Configuration but does
#not start the LCM. The LCM will pick up the file when the interval trigger it
Publish-DscConfiguration -Path C:\DSC -Verbose

#this now trigger the LCM to read the pending.mof in the configuration folder
#apply the configuration and renames the file to current.mof
Start-DscConfiguration -UseExisting -Wait -Verbose
