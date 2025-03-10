#küsib kasutajalt eesnime ja perenime
$eesnimi = Read-Host "Sisesta oma eesnimi:"
$perenimi = Read-Host "Sisesta oma perenimi:"

#liidab nimed kokku
$kasutaja = "$($eesnimi.ToLower()).$($perenimi.ToLower())"

#proovib kustutada kontot
try{
    Remove-LocalUser -Name $kasutaja
    Write-Host "Kasutaja $kasutaja on kustutatud"
}
#väljastab veateate, kui ei suutnud ära kustutada
catch{
      Write-Host "Kasutaja kustutamisega tekkis probleem" -ForegroundColor DarkRed
}
