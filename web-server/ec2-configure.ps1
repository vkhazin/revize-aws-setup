aws configure set aws_access_key_id "${aws_access_key_id}"
aws configure set aws_secret_access_key "${aws_secret_access_key}"
aws configure set default.region "${aws_region}"

[System.Environment]::SetEnvironmentVariable('webcontent_folder', "${webcontent_folder}", [System.EnvironmentVariableTarget]::Machine)
[System.Environment]::SetEnvironmentVariable('webcontent_bucket', "${webcontent_bucket}", [System.EnvironmentVariableTarget]::Machine)

Enable-ScheduledTask -TaskName "${scheduled_task_name}"
Start-ScheduledTask -TaskName "${scheduled_task_name}"

if ("${stop_iis}" -eq "true") {
  net stop W3SVC
}


