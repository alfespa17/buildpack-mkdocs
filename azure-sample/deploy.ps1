# Getting needed values from ENV variables

$blobservice=$Env:DEPLOYMENT_BLOB_SERVICE_URL
$directory=$Env:DEPLOYMENT_SITE_DIRECTORY
$sas=$Env:SAS_TOKEN


# Write General Information to Host
write-host "Destination blob: ${blobservice}`$web${sas}"
$destination = "${blobservice}`$web${sas}"
write-host "Directory: ${directory}"

write-host "Command: azcopy copy `"${directory}`" `"${destination}`" --recursive=true --as-subdir=false"

# Send data to Azure Storage Account
azcopy copy "${directory}" "${destination}" --recursive=true --as-subdir=false
