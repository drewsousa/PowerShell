## PowerShell Auditing and Test Scripts
### Uploads of mostly simple and sanitized PowerShell scripts for **auditing**, **testing**, and **insights** into AD and organizations

---
- [ ] Powershell_AD_Audit_Export_SGs_to_CSV.ps1:  
Dump Security Groups to CSV with ISO friendly date formatted into output file

- [ ] Powershell_Conver_IP_to_Hostname.pst:  
Some security tools will report back a list of hosts and vulnerabilities with just IP addresses.
Often times folks would push back so I wrote this to use query local DNS resolver to and output to names. 
Easy to tweak and use for other items when you just have a list of IP's you need to get hostnames out of. 

- [ ] Powershell_Date_ISO_Format.ps1:  
This is a simple Date and Time function that can be pulled into other scripts easily. It supports UTC and easy to modify time templates. I set to use ISO standards.

- [ ] PowerShell_malware_windows_test01.ps1:  
When you're doing a hands-on audit and you need to verify antimalware is running, test alert functions to the SOC or even use as a simple test to verify outbound firewall rules are blocking traffic to the internet. If there is internet access this will pull down a harmless EICAR file that should get caught by antimalware and create a trigger notification for the SOC. If all goes well an alert should also be generated somebody is on a production server running PowerShell. Includes is a few different PowerShell methods as well as links to different file types are provided.  

- [ ] Powershell_password_audits.ps1:  
These simple queries will help shine a light on all kinds of organizational problems. Passwords not reset, passwords set to never expire, passwords older than X days. Pay special attention to priveledged accounts like Super Admins (SA's) and leadership folks who may have twisted somebody's arm to override a company policy. I've added a few queries for Country, Department, Offices, etc so they can been narrowed down. Don't forget Vendors. Seems teams love to give out a Vendor account that never expires.  =)

- [ ] Powershell_query_privileged_groups.ps1:  
PowerShell AD queries to pull out list of potentially privileged Groups

- [ ] Powershell_report_back_IP.ps1:  
Sometime debugging X-Forward or running something like #>tail -f \var\log\apache_httd.log you need to make some noise. 
----

<details> <summary>01.00-header/</summary>

### [01.00-header/navigation-bar-1.md](01.00-header/navigation-bar-1.md)
----

<p align="center">
<strong><a href="#link1">Link 1</a></strong>
|
<strong><a href="#link2">Link 2</a></strong>
|
<strong><a href="#link3">Link 3</a></strong>
|
<strong><a href="#link4">Link 4</a></strong>
|
<strong><a href="#link5">Link 5</a></strong>
</p>

----



