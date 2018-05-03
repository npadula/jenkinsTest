$DeployDir = "C:\Users\nicolas.padula\Desktop\JenkinsTestDeploy"


Write-Output "Running dotnet publish..."
dotnet publish -c Release -o $DeployDir
cd $DeployDir