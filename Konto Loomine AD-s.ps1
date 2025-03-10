#Küsib kasutajalt eesnime ja perenime

$Eesnimi = Read-Host "Sisestage eesnimi"
$Perenimi = Read-Host "Sisestage perenimi"

#liidab nime
$kasutaja = "$($eesnimi.ToLower()).$($perenimi.ToLower())"
#kontrollib kas kasutaja on olemas
$kasutaja2 = Get-ADUser -Filter {SamAccountName -eq $kasutaja}

if ($kasutaja2) {
    Write-Host "Kasutaja $Eesnimi $Perenimi on juba olemas."
} else {
#loob uue konto
$Parool = ConvertTo-SecureString "qwerty" -AsPlainText -Force
New-ADUser -SamAccountName $kasutaja -UserPrincipalName "$kasutaja@domain.local" -Name ($Eesnimi $Perenimi) -GivenName $Eesnimi -Surname $Perenimi -AccountPassword $Parool -Enabled $true -Path "CN=Users,DC=domain,DC=local"

Write-Host "Kasutaja on loodud."
}