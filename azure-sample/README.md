# Static Web Site (Storage Account)

## Requirements

* Azure Storage Account
* Azure Storage Container ($web)
* Enable Static website 
  * Add index.html
  * Add error.html
* azCopy
* SAS object level permission to the container

The endpoint will be available in the following link

* https://{{storage_name}}.z20.web.core.windows.net/

## Install azcopy

```bash
wget https://aka.ms/downloadazcopy-v10-linux
# File azcopy_linux_amd64_10.17.0
mkdir azcopy-exec
tar -xzvf downloadazcopy-v10-linux -C ./azcopy-exec
cd azcopy-exec
chmod -x azcopy
cp azcopy /usr/local/bin/
```

# Install Powershell with Azure Module (Optional)

```bash

# Update the list of packages
sudo apt-get update
# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common
# Download the Microsoft repository GPG keys
wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb
# Update the list of packages after we added packages.microsoft.com
sudo apt-get update
# Install PowerShell
sudo apt-get install -y powershell
# Start PowerShell
pwsh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
```

## Powershell Script Deploy Static Site.

```bash
# secret AZCOPY_SPA_CLIENT_SECRET in ENV var
pwsh deploy.ps1 -blobservice "https://docpoc.blob.core.windows.net/" -directory "/mnt/c/git_applaudo/sa-poc-documentation-deployment/mkdocs-sample/site/" -sas "?sv=2021-06-08&ss=bfqt&srt=o&sp=rwdlacupiytfx&se=2023-02-17T01:30:50Z&st=2023-02-16T17:30:50Z&spr=https&sig=%2B%2FFytd6u%2FVn3O%2BabRqYV%3D"
```


```bash
 azcopy copy "./site" 'https://docpoc.blob.core.windows.net/$web/?[SAS]' --recursive=true --as-subdir=false
```

