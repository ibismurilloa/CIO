create database  CIO
use cio

--TABLA CAMIONERO CREADA POR CRISTIAN RIVERA MUÑOZ--

CREATE TABLE CAMIONERO
(
CED_CAMIONERO VARCHAR(20) PRIMARY KEY,
NOMBRE VARCHAR(20),
APELLIDO VARCHAR(20),
TELEFONO VARCHAR(20),
DIRECCION VARCHAR(20),
SALARIO FLOAT
)

--TABLA CAMIONES CREADA POR CRISTIAN RIVERA MUÑOZ--

CREATE TABLE CAMIONES
(
MATRICULA VARCHAR(20) PRIMARY KEY,
CED_CAMIONERO VARCHAR(20),
POTENCIA VARCHAR(10),
MODELO VARCHAR(15),	
TIPO VARCHAR(20)
)

----tabla mantenimiento creada por oscar correa-----

create table tb_mantenimiento(
id_mantenimiento varchar(20) primary key,
matricula varchar(20),
fecha_mant varchar(20),
descripcion varchar (100)
)

--TABLA CREADA POR IBIS MURILLO--

CREATE TABLE PAQUETES(
COD_PAQUETE VARCHAR (15) PRIMARY KEY,
CEDULA_DES VARCHAR (20),
CIUDAD VARCHAR (20),
DESCRIPCION VARCHAR (20),
DNI_CAMIONERO VARCHAR (20),
)

----tabla cliente creada por oscar correa-----

create table tb_destinatrio(
cedula varchar (12),
nombre varchar (20),
telefono varchar(20),
id_direccion varchar(20),

)

--SEGUNDA TABLA CREADA POR IBIS MURILLO
CREATE TABLE CIUDADES (
 ID_CIUDAD VARCHAR (20) PRIMARY KEY,
 NOMBRE VARCHAR (15),
 COD_PAQUETE VARCHAR (20),
)

----tabla cliente creada por oscar correa-----
create table tb_direccion(
id_direccion varchar(20) primary key,
tipo varchar(20),
n_principal varchar(20),
sub_n1 varchar(20),
plus varchar(20),
sub_n2 varchar(20),
id_ciudad varchar(20)
)

--PROCEDIMIENTO DE GUARDAR CREADA POR CRISTIAN RIVERA MUÑOZ

CREATE PROCEDURE USP_GUARDAR_CAMIONERO
@CED_CAMIONERO VARCHAR(20),
@NOMBRE VARCHAR(20),
@APELLIDO VARCHAR(20),
@TELEFONO VARCHAR(20),
@DIRECCION VARCHAR(20),
@SALARIO VARCHAR(20)
AS
BEGIN
INSERT INTO CAMIONERO(CED_CAMIONERO,NOMBRE,APELLIDO,TELEFONO,DIRECCION,SALARIO)
VALUES(@CED_CAMIONERO,@NOMBRE,@APELLIDO,@TELEFONO,@DIRECCION,@SALARIO)
END

EXECUTE USP_GUARDAR_CAMIONERO '100','PEPO','RAMIREZ','121212','C14#45-45','100025'
EXECUTE USP_GUARDAR_CAMIONERO '10045','LUCA','MUÑOZ','1245454','C24#44-95','12121100025'
EXECUTE USP_GUARDAR_CAMIONERO '1045','LUCAS','PEREZ','1245454','C24#90-95','1214545848'

SELECT * FROM CAMIONERO


--PROCEDIMIENTO DE GUARDAR CREADA POR CRISTIAN RIVERA MUÑOZ--

CREATE PROCEDURE USP_GUARDAR_CAMIONES
@MATRICULA VARCHAR(10),
@CED_CAMIONERO VARCHAR(20),
@POTENCIA VARCHAR(10),
@MODELO VARCHAR(15),
@TIPO VARCHAR(20)
AS
BEGIN
INSERT INTO CAMIONES(MATRICULA,CED_CAMIONERO,POTENCIA,MODELO,TIPO)
VALUES(@MATRICULA,@CED_CAMIONERO,@POTENCIA,@MODELO,@TIPO)
END

