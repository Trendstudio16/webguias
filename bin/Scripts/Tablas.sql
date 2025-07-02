
CREATE TABLE Menu(ID_Menu int identity primary key,
					NodoID int NOT NULL,
					[Name] varchar(200) NOT NULL,
					Caption varchar(200) NOT NULL,
					ParentID int NOT NULL,
					Orden int NOT NULL)

GO

CREATE TABLE TiposUsuario(ID_TipoUsuario int identity primary key,
					TipoUsuario varchar(50) NOT NULL,
					Descripcion varchar(max) NULL,
					Inhabilitado bit NOT NULL)

GO

CREATE TABLE Usuarios(ID_Usuario int identity primary key,
						Usuario varchar(200) NOT NULL,
						Contraseña varchar(200) NOT NULL,
						Descripcion varchar(max) NULL,
						ID_TipoUsuario int NOT NULL,
						ID_Sucursal int NULL,
						Inhabilitado bit NOT NULL)

GO

CREATE TABLE MenuTiposUsuario(ID_Menu int NOT NULL,
							ID_TipoUsuario int NOT NULL,
							CONSTRAINT PK_MenuTiposUsuario PRIMARY KEY CLUSTERED 
							(
								ID_Menu ASC,
								ID_TipoUsuario ASC
							))

GO


insert into TiposUsuario(TipoUsuario, Descripcion, Inhabilitado)
values('ADMINISTRADOR', null, 0)

insert into TiposUsuario(TipoUsuario, Descripcion, Inhabilitado)
values('SUCURSAL', null, 0)

insert into TiposUsuario(TipoUsuario, Descripcion, Inhabilitado)
values('TRANSPORTISTA', null, 0)

insert into TiposUsuario(TipoUsuario, Descripcion, Inhabilitado)
values('SUCURSAL / TRANSPORTISTA', null, 0)

insert into Usuarios ([Usuario],[Contraseña],[Descripcion],[ID_TipoUsuario],[Inhabilitado])
values ('ADMINISTRADOR','cRDtpNCeBiql5KOQsKVyrA0sAiA=', null, 1, 0)
-- pass 1234


GO

truncate table MenuTiposUsuario
truncate table Menu

GO

---------------------------------------------------------------------

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(1,'Carga Inicial','Carga Inicial',0,1)

---------------------------------------------------------------------

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(100,'Sucursales','Sucursales',1,100)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(101,'Nuevo','Nuevo',100,101)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(102,'Editar','Editar',100,102)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(103,'Borrar','Borrar',100,103)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(104,'Exportar','Exportar',100,104)

---------------------------------------------------------------------



---------------------------------------------------------------------

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(300,'Reglas de Transito','Reglas de Transito',1,300)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(301,'Nuevo','Nuevo',300,301)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(302,'Editar','Editar',300,302)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(303,'Borrar','Borrar',300,303)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(304,'Exportar','Exportar',300,304)

---------------------------------------------------------------------

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(400,'Tipos de Envio','Tipos de Envio',1,400)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(401,'Nuevo','Nuevo',400,410)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(402,'Editar','Editar',400,420)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(403,'Borrar','Borrar',400,430)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(404,'Exportar','Exportar',400,440)

---------------------------------------------------------------------
---------------------------------------------------------------------


insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(10,'Guias','Guias',0,10)

---------------------------------------------------------------------

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(1000,'Generacion','Generacion',10,1000)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(1001,'Nuevo','Nuevo',1000,1001)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(1002,'Editar','Editar',1000,1002)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(1003,'Borrar','Borrar',1000,1003)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(1004,'Exportar','Exportar',1000,1004)

---------------------------------------------------------------------

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(1010,'Retiro','Retiro',10,1010)

--insert into Menu(NodoID,Name,Caption,ParentID,Orden)
--values(1011,'Nuevo','Nuevo',1010,1011)

--insert into Menu(NodoID,Name,Caption,ParentID,Orden)
--values(1012,'Editar','Editar',1010,1012)

--insert into Menu(NodoID,Name,Caption,ParentID,Orden)
--values(1013,'Borrar','Borrar',1010,1013)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(1014,'Exportar','Exportar',1010,1014)

---------------------------------------------------------------------

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(1020,'Recepcion','Recepcion',10,1020)

--insert into Menu(NodoID,Name,Caption,ParentID,Orden)
--values(1021,'Nuevo','Nuevo',1020,1021)

--INSERT INTO Menu(NodoID,Name,Caption,ParentID,Orden)
--VALUES(1022,'Editar','Editar',1020,1022)

--insert into Menu(NodoID,Name,Caption,ParentID,Orden)
--values(1023,'Borrar','Borrar',1020,1023)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(1024,'Exportar','Exportar',1020,1024)

---------------------------------------------------------------------
---------------------------------------------------------------------

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(20,'Reportes','Reportes',0,20)

