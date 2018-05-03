$DeployDir = "C:\Users\nicolas.padula\Desktop\JenkinsTestDeploy"

Write-Output "Running tests..."

dotnet publish -c Release 
dotnet vstest Project.Tests\bin\Release\netcoreapp2.0\Project.Tests.dll /logger:trx 

