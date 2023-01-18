# Drew F. Sousa
# Description: Report IP back to URL
# Sometimes debugging X-Forward or running something like #>tail -f \var\log\apache_httd.log you need to make some noise.

$HOSTNAME = (Get-WmiObject -Class Win32_ComputerSystem -Property Name).Name
$CALLBACKURL = $("https://yourURL.com/search.html?code=" + "$HOSTNAME")
$CURL = New-Object System.Net.WebClient
$CURL.DownloadString("$CALLBACKURL") | Out-Null
