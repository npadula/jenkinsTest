$DeployDir = "C:\Users\nicolas.padula\Desktop\JenkinsTestDeploy"
$currentDir = Convert-Path .
$buildDir = "$($currentDir)\build"


Write-Output "Running dotnet publish..."
dotnet publish -c Release -o $buildDir
#cd $DeployDir