$DeployDir = "C:\Users\nicolas.padula\Desktop\JenkinsTestDeploy"
$currentDir = Convert-Path .
$buildDir = "$($currentDir)\build"
$csProjFile = "$($currentDir)\JenkinsTest\JenkinsTest.csproj"


Write-Output "Running dotnet publish..."
dotnet publish -c Release #Build everything within the solution, necessary for building test project
Write-Output "$($csProjFile)"
dotnet publish $csProjFile -c Release -o $buildDir #Publish only "root" project, necessary for deploying to IIS later
#dotnet publish -c Release -o $buildDir

#cd $DeployDir