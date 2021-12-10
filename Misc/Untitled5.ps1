#exceptions handling does not work due to the design how Invoke-LabCommand is returning errors
#However, we can redirect the errors in a separate variable and use the content of this for further decisions.
Invoke-LabCommand -ScriptBlock {
    Get-Date
    #Write-Error 'error'
} -ComputerName DSCFile01 -PassThru -Retries 2 -ErrorVariable invokeError

if ($invokeError) {
    '...'
}

#hard exception without having the remote function returning any data and having completed
try {
    Invoke-LabCommand -ScriptBlock {
        Get-Date
        Write-Error 'error' -ErrorAction Stop
    } -ComputerName DSCFile01 -PassThru -Retries 2 -ErrorAction Stop
}
catch {
    Write-Error 'invokecommandError'
}