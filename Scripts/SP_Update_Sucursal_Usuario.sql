
Create Procedure SP_Update_Sucursal_Usuario
	@ID_Usuario [int],
	@ID_Sucursal [int]

AS

SET NOCOUNT ON




UPDATE  Usuarios SET ID_Sucursal = @ID_Sucursal
WHERE ID_Usuario = @ID_Usuario
