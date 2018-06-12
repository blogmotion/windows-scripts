REM But		: fusionne des CSV en un seul avec gestion des lignes de tête
REM Auteur  : @xhark 
REM URL     : http://blogmotion.fr/programmation/batch/fusionner-fichiers-csv-en-tetes-17328
REM License : Creative Commons http://creativecommons.org/licenses/by-nd/4.0/deed.fr
REM Version : 1.0
REM Date    : 02/05/2016

@echo off
color 1F
cls

REM Variables
set "COMBINED=combined.csv"
set "SORTIE=SORTIE\%COMBINED%"

echo === DEBUT DU SCRIPT ===
echo.

REM set working directory
pushd %~dp0

ECHO Suppression fichier fusion precedent...
IF EXIST %SORTIE% del %SORTIE%

setlocal ENABLEDELAYEDEXPANSION

REM Init compteur
set cnt=1

REM pour tous les fichiers *.csv
for %%i in ("CSV_ENTREE\*.csv") do (
		REM si compteur=1 alors c'est la premiere passe
		if !cnt!==1 (
			REM Ecriture du fichier complet avec l'entete dans combined.csv (le fichier sera cree)
			for /f "delims=" %%j in ('type "%%i"') do echo %%j >> !SORTIE!
			echo  * Traitement de: %%i
		REM sinon c'est la Xeme passe, on traite le CSV si ce n'est pas le fichier combined.csv (ca tournerait en boucle!)
		) else if %%i NEQ !COMBINED! (
			REM ecriture du contenu fichier sans les entetes dans combined.csv
			for /f "skip=1 delims=" %%j in ('type "%%i"') do echo %%j >> !SORTIE!
			echo  * Traitement de: %%i
		)

	REM incremente le compteur
	set /a cnt+=1
)
echo.
echo.
IF EXIST %SORTIE% (
	echo. FUSION OK : %~dp0%SORTIE%
	REM explorer %SORTIE%
) ELSE (
	echo ERREUR: probablement aucun fichier "min*.csv" en entree
)
popd
echo. 
echo [Appuyer sur une touche pour quitter la moulinette]
pause >nul