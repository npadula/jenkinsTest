function Get-TimeStamp {
    
    return "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
    
}

Write-Output "$(Get-TimeStamp) Starting build..."


Write-Output "Restoring NPM packages..."
cd ./JenkinsTest
npm install