EXECUTE USP_GUARDAR_CAMIONES '100A2','10045','25CV','VOLVO 2015','DOBLE TROQUE'


--PROCEDIMIENTO DE ACTUALIZAR CREADA POR CRISTIAN RIVERA MUÑOZ--

CREATE PROCEDURE USP_ACTUALIZAR_CAMIONERO
@CED_CAMIONERO VARCHAR(20),
@NOMBRE VARCHAR(20),
@APELLIDO VARCHAR (20),
@TELEFONO VARCHAR(20),
@DIRECCION VARCHAR(20),
@SALARIO VARCHAR(20)
AS
BEGIN
UPDATE CAMIONERO SET NOMBRE=@NOMBRE,APELLIDO=@APELLIDO,TELEFONO=@TELEFONO,DIRECCION=@DIRECCION,SALARIO=@SALARIO
WHERE CED_CAMIONERO=@CED_CAMIONERO
END

EXECUTE USP_ACTUALIZAR_CAMIONERO '100','PEDRO','RODRIGUEZ','121212','C14#45-45','100025'

--PROCEDIMIENTO DE ACTUALIZAR CREADA POR CRISTIAN RIVERA MUÑOZ--

CREATE PROCEDURE USP__ACTULIZAR_CAMIONES
@MATRICULA VARCHAR(20),
@CED_CAMIONERO VARCHAR(20),
@POTENCIA VARCHAR(10),
@MODELO VARCHAR(15),
@TIPO VARCHAR(20)
AS
BEGIN
UPDATE CAMIONES SET CED_CAMIONERO=@CED_CAMIONERO,POTENCIA=@POTENCIA,MODELO=@MODELO,TIPO=@TIPO
WHERE MATRICULA=@MATRICULA
END
EXECUTE USP__ACTULIZAR_CAMIONES '100A2','100','25CV','VOLVO 2015','DOBLE TROQUE'


--PROCEDIMIENTO DE ELIMINAR CREADA POR CRISTIAN RIVERA MUÑOZ

CREATE PROCEDURE USP_ELIMINAR_CAMIONERO
@CED_CAMIONERO VARCHAR(20)
AS
BEGIN
DELETE FROM CAMIONERO WHERE CED_CAMIONERO=@CED_CAMIONERO
END
EXECUTE  USP_ELIMINAR_CAMIONERO '1045'

--PROCEDIMIENTO DE ELIMINAR CREADA POR CRISTIAN RIVERA MUÑOZ
CREATE PROCEDURE USP_ELIMINAR_CAMIONES
@MATRICULA VARCHAR(20)
AS
BEGIN
DELETE FROM CAMIONES WHERE MATRICULA=@MATRICULA
END

EXECUTE USP_ELIMINAR_CAMIONES '100A2'

--PROCEDIMIENTO DE CONSULTAR CREADA POR CRISTIAN RIVERA MUÑOZ

CREATE PROCEDURE USP_CONSULTAR_CAMIONERO
@CED_CAMIONERO VARCHAR(20)
AS
BEGIN
SELECT * FROM CAMIONERO WHERE CED_CAMIONERO=@CED_CAMIONERO
END
EXECUTE USP_CONSULTAR_CAMIONERO '10045'

--PROCEDIMIENTO DE CONSULTAR CREADA POR CRISTIAN RIVERA MUÑOZ

CREATE PROCEDURE USP_CONSULTAR_CAMIONES
@MATRICULA VARCHAR(20)
AS
BEGIN
SELECT * FROM CAMIONES WHERE MATRICULA=@MATRICULA
END

EXECUTE USP_CONSULTAR_CAMIONES '100A2'


--PROCEDIMIENTO DE LISTAR CREADA POR CRISTIAN RIVERA MUÑOZ

CREATE PROCEDURE USP_LISTIAR_CAMIONERO
AS
BEGIN
SELECT NOMBRE,SALARIO FROM CAMIONERO 
END
EXECUTE USP_LISTIAR_CAMIONERO 

