
Create Procedure SP_Update_Contraseña_Usuario
	@ID_Usuario [int],
	@Contraseña [varchar](200)

AS

SET NOCOUNT ON




UPDATE  Usuarios SET Contraseña = @Contraseña
WHERE ID_Usuario = @ID_Usuario

