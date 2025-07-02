
ALTER PROCEDURE [dbo].[SP_List_Report_Guias_Historial_Logs]
			@ID_Guia int = null
AS

select a.Accion, isnull(u.Descripcion, u.Usuario) Usuario, a.Fecha
from GuiasLog a
left join Usuarios u on u.ID_Usuario = a.ID_Usuario
where ID_Guia = @ID_Guia
order by Fecha
