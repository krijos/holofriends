--[[
HoloFriends addon created by Holo, continued by Zappster, followed by Andymon

Get the latest version at wow.curse.com

See HoloFriends_change.log for more informations  
]]

--[[

This file defines the Brazilian Portuguese localisation data

]]

if( GetLocale() == "ptBR" ) then

HOLOFRIENDS_DIALOGFACTIONMERGEFRIENDWARNING = [=[Voc� est� prestes a fundir todos os amigos de
|cffffd200%s|r
� lista de amigos da fac��o.

|cffffd200AVISO|r
A lista individual de amigos ser� deletada!
Este passo � irrecorrigivel!
Dependendo das op��es, isso pode levar a perda de dados!
Os dados da lista de amigos s� s�o salvos localmente no seu disco r�gido.

|cffffd200SUGEST�O|r
Fa�a uma c�pia de seguran�a (em um pendrive) do arquivo com a sua lista de amigos do HoloFriends:
{diret�rio_do_WoW}/WTF/Account/{Sua_Conta}/SavedVariables/HoloFriends.lua

|cffffd200Voc� tem uma c�pia de seguran�a?|r]=]; -- Needs review

HOLOFRIENDS_LISTFEATURES39 = "marque um amigo para que ele seja monitorado e uma mensagem seja mostrada quando ele ficar online"; -- Needs review

HOLOFRIENDS_INITSHOWONLINEATLOGIN = "Lista dos seus amigos online:"; -- Needs review

HOLOFRIENDS_MSGFRIENDNOBNETNOFRIEND = "BNet indispon�vel no momento. Convite de amigo BNet n�o foi enviado."; -- Needs review
HOLOFRIENDS_MSGFRIENDNOBNETNOREMOVE = "BNet indispon�vel no momento. O amigo BNet n�o p�de ser removido."; -- Needs review
HOLOFRIENDS_MSGFRIENDNOBTAGNOFRIEND = "BattleTags est�o desativados. Nenhum convite BNet foi enviado."; -- Needs review
HOLOFRIENDS_MSGFRIENDNOREALIDNOFRIEND = "RealIDs est�o desativados. Nenhum convite BNet foi enviado."; -- Needs review

HOLOFRIENDS_OPTIONS1BNCHARNAMEFIRST = "Mudar a ordem de nomes de char e nomes reais"; -- Needs review
HOLOFRIENDS_OPTIONS1BNCHARNAMEFIRSTTT = "Se checado, o nome real do amigo de RealID ser� mostrado atr�s do nome do char."; -- Needs review
HOLOFRIENDS_OPTIONS1BNSHOWCHARNAME = "Mostrar nome do char perto do nome real do BNet"; -- Needs review

end
