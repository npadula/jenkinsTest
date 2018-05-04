$testFilesDir = "TestResults"
Write-Output "Removing used test files..."
Remove-Item -path $testFilesDir -Recurse