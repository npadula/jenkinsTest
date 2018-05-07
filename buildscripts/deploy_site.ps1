$DeployDir = "C:\Users\nicolas.padula\Desktop\JenkinsTestDeploy"
$currentDir = Convert-Path .
$buildDir = "$($currentDir)\build"

Write-Output "Stopping website..."
Import-Module WebAdministration
Stop-Website 'JenkinsTestDeploy'

Write-Output "Removing previous files from deploy directory..."
Remove-Item -path $DeployDir -Recurse

Write-Output "Deploying build to $($DeployDir)..."
Copy-Item $buildDir -Destination $DeployDir -Recurse
