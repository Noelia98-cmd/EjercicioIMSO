New-ADOrganizationalUnit -Name "Direccion" -Path "DC=practica,DC=com"
New-ADOrganizationalUnit -Name "Produccion" -Path "DC=practica,DC=com"
New-ADOrganizationalUnit -Name "Ventas" -Path "DC=practica,DC=com"

New-ADGroup -Name "G_Direccion" -GroupCategory Security -GroupScope Global -Path "OU=Direccion,DC=practica,DC=com"

New-ADGroup -Name "G_Produccion" -GroupCategory Security -GroupScope Global -Path "OU=Produccion,DC=practica,DC=com"

New-ADGroup -Name "G_Ventas" -GroupCategory Security -GroupScope Global -Path "OU=Ventas,DC=practica,DC=com"

$password = ConvertTo-SecureString "Practica2026!" -AsPlainText -Force

1..10 | ForEach-Object {
    $name = "usuD$_"
    New-ADUser -Name $name -SamAccountName $name -Path "OU=Direccion,DC=practica,DC=com" -AccountPassword $password -Enabled $true -ProfilePath "\\SERVIDOR\Perfiles\$name"
    Add-ADGroupMember -Identity "G_Direccion" -Members $name
}

1..100 | ForEach-Object {
    $name = "usuP$_"
    New-ADUser -Name $name -SamAccountName $name -Path "OU=Produccion,DC=practica,DC=com" -AccountPassword $password -Enabled $true -ProfilePath "\\SERVIDOR\Perfiles\$name"
    Add-ADGroupMember -Identity "G_Produccion" -Members $name
}

1..20 | ForEach-Object {
    $name = "usuV$_"
    New-ADUser -Name $name -SamAccountName $name -Path "OU=Ventas,DC=practica,DC=com" -AccountPassword $password -Enabled $true -ProfilePath "\\SERVIDOR\Perfiles\$name"
    Add-ADGroupMember -Identity "G_Ventas" -Members $name
}

New-ADUser -Name "usuAux" -SamAccountName "usuAux" -Path "DC=practica,DC=com" -AccountPassword $password -Enabled $true -ProfilePath "\\SERVIDOR\Perfiles\usuAux"
