$AppPoolName = "JenkinsTestDeploy"
$DeployDir = "C:\Users\nicolas.padula\Desktop\JenkinsTestDeploy"

function SetIisPermissions {
$path = $args[0]

$inherit = [system.security.accesscontrol.InheritanceFlags]"ContainerInherit, ObjectInherit"
$propagation = [system.security.accesscontrol.PropagationFlags]"None"


$pathAcl= Get-Acl $path
$appPoolRule = New-Object system.security.accesscontrol.filesystemaccessrule("IIS AppPool\$($AppPoolName)","FullControl",$inherit, $propagation, "Allow")
$iusrRule = New-Object system.security.accesscontrol.filesystemaccessrule("IUSR","FullControl",$inherit, $propagation, "Allow")
$IisIusrRule = New-Object system.security.accesscontrol.filesystemaccessrule("IIS_IUSRS","FullControl", $inherit, $propagation,"Allow")
$networkServiceRule = New-Object system.security.accesscontrol.filesystemaccessrule("NETWORK SERVICE","FullControl",$inherit, $propagation, "Allow")
$pathAcl.SetAccessRule($appPoolRule)
$pathAcl.SetAccessRule($iusrRule)
$pathAcl.SetAccessRule($IisIusrRule)
$pathAcl.SetAccessRule($networkServiceRule)
Set-Acl $path $pathAcl

}





Write-Output "Setting deployed files permissions..."
$webConfig = "$($DeployDir)\web.config"
SetIisPermissions $DeployDir
SetIisPermissions $webConfig

Write-Output "Configuring web.config processPath..."
$dotnetProcessPath = "C:\Program Files\dotnet\dotnet.exe"
$webConfigXml = (Get-Content $webConfig) -as [Xml]
$aspNetCoreNode = $webConfigXml.SelectSingleNode("//configuration/system.webServer/aspNetCore")
$aspNetCoreNode.SetAttribute("processPath",$dotnetProcessPath)
$webConfigXml.Save($webConfig)


Write-Output "Starting website..."
Import-Module WebAdministration
Start-Website 'JenkinsTestDeploy'