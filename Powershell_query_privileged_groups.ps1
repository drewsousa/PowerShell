## AD Query to pull out list of potentially privileged Groups
## Note: This is an inception query to get obtain information for further digging

$PrivGroupMembers = @()
$a = $()
'Administrators', 'Backup Operators', 'Domain Admins', 'Enterprise Admins', 'Schema Admins', 'Server Operators' | ForEach-Object {
    $groupName = $_
    $a = Get-ADGroupMember -Identity $_ -Recursive | Get-ADUser | Select-Object Name, samaccountname, @{n='GroupName';e={ $groupName }}
    $PrivGroupMembers += $a
}
$PrivGroupMembers | export-csv AD_PrivGroupMembers.csv

## AD Query to calculate percentage of SamAccounts against Domain Admins
$UniqueAdmins = ($DomainAdmins | select SamAccountName,name )  | Sort-Object -Property samaccountname -Unique
$PctDomainAdmins = ($UniqueAdmins.count / (Get-ADUser -filter * ).count) *100
write-host $PctDomainAdmins "percent of domain users have domain admin permissions"
$PctDomainAdmins$UniqueAdmins | export-csv UniqueAdmins.csv 
