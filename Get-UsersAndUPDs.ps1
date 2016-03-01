cls
$Global:FinalUsersAndDisks = @()
Function Get-UsersAndUPDs {
Param(
  [string]$UPDShare
)
$fc = new-object -com scripting.filesystemobject
$Global:folder = $fc.getfolder($UPDShare)
"UPDShare,Username,SiD" > export.csv
foreach ($i in $Global:folder.files) 
{
    if ($i.Name -like "*.vhdx")
        {
        $sid = $i.Name
        $sid = $sid.Substring(5,$sid.Length-10)
        if ($sid -ne "template")
            {
            $securityidentifier = new-object security.principal.securityidentifier $sid
            $user = ( $securityidentifier.translate( [security.principal.ntaccount] ) )
            $UPDShare,$user,$i.Name -join "," >> export.csv
            }
        }
}
$Global:UsersAndDisks = Import-Csv export.csv
$Global:FinalUsersAndDisks += $Global:UsersAndDisks
}
[array]$UDPPaths = (Read-Host “What are your UPD Shares? (separate with comma)”).split(“,”) | %{$_.trim()} 
foreach ($UDPPath in $UDPPaths)
    {
    Get-UsersAndUPDs -UPDShare $UDPPath
    }
$Global:FinalUsersAndDisks | Format-Table -AutoSize