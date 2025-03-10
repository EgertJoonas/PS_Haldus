#Küsib andmeid
$Eesnimi = Read-Host "Sisestage kasutaja eesnimi"
$Perenimi = Read-Host "Sisestage kasutaja perenimi"

#Liidab nimed
$kasutaja = $($Eesnimi.ToLower()).$($Perenimi.ToLower())
#Otsib kasutajat
$User = Get-ADUser -Filter {SamAccountName -eq $kasutaja}
#Proovib kustutada
if ($User) {
    Remove-ADUser -Identity $User
    Write-Host "Kasutaja on kustutatud."
} else {
    Write-Host "Kasutajat ei leitud."
}