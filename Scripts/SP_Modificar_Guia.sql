
ALTER PROCEDURE [dbo].[SP_Modificar_Guia]
			@ID_Guia [int],
			@EstadoGuia [varchar](200),
			@ID_Usuario_Ult_Modif [int]
            
AS



DECLARE @ID_Usuario_Transporte INT = NULL


IF(@EstadoGuia IN('EmitidaTpe', 'TransitoTpe'))
	SET @ID_Usuario_Transporte = @ID_Usuario_Ult_Modif


UPDATE Guias SET EstadoGuia = @EstadoGuia, ID_Usuario_Ult_Modif = @ID_Usuario_Ult_Modif, 
					ID_Usuario_Transporte = CASE WHEN @ID_Usuario_Transporte IS NOT NULL THEN @ID_Usuario_Transporte ELSE ID_Usuario_Transporte END 
WHERE ID_Guia = @ID_Guia