--PROCEDIMIENTO DE LISTAR CREADA POR CRISTIAN RIVERA MUÑOZ

CREATE PROCEDURE USP_LISTAR_CAMIONES
AS
BEGIN
SELECT * FROM CAMIONES
END

EXECUTE USP_LISTAR_CAMIONES


--PROCEDIMIENTO GUARDAR DATOS CREADO POR IBIS MURILLO
CREATE PROCEDURE USP_GUARDAR_PAQUETES
 @COD_PAQUETE VARCHAR (15),
 @CEDULA_DES VARCHAR (20),
 @CIUDAD VARCHAR (20),
 @DESCRIPCION VARCHAR (20),
 @DNI_CAMIONERO VARCHAR (20)
AS
BEGIN
  INSERT INTO PAQUETES (COD_PAQUETE, CEDULA_DES,CIUDAD,DESCRIPCION,DNI_CAMIONERO)
  VALUES (@COD_PAQUETE, @CEDULA_DES, @CIUDAD, @DESCRIPCION, @DNI_CAMIONERO)
END

EXECUTE USP_GUARDAR_PAQUETES '1', '100760', 'BOGOTA', 'PEQUEÑO DE COLOR VERDE', '2345'

--PROCEDIMINETO PARA ACTUALIZAR CREADO POR IBIS MURILLO
CREATE PROCEDURE USP_ACTUALIZAR_PAQUETES
 @COD_PAQUETE VARCHAR (15),
 @CEDULA_DES VARCHAR (20),
 @CIUDAD VARCHAR (20),
 @DESCRIPCION VARCHAR (20),
 @DNI_CAMIONERO VARCHAR (20)
 AS
 BEGIN
   UPDATE PAQUETES SET CEDULA_DES=@CEDULA_DES, CIUDAD=@CIUDAD, DESCRIPCION=@DESCRIPCION, DNI_CAMIONERO=@DNI_CAMIONERO
   WHERE COD_PAQUETE=@COD_PAQUETE
   END

EXECUTE USP_ACTUALIZAR_PAQUETES '1', '100760', 'BOGOTA', 'PEQUEÑO DE COLOR VERDE', '3128'

--PROCEDIMIENTO PARA CONSULTAR CREADO POR IBIS MURILLO
CREATE PROCEDURE USP_CONSULTAR
 @COD_PAQUETE VARCHAR (15)
AS
BEGIN
 SELECT *FROM PAQUETES WHERE COD_PAQUETE=@COD_PAQUETE
END

EXECUTE USP_CONSULTAR '1'

--PROCEDIMIENTO PARA LISTAR CREADO POR IBIS MURILLO

CREATE PROCEDURE USP_LISTAR_PAQUETES
AS
BEGIN
 SELECT *FROM PAQUETES
END

EXECUTE USP_LISTAR_PAQUETES

--PROCEDIMIENTO PARA ELIMINAR CREADO POR IBIS MURILLO
CREATE PROCEDURE USP_ELIMINAR_PAQUETES
 @COD_PAQUETE VARCHAR (15)
 AS 
 BEGIN
   DELETE FROM PAQUETES WHERE COD_PAQUETE=@COD_PAQUETE
END

EXECUTE USP_ELIMINAR_PAQUETES '1'



-- PROCEDIMIENTO PARA GUARDAR CREADO POR IBIS MURILLO
CREATE PROCEDURE USP_GUARDAR_CIUDAD
 @ID_CIUDAD VARCHAR (20),
 @NOMBRE VARCHAR (20),
 @COD_PAQUETE VARCHAR (20)
AS
BEGIN
  INSERT INTO CIUDADES (ID_CIUDAD, NOMBRE, COD_PAQUETE)
  VALUES (@ID_CIUDAD, @NOMBRE, @COD_PAQUETE)
  END

EXECUTE USP_GUARDAR_CIUDAD '1', 'MEDELLIN', '3'

