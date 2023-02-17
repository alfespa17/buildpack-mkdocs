# Getting needed values from ENV variables

$blobservice=$Env:DEPLOYMENT_BLOB_SERVICE_URL

# Write General Information to Host
write-host "Destination blob: ${blobservice}`$web"
$destination = "${blobservice}`$web$"

write-host "Command: azcopy copy `"/deployment/site`" `"${destination}`" --recursive=true --as-subdir=false"

# Send data to Azure Storage Account
azcopy copy "/deployment/site" $blobservice --recursive=true --as-subdir=false