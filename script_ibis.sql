--TABLA CREADA POR IBIS MURILLO

CREATE DATABASE DB_CIO
USE DB_CIO 

CREATE TABLE PAQUETES(
COD_PAQUETE VARCHAR (15) PRIMARY KEY,
CEDULA_DES VARCHAR (20),
CIUDAD VARCHAR (20),
DESCRIPCION VARCHAR (20),
DNI_CAMIONERO VARCHAR (20),
)

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

EXECUTE USP_GUARDAR_PAQUETES '1', '100760', 'BOGOTA', 'PEQUE�O DE COLOR VERDE', '2345'

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

EXECUTE USP_ACTUALIZAR_PAQUETES '1', '100760', 'BOGOTA', 'PEQUE�O DE COLOR VERDE', '3128'

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



--SEGUNDA TABLA CREADA POR IBIS MURILLO
CREATE TABLE CIUDADES (
 ID_CIUDAD VARCHAR (20) PRIMARY KEY,
 NOMBRE VARCHAR (15),
 COD_PAQUETE VARCHAR (20),
)

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








