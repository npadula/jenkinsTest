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



Write-Output "Setting web.config permissions..."
$webConfig = "$($DeployDir)\web.config"
SetIisPermissions $DeployDir
#SetIisPermissions $webConfig