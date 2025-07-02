
ALTER PROCEDURE [dbo].[SP_List_Report_Guias_Historial]
			@EstadoGuia varchar(200),
			@ID_Sucursal_Origen int = null,
			@ID_Sucursal_Destino int = null,
			@ID_Sucursal_Transito int = null,
			@NumeroGuia varchar(20) = null
AS

select a.ID_Guia, a.Fecha, o.Sucursal Sucursal_Origen, d.Sucursal Sucursal_Destino, t.Sucursal Sucursal_Transito, 
	a.NumeroGuia, a.EstadoGuia, a.Cantidad_Bultos, a.Nro_Pedido,
	te.TipoEnvio, a.Observaciones, a.Recibe_Destino

from Guias a
left join Sucursales o on a.ID_Sucursal_Origen = o.ID_Sucursal
left join Sucursales d on a.ID_Sucursal_Destino = d.ID_Sucursal
left join Sucursales t on a.ID_Sucursal_Transito = t.ID_Sucursal
left join TiposEnvio te on te.ID_TipoEnvio = a.ID_TipoEnvio

where (a.EstadoGuia = @EstadoGuia or @EstadoGuia = 'TODOS')
AND (a.ID_Sucursal_Origen = @ID_Sucursal_Origen or @ID_Sucursal_Origen is null)
AND (a.ID_Sucursal_Destino = @ID_Sucursal_Destino or @ID_Sucursal_Destino is null)
AND (a.ID_Sucursal_Transito = @ID_Sucursal_Transito or @ID_Sucursal_Transito is null)
AND (a.NumeroGuia = @NumeroGuia or @NumeroGuia is null)

order by 2, 3, 4
