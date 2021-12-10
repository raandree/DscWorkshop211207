$cd = @{
    AllNodes = @(
        @{
            NodeName = "*"
            PSDscAllowPlainTextPassword = $true
            PSDscAllowDomainUser = $true
        }
        @{
            NodeName = 'MS1'
            IpAddress = '192.168.10.10'
            InterfaceAlias = 'Ethernet'
            TestFile1Contents = '123'
            Role = 'FileServer'
        }
        @{
            NodeName = 'MS2'
            IpAddress = '192.168.10.20'
            InterfaceAlias = 'Ethernet'
            TestFile1Contents = '456'
            Role = 'WebServer'
        }
    )
}