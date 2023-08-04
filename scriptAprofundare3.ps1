$services = Get-Service AarSvc_f4bea15

foreach ($item in $services){
    
    if($item.Name -eq 'spooler'){
        'wow i found the '+ $item.Name + ' service, really cool'
    }else {
        'the '+ $item.Name + ' is a great service'
    }
}
