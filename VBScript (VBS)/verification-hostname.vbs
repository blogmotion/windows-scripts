' Auteur  : @xhark 
' URL     : http://blogmotion.fr
' License : Creative Commons http://creativecommons.org/licenses/by-nd/4.0/deed.fr
' Version : 1.3
' Date    : 09/02/2018

' REMPLACER "nom-a-changer" PAR LE NOM D'HOTE A VERIFIER
hostname = "nom-a-changer"

Public Function Computer_Name()
  Set WshNetwork = WScript.CreateObject("WScript.Network")
  Computer_Name = WshNetwork.ComputerName
End Function



If LCase(Computer_Name) = LCase(hostname) Then
MsgBox "Vous devez IMPERATIVEMENT changer le nom de l'ordinateur (clic droit sur Ordinateur > Propriétés)" & vbCrLf & vbCrLf & "Convention de nommage : VMW-XXXXX",48,"/!\ AVANT DE CONTINUER /!\"
Set objShell = CreateObject("Wscript.Shell")
objShell.Run("control sysdm.cpl"), 1, TRUE
End If