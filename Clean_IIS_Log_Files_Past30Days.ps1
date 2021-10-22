# Scott Comeaux Developer
# Description: Remove IIS_Log files from server that are over 30days from creation date
# Disclaimer: will move ALL files not extension-type specific. (folders remain)

# Get log files from all subdirectories 
$iislogs = Get-ChildItem C:\inetpub\logs\LogFiles –Recurse 
# select only files which are older than 30 days 
$iislogsrem = $iislogs | where {$_.LastWriteTime -le (Get-Date).AddDays(-30) -and !$_.PSIsContainer}
# remove files 
$iislogsrem | Remove-Item
# Return Successful in RMM & Exit
Exit 0