---------------------------------------------------------------------

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(2010,'Guias Resumido','Guias Resumido',20,2010)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(2020,'Guias Historial','Guias Historial',20,2020)

---------------------------------------------------------------------
---------------------------------------------------------------------

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(30,'Seguridad','Seguridad',0,30)

---------------------------------------------------------------------

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(3000,'Usuarios','Usuarios',30,3000)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(3011,'Nuevo','Nuevo',3000,3011)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(3012,'Editar','Editar',3000,3012)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(3013,'Borrar','Borrar',3000,3013)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(3014,'Exportar','Exportar',3000,3014)

---------------------------------------------------------------------

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(3020,'Tipos de Usuario','Tipos de Usuario',30,3020)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(3021,'Nuevo','Nuevo',3020,3021)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(3022,'Editar','Editar',3020,3022)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(3023,'Borrar','Borrar',3020,3023)

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(3024,'Exportar','Exportar',3020,3024)

---------------------------------------------------------------------

insert into Menu(NodoID,Name,Caption,ParentID,Orden)
values(3030,'Permisos','Permisos',30,3030)

---------------------------------------------------------------------


insert into MenuTiposUsuario(ID_Menu,ID_TipoUsuario)
SELECT ID_Menu, 1 ID_TipoUsuario
FROM Menu



GO

----------------------------------------------

CREATE TABLE Provincias(ID_Provincia int identity primary key,
										Provincia varchar(200),
										Descripcion varchar(max) NULL,
										Inhabilitado bit NOT NULL)

GO

Insert into Provincias values('CIUDAD AUTÓNOMA DE BUENOS AIRES', '',  0 )
Insert into Provincias values('BUENOS AIRES', '',  0 )
Insert into Provincias values('CATAMARCA', '',  0 )
Insert into Provincias values('CÓRDOBA', '',  0 )
Insert into Provincias values('CORRIENTES', '',  0 )
Insert into Provincias values('ENTRE RÍOS', '',  0 )
Insert into Provincias values('JUJUY', '',  0 )
Insert into Provincias values('LA RIOJA', '',  0 )
Insert into Provincias values('MENDOZA', '',  0 )
Insert into Provincias values('SALTA', '',  0 )
Insert into Provincias values('SAN JUAN', '',  0 )
Insert into Provincias values('SAN LUIS', '',  0 )
Insert into Provincias values('SANTA FE', '',  0 )
Insert into Provincias values('SANTIAGO DEL ESTERO', '',  0 )
Insert into Provincias values('TUCUMÁN', '',  0 )
Insert into Provincias values('CHACO', '',  0 )
Insert into Provincias values('CHUBUT', '',  0 )
Insert into Provincias values('FORMOSA', '',  0 )
Insert into Provincias values('LA PAMPA', '',  0 )
Insert into Provincias values('MISIONES', '',  0 )
Insert into Provincias values('NEUQUÉN', '',  0 )
Insert into Provincias values('RÍO NEGRO', '',  0 )
Insert into Provincias values('SANTA CRUZ', '',  0 )
Insert into Provincias values('TIERRA DEL FUEGO', '',  0 )

GO

CREATE TABLE Sucursales(ID_Sucursal int identity primary key,
										Sucursal varchar(200), 
										Telefono varchar(200), 
										Direccion varchar(200), 
										Localidad varchar(200), 
										ID_Provincia int,
										EsTransito bit NOT NULL,
										Descripcion varchar(max) NULL,
										Inhabilitado bit NOT NULL)

GO

CREATE TABLE ReglasTransito(ID_ReglaTransito int identity primary key,
										ID_Sucursal_Origen int,
										ID_Sucursal_Destino int,
										ID_Sucursal_Transito int,
										Descripcion varchar(max) NULL,
										Inhabilitado bit NOT NULL)

GO

CREATE TABLE TiposEnvio(ID_TipoEnvio int identity primary key,
										TipoEnvio varchar(200),
										Descripcion varchar(max) NULL,
										Inhabilitado bit NOT NULL)

GO

CREATE TABLE Guias(ID_Guia int identity primary key,
										ID_TipoEnvio int,
										ID_Sucursal_Origen int,
										ID_Usuario_Origen int,
										ID_Sucursal_Destino int,
										Recibe_Destino varchar(200),
										ID_Sucursal_Transito int,
										Cantidad_Bultos int,
										Observaciones varchar(max) NULL,
										Nro_Pedido varchar(200),
										Fecha datetime,
										c varchar(20),
										ID_Usuario_Creacion int,
										ID_Usuario_Ult_Modif int,
										ID_Usuario_Transporte int,
                                        EstadoGuia varchar(200),
										Fecha_Creacion datetime,
										Fecha_Ult_Modif datetime)

GO

CREATE TABLE GuiasLog(ID_Guialog int identity primary key,
										ID_Guia int,
										Accion varchar(200),
										ID_Usuario int,
										Fecha datetime)



