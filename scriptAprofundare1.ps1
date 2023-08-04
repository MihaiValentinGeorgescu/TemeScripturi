#am fisierul csv numit file.csv in care am datele unor useri pe care vreau sa ii adaug local
#fiindca am un user dintr-un departament mai ciudat "EvilWizzard" vreau mai intai ca scriptul  
#sa ma intrebe daca vreau sa creez utilizatorul din acel departament

#dau import la fisier
$usersToImport = Import-Csv -Path 'C:\Users\GG\Desktop\planu kira kiralina\coduri vs\scripts for me\tema3\file.csv'
foreach($item in $usersToImport){
    #convertesc parola ca sa nu mi-o afiseze
    $securePassword = ConvertTo-SecureString -String $item.PASSWORD -AsPlainText -Force

    #verific daca userul se afla in acel departament ciudat
    if($item.DEPARTMENT -eq 'EvilWizzard'){
        'this user ' + $item.NAME + ' cannot be created because the department is ' + $item.DEPARTMENT
        'do you want to create it?'
        
        $createUser = Read-Host
        #daca userul se afla in acel departament il voi adauga sau nu
        if($createUser -eq 'Y'){
            $userToCreate = New-LocalUser -Name $item.LOGINNAME -Password $securePassword -Description $item.DEPARTMENT
            'the user '+ $item.NAME + ' has been created'
        }else{
            'ok we will not create the user ' + $item.NAME 
        }
    }else {
        #altfel se creaza userii normali
        $userToCreate = New-LocalUser -Name $item.LOGINNAME -Password $securePassword -Description $item.DEPARTMENT
        'the user '+ $item.NAME + ' has been created'
    }
    
}

#aici sterg utilizatorii

#foreach ($item in $usersToImport) {
#    Remove-LocalUser -Name $item.LOGINNAME
#    'the user '+ $item.NAME + ' has been removed'
#}
