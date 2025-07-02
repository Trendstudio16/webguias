

EXEC sp_RENAME 'Guias.ID_Responsable_Origen' , 'ID_Usuario_Origen', 'COLUMN'
go
EXEC sp_RENAME 'Guias.ID_Responsable_Destino' , 'Recibe_Destino', 'COLUMN'
go
update Guias set Recibe_Destino = NULL, ID_Usuario_Origen = ID_Usuario_Creacion
go
alter table Guias alter column Recibe_Destino varchar(200)
go
drop table Responsables
go
delete from Menu where NodoID in(200, 201, 202, 203, 204)
go

go


CREATE PROCEDURE [dbo].[SP_List_Report_Guias_Historial]
			@EstadoGuia varchar(200),
			@ID_Sucursal_Origen int = null,
			@ID_Sucursal_Destino int = null,
			@ID_Sucursal_Transito int = null,
			@NumeroGuia int = null
AS

go

CREATE PROCEDURE [dbo].[SP_List_Report_Guias_Historial_Logs]
			@ID_Guia int = null
AS

GO

alter table Guias alter column NumeroGuia varchar(20)

