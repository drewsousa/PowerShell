# DFS
# Date and Time function to support ISO 8601 formatting and UTC
$DateTime = Get-Date

# Remove comment below to output Date and Time in UTC
#$DateTime = $DateTime.ToUniversalTime()

# Date only
$Date = $DateTime.ToString('yyyy-MM-dd')
# Date + time
$DateT = $DateTime.ToString('yyyy-MM-ddThh-mm-ss')
# Date + time + milliseconds
$DateTMS = $DateTime.ToString('yyyy-MM-ddThh-mm-ss-fff')
