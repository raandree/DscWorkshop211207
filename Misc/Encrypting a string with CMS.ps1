$enc = 'test' | Protect-CmsMessage -To C:\DSCFile01Mof.cer

$enc | Out-File -FilePath c:\enc.txt

$enc = Get-Content -Path c:\enc.txt

$enc | Unprotect-CmsMessage -To Cert:\LocalMachine\My\B4B5525E1DD484F36561A13AACCE6BD247AAA6CD
