#Vreau sa pornesc un serviciu pe care il dau ca input din pc 
#spre exemplu Discord sau sa il opresc daca este deja pornit

# Specify the process name related to Discord
$processNameToCheck = Read-Host -Prompt "numele serviciului"

# Check if the Discord process is running
if (Get-Process -Name $processNameToCheck -ErrorAction SilentlyContinue) {
    Write-Host "Discord is currently running."
    $response = Read-Host "Do you want to stop the service? (y/n)"
    if($response -eq "Y" -or $response -eq  "y"){
        Stop-Process $processNameToCheck
        Write-Host "serviciul a fost oprit"
        Get-ServiceStatus $processNameToCheck
    }else{
        Write-Host "serviciul '$processNameToCheck' este deja oprit"
        Get-ServiceStatus $processNameToCheck
    }

} else {
    Write-Host "Discord is not running."
    $response = Read-Host "Do you want to start the service? (y/n)"
    if($response -eq "Y" -or $response -eq  "y"){
        Start-Process $processNameToCheck
        Write-Host "serviciul a fost pornit"
        Get-Service $processNameToCheck
    }else{
        Write-Host "serviciul '$processNameToCheck' este deja pornit"
        Get-ServiceStatus $processNameToCheck
    }
}
