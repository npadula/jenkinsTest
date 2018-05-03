$DeployDir = "C:\Users\nicolas.padula\Desktop\JenkinsTestDeploy"


Write-Output "Stopping website..."
Import-Module WebAdministration
Stop-Website 'JenkinsTestDeploy'

Write-Output "Removing previous files from deploy directory..."
Remove-Item -path $DeployDir -Recurse