<#

.SYNOPSIS
Creation du code HTML pour les affichages de casques du TP Nolark

.DESCRIPTION
La fonction genSection cree les fichiers cross, enfants, piste et route contenant le code HTML a inclure dans chaque page correspondante.
Les prix et les stocks sont generes aleatoirement.
Les stocks suivent la regle suivante :
	- Stock -1 : "Sur commande uniquement"
	- Stock < 10 : Plus que xx casques en stock"
	- Stock >= 10 : xx casques en stock"

.EXAMPLE
.\genHTML.ps1

.NOTES
Version : 1.0
Auteur : Jose GIL <jgil83000@gmail.com>
Date de creation : 01/09/2018

.INPUTS
Des repertoires avec des noms de categories et contenant des images.

.OUTPUTS
Des fichiers "categorie".html (cross, enfants, piste et route) contenant le code HTML a inclure dans chaque page correspondante.

#>

$banniere = @"
             ____________________________________________________
            /                         ¤                          \
           |    _____________________________________________     |
           |   |  __          __  _       _____    __        |    |
           |   |  \ \        / / | |     |  __ \  /_/        |    |
           |   |   \ \  /\  / /__| |__   | |  | | _____   __ |    |
           |   |    \ \/  \/ / _ \ '_ \  | |  | |/ _ \ \ / / |    |
           |   |     \  /\  /  __/ |_)|  | |__| |  __/\ V /  |    |
           |   |      \/  \/ \___\_.__/  |_____/ \___\ \_/   |    |
           |   |          _   _       _            _         |    |
           |   |         | \ | | ___ | | __ _ _ __| | __     |    |
           |   |         |  \| |/ _ \| |/ _' | '__| |/ /     |    |
           |   |         | |\  | (_) | | (_| | |  |   <      |    |
           |   |         |_| \_|\___/|_|\__,_|_|  |_|\_\     |    |
           |   |                         _           _       |    |
           |   |         _ __  _ __ ___ (_) ___  ___| |_     |    |
           |   |        | '_ \| '__/ _ \| |/ _ \/ _/| __|    |    |
           |   |        | |_) | | | (_) | |  __/ (_ | |_     |    |
           |   |        | .__/|_|  \___// |\___|\__| \__|    |    |
           |   |        |_|           |__/                   |    |
           |   |                                 by Jose GIL |    |
           |   |_____________________________________________|    |
           |                                              ***     |           ,====,
            \_____________________________________________________/        ,''     ';,  
                   \_______________________________________/              ''         _\.__
                ___/_______________________________________\___          ''        .'  |  '.   
             _-'    .-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.  --- ``-_     ''         /   | |   \
          _-'.-.-. .---.-.-.-.-.._._._._._._..-.-.-.-.-.--.  .-.-.``-_ ''         |    |_|    |
       _-'.-.-.-. .---.-.-.-.-.-|            |-.-.-.-.-..---.. .-.-.-.``-_        |     |     |
    _-'.-.-.-.-. .-----.--------|_____  _____|---------.-----. .-.-.-.-.``-_      |-----'-----|  
 _-'                            \_____||_____/                            ``-_    |           | 
:-----------------------------------------------------------------------------:  |           |
'---._.-----------------------------------------------------------------._.---'  |;         .|
                                                                                 ;\         /;
                                                                                  \\       //
                                                                                   \'._ _.'/
                                                                                    '-...-'
"@
Write-Host $banniere

$lesCategories = Get-ChildItem -Path . -Directory
$nbCasques = 0
foreach ($categorie in $lesCategories) {
    if(Test-Path $categorie".html") {
		Clear-Content $categorie".html"
	}
    Add-Content $categorie".html" "<section id=""casques"">"
    $cptLigne = 1;
    $lesFics = Get-ChildItem -Path $categorie
    $cptCasque = 0;
    foreach ($unFic in $lesFics) {
        if(($cptCasque % 5) -eq 0) {
            Add-Content $categorie".html" "`t<!-- - - - - - - - - - - - - - LIGNE N°$cptLigne - - - - - - - - - - - - -->"
            $cptLigne++;
        }
        Add-Content $categorie".html" "`t<article>"
        $altDesc = ($unFic -replace "-"," " -replace ".jpg","" -replace "  "," ").Trim()
        Add-Content $categorie".html" "`t`t<img src=""D:/Bloc 1/Nolark/images/images/casques/$categorie/$unFic"" alt=""$altDesc"">"
        $nbEnStock = Get-Random -Minimum -1 -Maximum 20
        if ($nbEnStock -eq -1) { 
            Add-Content $categorie".html" "`t`t<p class=""stockko""><abbr data-tip=""Sur commande uniquement"">stock</abbr></p>"
		} elseif ($nbEnStock -eq 0) {
            Add-Content $categorie".html" "`t`t<p class=""stockko""><abbr data-tip=""Plus de casques en stock"">stock</abbr></p>"
        } elseif ($nbEnStock -le 10) {
            Add-Content $categorie".html" "`t`t<p class=""stockok""><abbr data-tip=""Plus que $nbEnStock casques en stock..."">stock</abbr></p>"
        } else {
            Add-Content $categorie".html" "`t`t<p class=""stockok""><abbr data-tip=""$nbEnStock casques en stock"">stock</abbr></p>"
        }
        $prix = [Math]::Round((Get-Random -Minimum 150.0 -Maximum 450.0),2)
        Add-Content $categorie".html" "`t`t<p class=""prix"">$prix€</p>"
        $marque = (($unFic -split '-')[0]).Trim()
        Add-Content $categorie".html" "`t`t<p class=""marque"">$marque</p>"
		$modele = ((($unFic -replace "-"," ") -replace ".jpg","") -replace $marque,"").Trim()
        Add-Content $categorie".html" "`t`t<p class=""modele"">$modele</p>"
        $classement = (Get-Random -Minimum 0 -Maximum 10) * 5
		$note = ([string]($classement / 10)) -replace "\.",","
        if ($classement -le 5) {
            Add-Content $categorie".html" "`t`t<img class=""classement classement0$classement"" src=""../images/etoiles.gif"" alt=""Classement $note sur 5"">"
        } else {
            Add-Content $categorie".html" "`t`t<img class=""classement classement$classement"" src=""../images/etoiles.gif"" alt=""Classement $note sur 5"">"
        }
        Add-Content $categorie".html" "`t</article>"
        $cptCasque++;
		$nbCasques++;
    }
    Add-Content $categorie".html" "</section>"
	Write-Host "Creation de" $cptCasque "casques" $categorie
}
Write-Host "-----------------------------------"
Write-Host $nbCasques "casques au total crees dans" ($lesCategories).count "fichiers !"
Write-Host ""