--PROCEDIMIENTO PARA ACTUALIZAR CREADO POR IBIS MURILLO
CREATE PROCEDURE USP_ACTUALIZAR_CIUDAD
 @ID_CIUDAD VARCHAR (20),
 @NOMBRE VARCHAR (20),
 @COD_PAQUETE VARCHAR (20)
AS 
BEGIN
  UPDATE CIUDADES SET NOMBRE=@NOMBRE, COD_PAQUETE=@COD_PAQUETE
  WHERE ID_CIUDAD = @ID_CIUDAD
END 

EXECUTE USP_ACTUALIZAR_CIUDAD '1', 'BUCARAMANGA', '1'

--PROCEDIMIENTO PARA CONSULTAR CREADO POR IBIS MURILLO
CREATE PROCEDURE USP_CONSULTAR_CIUDAD
 @ID_CIUDAD VARCHAR (20)
AS
BEGIN
 SELECT *FROM CIUDADES WHERE ID_CIUDAD = @ID_CIUDAD
END 

EXECUTE USP_CONSULTAR_CIUDAD '1'

--PROCEDIMIENTO PARA LISTAR CREADO POR IBIS MURILLO
CREATE PROCEDURE USP_LISTAR_CIUDAD
AS
BEGIN
  SELECT *FROM CIUDADES
  END

EXECUTE USP_LISTAR_CIUDAD

--PROCEDIMIENTO PARA ELIMINAR CREADO POR IBIS MURILLO
CREATE PROCEDURE USP_ELIMINAR_CIUDAD
 @ID_CIUDAD VARCHAR(20)
AS
BEGIN
 DELETE FROM CIUDADES WHERE ID_CIUDAD = @ID_CIUDAD
END

EXECUTE USP_ELIMINAR_CIUDAD '2'
SELECT *FROM CIUDADES

-- procedimiento almacenado guardar destinatario oscar correa david
create procedure usp_guardar_destinatario
@cedula varchar (12),
@nombre varchar (20),
@telefono varchar(20),
@id_direccion varchar(20)
as
begin
	insert into tb_destinatario(cedula,nombre, telefono,id_direccion)values(@cedula,@nombre,@telefono,@id_direccion)
end
-- procedimiento almacenado actualizar destinatario oscar correa david
create procedure usp_actualizar_destinatario
@cedula varchar (12),
@nombre varchar (20),
@telefono varchar(20),
@id_direccion varchar(20)
as
begin
	update tb_destinatrio set nombre=@nombre,telefono=@telefono,id_direccion=@id_direccion where cedula=@cedula
end

--procedimiento para consultar destinatario oscar correa david
create procedure usp_consultar_destinatario
@cedula varchar(20)
as
begin
	select * from tb_destinatrio where cedula=@cedula
end
--listar destinatarios oscar correa david--
create procedure usp_listar_destinatario
as
begin
	select * from tb_destinatrio
end

--eliminar destinatario oscar correa david--
create procedure usp_eliminar_destinatario
@cedula varchar(20)
as
begin
	delete from tb_destinatrio where cedula=@
end


--guardar direccion oscar correa david--
create procedure usp_guardar_direccion
@id_direccion varchar(20) ,
@tipo varchar(20),
@n_principal varchar(20),
@sub_n1 varchar(20),
@plus varchar(20),
@sub_n2 varchar(20),
@id_ciudad varchar(20)
as
begin
	insert into tb_direccion (id_direccion,tipo,n_principal,sub_n1,plus,sub_n2,id_ciudad)values(@id_direccion,@tipo,@n_principal,@sub_n1,@plus,@sub_n2,@id_ciudad)
end
--actualizar direccion oscar correa david
create procedure usp_actualizar_direccion
@id_direccion varchar(20) ,
@tipo varchar(20),
@n_principal varchar(20),
@sub_n1 varchar(20),
@plus varchar(20),
@sub_n2 varchar(20),
@id_ciudad varchar(20)
as
begin
	update tb_direccion set tipo=@tipo,n_principal=@n_principal,sub_n1=@sub_n1,plus=@plus,sub_n2=@sub_n2,id_ciudad=@id_ciudad where id_direccion=@id_direccion
