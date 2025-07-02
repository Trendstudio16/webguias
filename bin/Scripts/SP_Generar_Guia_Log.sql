
ALTER PROCEDURE [dbo].[SP_Generar_Guia_Log]
			@ID_Guia [int],
			@Accion [varchar](200),
			@ID_Usuario [int]
            
AS





INSERT INTO GuiasLog(ID_Guia, Accion, ID_Usuario, Fecha) 
VALUES(@ID_Guia, @Accion, @ID_Usuario, GETDATE())
