 IF WVISIBLE("standard")
    DEACTIVATE WINDOW ("standard")
 ENDIF
 CLEAR
 CLEAR ALL

Set Date BRITISH
Set Deleted On
Set Century On
Set Default To
Set Debug On
Set Point To ","
Set Separator To '.'
Set Exclusive Off

Public poUsuario As Custom

poUsuario = Createobject("Custom")
poUsuario.AddProperty("id", 0)
poUsuario.AddProperty("nome", [])
poUsuario.AddProperty("login", [])
poUsuario.AddProperty("papel", 0)
poUsuario.AddProperty("npapel", [])
poUsuario.AddProperty("minimo", 0)
poUsuario.AddProperty("maximo", 0)

Use sysConfig In 0
Select sysConfig
Go Top

Public gcPastaPadrao, gcDataSource, gcDataSourceType

gcPastaPadrao = Alltrim(sysConfig.pasta)
gcDataSource = ""
gcDataSourceType = "NATIVE"

Use In sysConfig

Set Default To &gcPastaPadrao
Open Database ".\dados\dbNotas.dbc"
SET PROCEDURE TO ".\biblioteca.prg"

Do Form  [.\formularios\logon.scx]

If !Empty(poUsuario.Id)
	Do Form  [.\formularios\main.scx]
	Read Events
ENDIF

RELEASE poUsuario 
CLOSE ALL
QUIT

