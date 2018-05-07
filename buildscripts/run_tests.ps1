$DeployDir = "C:\Users\nicolas.padula\Desktop\JenkinsTestDeploy"
$currentDir = Convert-Path .
$buildDir = "$($currentDir)\build"

Write-Output "Running tests..."
#testtest

#dotnet publish -c Release 

dotnet vstest Project.Tests\bin\Release\netcoreapp2.0\Project.Tests.dll /logger:trx 

