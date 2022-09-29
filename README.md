![PowerShell](https://wracked.com/img/github/PowerShell-evil.gif)

## PowerShell Auditing and Test Scripts
### PowerShell scripts for **auditing**, **testing**, and gaining **insights** into AD and Orgs

---
<kbd>>_</kbd> Powershell_AD_Audit_Export_SGs_to_CSV.ps1:  
Dump Security Groups to CSV with ISO friendly date formatted into output file

<kbd>>_</kbd> Powershell_Conver_IP_to_Hostname.ps1:  
Some security tools will report back a list of hosts and vulnerabilities with just IP addresses.
Often times folks would push back so I wrote this to use query local DNS resolver to and output to names. 
Easy to tweak and use for other items when you just have a list of IP's you need to get hostnames out of. 

<kbd>>_</kbd>  Powershell_Date_ISO_Format.ps1:  
This is a simple Date and Time function that can be pulled into other scripts easily. It supports UTC and easy to modify time templates. I set to use ISO standards.

<kbd>>_</kbd> PowerShell_malware_windows_test01.ps1:  
When you're doing a hands-on audit and you need to verify antimalware is running, test alert functions to the SOC or even use as a simple test to verify outbound firewall rules are blocking traffic to the internet. If there is internet access this will pull down a harmless EICAR file that should get caught by antimalware and create a trigger notification for the SOC. If all goes well an alert should also be generated somebody is on a production server running PowerShell. Includes is a few different PowerShell methods as well as links to different file types are provided.  

<kbd>>_</kbd> Powershell_password_audits.ps1:  
These simple queries will help shine a light on all kinds of organizational problems. Passwords not reset, passwords set to never expire, passwords older than X days. Pay special attention to privileged accounts like Super Admins (SA's) and leadership folks who may have twisted somebody's arm to override a company policy. I've added a few queries for Country, Department, Offices, etc so they can been narrowed down. Don't forget Vendors. Seems teams love to give out a Vendor account that never expires.  =)

<kbd>>_</kbd> Powershell_query_privileged_groups.ps1:  
PowerShell AD queries to pull out list of potentially privileged Groups

<kbd>>_</kbd> Powershell_report_back_IP.ps1:  
Sometimes debugging X-Forward or running something like #>tail -f \var\log\apache_httd.log you need to make some noise. 

----
