aws s3 sync "$env:webcontent_folder" s3://"$env:webcontent_bucket"
aws s3 sync "$env:windir\System32\Inetsrv\Config\" s3://"$env:iisconfig_bucket"