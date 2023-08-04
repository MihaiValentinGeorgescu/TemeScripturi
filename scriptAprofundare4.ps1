$fullname = Read-Host "scrieti numele utilizatorului"
$age = Read-Host "scrieti vartsa utilizatorului"
$city = Read-Host "scrieti orasul utilizatorului"

#creez un user local
$NewUserParameters = @{
    "Name" = $fullname
    "Description" = "Local user account"
    "NoPassword" = $true # creez un user fara parola
}

#creez userul in baza parametrilor de sus
$createdUser = New-LocalUser @NewUserParameters

Write-Host "userul a fost creat"

$groupName = "Bratianu"

#daca grupul nu exista il creez
if(-NOT(Get-LocalGroup -Name $groupName -ErrorAction SilentlyContinue)){
    New-LocalGroup -Name $groupName -Description "Useri care sunt in grupul Bratianu"
}

#creez un obiect in care adaug datele userului pentru a le exporta mai tarziu ca JSON
$userInfo = [PSCustomObject]@{
    "name" = $fullname
    "city" = $city
    "age" = $age
}

#adaug membrul in grup
Add-LocalGroupMember -Group $groupName -Member $createdUser

#convertesc userinfo in json
$jsonDATA = ConvertTo-Json $userInfo
$filePath = "C:\Users\GG\Desktop\planu kira kiralina\coduri vs\scripts for me\FisierReziduuri\user.json"

#aici export json in fisierul de la acel path
$jsonDATA | Out-File -FilePath $filePath

Write-Host "User details (age and email) have been saved to $filePath"
