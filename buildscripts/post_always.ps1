$testFilesDir = "TestResults"
$buildDir = "build"
Write-Output "Removing used test files..."
Remove-Item -path $testFilesDir -Recurse

Write-Output "Removing build directory..."
Remove-Item -path $buildDir -Recurse