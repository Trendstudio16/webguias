
CREATE PROCEDURE [dbo].[SP_Update_Seguridad]
	@ID_TipoUsuario [int],
	@MenuTipUsu Menu_Tipo_Usuario READONLY

AS

SET NOCOUNT ON


DECLARE @ID_Menu INT


-- SEGURIDAD MENU --	
DELETE 
FROM MenuTiposUsuario
WHERE ID_TipoUsuario = @ID_TipoUsuario


DECLARE cuMenuTipUsu INSENSITIVE CURSOR FOR

SELECT ID_Menu 
FROM @MenuTipUsu 	

FOR READ ONLY
OPEN cuMenuTipUsu
FETCH NEXT FROM cuMenuTipUsu INTO
	@ID_Menu
WHILE @@FETCH_STATUS = 0
	BEGIN
------------- Proceso por cada registro---------
	
INSERT INTO MenuTiposUsuario(ID_Menu, ID_TipoUsuario )
		VALUES(@ID_Menu, @ID_TipoUsuario)
	
------------------------------------------------
	FETCH NEXT FROM cuMenuTipUsu INTO
	@ID_Menu
	END
CLOSE cuMenuTipUsu
DEALLOCATE cuMenuTipUsu
