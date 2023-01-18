# Drew F. Sousa
# Some security tools will just report back IP addresses when you'd really like a list of hostnames from DNS. 
# This script will ping a list of IPs and output a list of hostnames

$YourListOfIPs = Get-Content '\path_to_your_files\YourListOfIPs.txt'

$responseList = @()
    # Ping each IP and get a HostName
    foreach ($ip in $YourListOfIPs)
    {

    $response = $null
    $currentEAP = $ErrorActionPreference
    $ErrorActionPreference = "silentlycontinue"
    $response = [System.Net.Dns]::gethostentry($ip)
    $ErrorActionPreference = $currentEAP

    If ($response)
    {
         $responselist += [string]$Response.HostName
    }
    Else
    {
         $responselist += "$IP - No HostNameFound"
    }
}

$responselist | Out-File \path_to_your_files\YourListOfHostNames.txt
