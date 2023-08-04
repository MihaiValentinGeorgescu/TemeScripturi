Import-Module -Name Microsoft.PowerShell.SecretManagement
Import-Module -Name Microsoft.PowerShell.SecretStore

Register-SecretVault -Name SecretStore -ModuleName Microsoft.PowerShell.SecretStore -DefaultVault

Set-Secret -Name "utilizator" -Secret "secret_username"
Set-Secret -Name "parola" -Secret "secret_password"
#luam secretele

$username = Get-Secret -Name "utilizator" -AsPlainText
$password = Get-Secret -Name "parola" -AsPlainText

$filePath = "C:\Users\internship\Intern\config.xml"
$configContent = Get-Content -Path $filePath

# Replace the words 'USERNAME' and 'PASSWORD' with 'apple'
$configContent = $configContent -replace 'USERNAME', $username
$configContent = $configContent -replace 'PASSWORD', $password

# Save the updated content back to the XML file
$configContent | Set-Content -Path $filePath
