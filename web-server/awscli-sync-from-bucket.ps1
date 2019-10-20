aws s3 sync s3://"$env:webcontent_bucket" "$env:webcontent_folder"
aws s3 sync s3://"$env:iisconfig_bucket" "$env:windir\System32\Inetsrv\Config\"
