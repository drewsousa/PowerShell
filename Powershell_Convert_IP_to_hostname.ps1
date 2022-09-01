# DFS 
# Some security tools will just report back IP addresses for Hosts. 
# Simple tool to ping and log hostnames

$YourListOfIPs = Get-Content '\path_to_your_files\YourListOfIPs.txt
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
