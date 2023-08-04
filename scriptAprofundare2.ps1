#data checker

Get-Date
$Date = Get-Date

while($Date.DayOfWeek -ne 'monday'){
    'It is still'+ $Date.DayOfWeek
    sleep -Milliseconds 100
    $Date = Get-Date
}

'It is' + $Date.DayOfWeek
