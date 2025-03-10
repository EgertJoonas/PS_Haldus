$Password = ConvertTo-SecureString 'qwerty' -AsPlainText -Force

New-LocalUser 'kasutaja1' -Password $Password -FullName 'Esimene kasutaja' -Description 'kohalik konto'