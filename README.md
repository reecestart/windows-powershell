# windows-powershell
Some PowerShell scripts/forms for Windows administration 
## [Get-UsersAndUPDs.ps1](../master/Get-UsersAndUPDs.ps1)
This script is a combination of [Rodrigo Guariento's script](https://social.technet.microsoft.com/Forums/windowsserver/en-US/7f88b1a2-6e0d-4cdb-b598-cce696ce3255/server-2012-rds-user-profile-disks-errors-during-logoff?forum=winserverTS "Server 2012 RDS - User Profile Disks - Errors during Logoff") on the Technet Forums and a line of script from [The copy-paste blog](https://copysave.wordpress.com/2010/07/02/read-host-values-into-an-array/ "Read-Host values into an Array"). There is a GUI app that will show you this information called [Sidder](https://msfreaks.wordpress.com/2013/12/15/sidder-quickly-see-which-user-profile-disk-maps-to-which-domain-user/ "Sidder") written by Arjan Mensch but that doesn't allow copy-paste and multiple User Profile Disk Shares which this script will allow.

* The format for the User Profile Disk Share is `\\Server\Share` or `\\Server\Share,\\Server2\Share`
