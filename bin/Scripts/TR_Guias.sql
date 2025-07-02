
ALTER TRIGGER TR_Guias
ON Guias
AFTER  INSERT, UPDATE, DELETE
AS

	
SET NOCOUNT ON


DECLARE @Operation VARCHAR(15)
 
IF EXISTS (SELECT 0 FROM inserted)
BEGIN
   IF EXISTS (SELECT 0 FROM deleted)
   BEGIN 
      SELECT @Operation = 'UPDATE'
   END ELSE
   BEGIN
      SELECT @Operation = 'INSERT'
   END
END ELSE 
BEGIN
   SELECT @Operation = 'DELETE'
END 


IF(@Operation = 'INSERT')
BEGIN

	declare @id_n_comp INT = NULL, @NroGuia varchar(20) = ''
	
	-- proximo numero de guia
	select @id_n_comp = isnull(max(cast(right(NumeroGuia, 8) as int)), 0) + 1 
	from Guias
	where LEFT(NumeroGuia, 5) = '00001'

	set @nroguia = '00001' + replicate('0', 8 - len(cast(@id_n_comp as varchar(8)))) + cast(@id_n_comp as varchar(8))



	UPDATE Guias SET NumeroGuia = @nroguia, EstadoGuia = CASE WHEN r.ID_Sucursal_Transito IS NULL THEN 'Emitida' ELSE 'Transito' END, 
				Fecha_Creacion = GETDATE(), ID_Sucursal_Transito = r.ID_Sucursal_Transito,
				Fecha = CAST(GETDATE() AS DATE)
	FROM Guias a
	INNER JOIN inserted I ON i.ID_Guia = a.ID_Guia
	LEFT JOIN ReglasTransito r ON i.ID_Sucursal_Origen = r.ID_Sucursal_Origen AND i.ID_Sucursal_Destino = r.ID_Sucursal_Destino AND r.Inhabilitado = 0

END
ELSE IF(@Operation = 'UPDATE')
BEGIN
	
	UPDATE Guias SET Fecha_Ult_Modif = GETDATE()
	FROM Guias a
	INNER JOIN inserted I ON i.ID_Guia = a.ID_Guia
	WHERE i.ID_Usuario_Ult_Modif IS NOT null

END
ELSE IF(@Operation = 'DELETE')
BEGIN
	
	-- para el log
	UPDATE Guias SET Fecha_Ult_Modif = GETDATE()
	FROM Guias a
	INNER JOIN deleted d ON d.ID_Guia = a.ID_Guia
	WHERE 1= 2

END