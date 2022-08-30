## AD Password - Get BadPwdCount
Get-ADUser -Filter * -Properties badPwdCount | where {$_.badpwdcount -gt 2} | Select -Property Name,badpwdcount | sort -Property name | measure

## AD Password Never Expires - All objects
Get-ADUser -Filter * -Properties PasswordNeverExpires | select name,PasswordNeverExpires | Where-Object {$_.PasswordNeverExpires -like "True"} | Format-Table -Property Name, EmployeeType, PasswordNeverExpires -AutoSize
Get-ADUser -Filter * -Properties PasswordLastSet, PasswordNeverExpires, EmployeeType| Where-Object {$_.PasswordNeverExpires -like "True"} |ft Name, EmployeeType, PasswordLastSet, PasswordNeverExpires

## AD Password Never Expires - Wildcard User Name 
Get-ADUser -Filter 'Name -Like "*ExampleCorp*"' -Properties DisplayName, Company, LastLogonDate, PasswordNeverExpires | Select DisplayName, Company, LastLogonDate, PasswordNeverExpires

## AD Password Never Expires - Company Field is blank
Get-ADUser -LDAPFilter "(!company=*)" -Properties DisplayName, Company, PasswordNeverExpires| Where-Object {$_.PasswordNeverExpires -like "True"} | Select DisplayName, Company, PasswordNeverExpires

## AD Password Never Expires - Company name starts with ExampleCorp**
Get-ADUser -Filter 'Company -Like "ExampleCorp*"' -Properties PasswordNeverExpires | select name,PasswordNeverExpires | Where-Object {$_.PasswordNeverExpires -like "True"} | Format-Table -Property Name, PasswordNeverExpires -AutoSize

## AD Password Never Expire where Name fits wildcard
Get-ADUser -Filter 'Name -Like "*(SA*"' -Properties PasswordLastSet, PasswordNeverExpires  | select name, PasswordNeverExpires, PasswordLastSet | Where-Object {$_.PasswordNeverExpires -like "True"} | Format-Table -Property Name, PasswordNeverExpires, PasswordLastSet -AutoSize

## AD Password Never Expires - Name includes 'mailbox'
Get-ADUser -Filter 'Name -Like "*mailbox*"' -Properties DisplayName, Company, LastLogonDate, PasswordNeverExpires | Select DisplayName, Company, LastLogonDate, PasswordNeverExpires

## AD password never expires - Name includes conf or phone
Get-ADUser -Filter 'Name -Like "*conf*"' -Properties DisplayName, PhysicalDeliveryOfficeName, LastLogonDate, PasswordNeverExpires | Select DisplayName, PhysicalDeliveryOfficeName, LastLogonDate, PasswordNeverExpires
Get-ADUser -Filter 'Name -Like "*phone*"' -Properties DisplayName, PhysicalDeliveryOfficeName, LastLogonDate, PasswordNeverExpires | Select DisplayName, PhysicalDeliveryOfficeName, LastLogonDate, PasswordNeverExpires

## AD Password Never Expires - Returns boolean "true"
Get-ADUser -Filter 'Company -Like "ExampleCorp*"' -Properties DisplayName, Company, PasswordNeverExpires | Where-Object {$_.PasswordNeverExpires -like "True"} | Select DisplayName, Company, PasswordNeverExpires
Get-ADUser -Filter 'Company -Like "ContractCompanyName*"' -Properties DisplayName, Company, PasswordNeverExpires| Where-Object {$_.PasswordNeverExpires -like "True"} | Select DisplayName, Company, PasswordNeverExpires

## AD Password Never Expires - Includes 'PasswordLastSet'
Get-ADUser -Filter * -Properties PasswordLastSet, PasswordNeverExpires | ft Name, PasswordLastSet, PasswordNeverExpires 
Get-ADUser -Filter * -Properties PasswordLastSet, PasswordNeverExpires | sort name | ft Name, PasswordLastSet, PasswordNeverExpires
Get-ADUser -Filter 'Company -Like "ExampleCorp*"' -Properties PasswordLastSet, PasswordNeverExpires | sort name | ft Name, PasswordLastSet, PasswordNeverExpires

## AD Password Never Expires - Includes 'PasswordLastSet' - export to CSV
Get-ADUser -Filter 'Company -Like "ExampleCorp*"' -Properties PasswordLastSet | select name, PasswordLastSet | export-csv "PasswordLastSet_date.csv" -notypeinformation

## AD Password PasswordLastSet - By Country Code
Get-ADUser -Filter * -Properties PasswordLastSet, DisplayName, Country | where {$_.Country -like @("BY*")} |  Select PasswordLastSet, DisplayName, Country 
Get-ADUser -Filter * -Properties PasswordLastSet, DisplayName, Country | where {$_.Country -like @("MD*")} |  Select PasswordLastSet, DisplayName, Country 
Get-ADUser -Filter * -Properties PasswordLastSet, DisplayName, Country | where {$_.Country -like @("US*")} |  Select PasswordLastSet, DisplayName, Country 
Get-ADUser -Filter * -Properties PasswordLastSet, DisplayName, Country | where {$_.Country -like @("RU*")} |  Select PasswordLastSet, DisplayName, Country 

## AD Password - Password not reset in last month
$DateCutOff=(Get-Date).AddDays(-32)
Get-ADUser -Filter * -Property PasswordLastSet | Where {$_.PasswordLastSet -gt $datecutoff} | FT Name, PasswordLastSet -Autosize

## AD Password - Password not reset in last month by Company
$DateCutOff=(Get-Date).AddDays(-32)
Get-ADUser -Filter 'Company -Like "ExampleCorp*"' -Property PasswordLastSet | Where {$_.PasswordLastSet -gt $datecutoff} | FT Name, PasswordLastSet -Autosize

Get-ADUser -identity ExampleCorp*User -Property whenCreated | Where {$_.whenCreated -gt $datecutoff} | FT Name, whenCreated -Autosize


## AD Password - Query based on PasswordLastSet in X days
$DaysAgo=(Get-Date).AddDays(-1000)
$params = @{
  "Filter" = 'Company -Like "*" -and Enabled -eq $true -and PasswordLastSet -lt $DaysAgo'
  "Properties" = "Displayname",
  "PasswordLastSet",
  "samaccountname"
}
Get-ADUser @params |select PasswordLastSet,displayname,samaccountname

## Password older than X days by Department (Dummy names used below)
$DeptName="Finance*"
$DeptName="HR*"
$DeptName="Legal*"
$DeptName="IT*"
$DeptName="Sales*"
$DeptName="Compliance*"
$DeptName="Operations*"

$DaysAgo=(Get-Date).AddDays(-58)
$params = @{
  "Filter" = 'Company -Like "ExampleCorp**" -and Department -like $DeptName -and Enabled -eq $true -and PasswordLastSet -lt $DaysAgo'
  "Properties" = "Displayname",
  "PasswordLastSet"
  }
Get-ADUser @params |select displayname,PasswordLastSet
