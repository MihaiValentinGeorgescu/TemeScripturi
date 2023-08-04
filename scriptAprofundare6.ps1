#am un fisier csv in care am path-ul, numele si tipul unor fisiere
#scriptul acesta citeste fisierul csv si creaza acele fisiere

$file = Import-Csv -Path 'C:\Users\GG\Desktop\planu kira kiralina\coduri vs\scripts for me\tema4\file2.csv'

foreach ($item in $file){

    'do you want to create a files / folders?'
    $answer = Read-Host
    if($answer -eq 'y'){
        if($item.FILEORFOLDER -eq 'ITSAFOLDER'){
        
            $itemType = 'DIRECTORY'
        }else{
            if($item.FILEORFOLDER -eq 'ITSAFILE'){
                $itemType = 'FILE'
            }
        }
        New-Item -Path $item.DRIVE -Name $item.NAME -ItemType $itemType
    }else{
        $item.NAME + ' will not be created in the location ' + $item.DRIVE
    }
}

#fisierul csv are urmatoarele:
#DRIVE,NAME,FILEORFOLDER
#C:\,FOLDER1,ITSAFOLDER
#C:\,FOLDER2,ITSAFOLDER
#C:\,FILE1,ITSAFILE
#C:\,FILE2,ITSAFILE
