[DscResource()]
class RemoveLargeFile
{

    [DscProperty(Key)]
    [string]$Path

    [DscProperty(Mandatory)]
    [int]$Size

    [DscProperty(NotConfigurable)]
    [int]$FileCount

    [DscProperty(NotConfigurable)]
    [int]$TotalFileSize
    
    [void] Set()
    {
        $files = dir -Path $this.Path | Where-Object { $_.Length -gt $this.Size }        
        $files | ForEach-Object {
            Write-Verbose "Removing file '$($_.FullName)'"
            $_ | Remove-Item -Force
        }

        Write-Verbose "Removed $($files.Count) files in '$($this.Path)'"
    }        
    
    [bool] Test()
    {        
        return -not (dir -Path $this.Path | Where-Object { $_.Length -gt $this.Size })
    }    
    

    [RemoveLargeFile] Get()
    {        
        $files = dir -Path $this.Path | Where-Object { $_.Length -gt $this.Size }
        Write-Verbose 'Found the following large files'
        $files | ForEach-Object {
            Write-Verbose "`t$_.FullName"
        }

        $this.FileCount = $files.Count
        $this.TotalFileSize = ($files | Measure-Object -Property Length -Sum).Sum
        
        return $this 
    }    
}