end
--consultar direccion oscar correa david

create procedure usp_consultar_direccion
@id_direccion varchar(20)
as
begin
	select * from tb_direccion where id_direccion=@id_direccion
end
--listar direccion oscar correa david
create procedure usp_listar_direccion
as
begin
select * from tb_direccion
end
--eliminar direccion oscar correa david
create procedure usp_eliminar_direccion
@id_direccion varchar (20)
as
begin
	delete from tb_direccion where id_direccion=@id_direccion
end
--guardar mantenimiento oscar correa david
create procedure usp_guardar_mantenimiento
@id_mantenimiento varchar(20),
@matricula varchar(20),
@fecha_mant varchar(20),
@descripcion varchar (100)
as
begin
 insert into tb_mantenimiento(id_mantenimiento,matricula,fecha_mant,descripcion)values(@id_mantenimiento,@matricula,@fecha_mant,@descripcion)
end


--actualizar mantenimiento oscar correa david
create procedure usp_update_mantenimiento
@id_mantenimiento varchar(20),
@matricula varchar(20),
@fecha_mant varchar(20),
@descripcion varchar (100)
as
begin
	update tb_mantenimiento set matricula=@matricula,fecha_mant=@fecha_mant,descripcion=@descripcion where id_mantenimiento=@id_mantenimiento
end

--consultar mantenimiento oscar correa david
create procedure usp_consultar_mantenimiento
@id_mantenimiento varchar(20)
as
begin
	select * from tb_mantenimiento where id_mantenimiento=@id_mantenimiento
end

--listar mantenimientos oscar correa david
create procedure usp_listar_mantenimiento
as
begin
	select * from tb_mantenimiento
end


--eliminar mantenimiento oscar correa david--
create procedure usp_eliminar_mantenimiento
@id_mantenimiento varchar(20)
as
begin
	delete from tb_mantenimiento where id_mantenimiento=@id_mantenimiento
end

--llaves foraneas 
alter table tb_mantenimiento 
add constraint FK_tb_mantenimiento_matricula_CAMIONES_MATRICULA
foreign key(matricula)
references CAMIONES (MATRICULA) 

--prueba de llave foranea
execute usp_guardar_mantenimiento '1', '1010',  '27 junio', 'cambio aceite' 
execute USP__ACTULIZAR_CAMIONES '1010', '100', '14CV', 'FERRARI', 'DOBLE' 

--execute 
execute usp_guardar_destinatario '54321', 'CRISTIAN', '56789', '1'
select *from tb_destinatrio 

execute usp_guardar_direccion '1', 'carrera', '94', '65', 'b', '32', '1'  
execute USP_GUARDAR_CIUDAD '1', 'MEDELLIN', '1'  

--MAS LLAVES FORANEAS 
alter table CAMIONES 
add constraint FK_CAMIONES_CED_CAMIONERO_CAMIONERO_CED_CAMIONERO
foreign key (CED_CAMIONERO)
references CAMIONERO (CED_CAMIONERO) 

alter table PAQUETES
add constraint FK_PAQUETES_CED_CAMIONERO_PAQUETES_DNI_CAMIONERO
foreign key (DNI_CAMIONERO)
references CAMIONERO (CED_CAMIONERO) 

alter table PAQUETES
add constraint FK_PAQUETES_CEDULA_DES_tb_destinatrio_cedula
foreign key (CEDULA_DES)
references tb_destinatrio (cedula) 

alter table tb_destinatrio alter column cedula varchar(20) not null

alter table tb_destinatrio add primary key (cedula)



alter table tb_destinatrio
add constraint tb_destinatrio_id_direccion_direccion_id_direccion
foreign key (id_direccion)
references tb_direccion (id_direccion) 

alter table tb_direccion
add constraint FK_TB_DIRECCION__ID_CIUDAD_CIUDAD_ID_CIUDAD
foreign key (id_ciudad)
references CIUDADES (ID_CIUDAD) 

