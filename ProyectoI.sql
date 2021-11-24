/* 
    Instituto Tecnológico de Costa Rica
    Bases de Datos II
    II Semestre 2020
    Profesora: María Auxiliadora Mora
    Proyecto#1
    Estudiante: María José Barquero Pérez 
                Te Chen Huang

*/

/*Eliminar tablas*/
DROP TABLE Telefono;
DROP TABLE Articulo_Categoria;
DROP TABLE Categoria;
DROP TABLE Registro_Orden;
DROP TABLE Orden;
DROP TABLE Articulo;
Drop TABLE Temporal_Datos;
DROP TABLE Historial;
DROP TABLE Cliente_Estado;
DROP TABLE Cliente;
DROP TABLE Provincia;

/*Eliminar secuencias*/
DROP SEQUENCE Seq_Id_Provincia;
DROP SEQUENCE Seq_Id_Articulo;
DROP SEQUENCE Seq_Id_Categoria;
DROP SEQUENCE Seq_Id_Orden;
DROP SEQUENCE Seq_Id_registro;

/*Eliminar índices*/
DROP INDEX nombre_cliente_idx;
DROP INDEX correo_electronico_cliente_idx;
DROP INDEX nombre_provincia_idx;
DROP INDEX nombre_categoria_idx;
DROP INDEX telefono_cliente_idx;
DROP INDEX nombre_articulo_idx;

/*Select de todas las tablas*/
SELECT * FROM Orden;
SELECT * FROM Registro_Orden;
SELECT * FROM Categoria;
SELECT * FROM Articulo;
SELECT * FROM Articulo_Categoria;
SELECT * FROM Cliente;
SELECT * FROM Temporal_Datos;    

/*Crear las tablas*/
CREATE TABLE Categoria
  (Id_Categoria NUMBER(3),
  Nombre_Categoria VARCHAR2(30));
  
CREATE TABLE Telefono
  (Cedula NUMBER(15),
  Telefono_cliente NUMBER(12));
 
CREATE TABLE Orden
  (Id_Orden NUMBER(8),
  Cedula NUMBER(15),
  Cantidad_Total NUMBER(3),
  Subtotal NUMBER(10),
  Total NUMBER(10),
  Impuesto NUMBER(10),
  Descuento NUMBER(3));

CREATE TABLE Articulo_Categoria
 (Id_Categoria NUMBER(3),
 Id_Articulo NUMBER(5));

CREATE TABLE Cliente(
    Cedula NUMBER(15),
    Id_Provincia NUMBER(3),
    Nombre VARCHAR2(30),
    Primer_Apellido VARCHAR2(30),
    Segundo_Apellido VARCHAR2(30),
    Correo_Electronico VARCHAR2(20),
    Contrasena VARCHAR2(30));

CREATE TABLE Provincia(
    Id_Provincia NUMBER(3),
    Provincia VARCHAR2(20));

CREATE TABLE Articulo(
    Id_Articulo NUMBER(5),
    Nombre_Articulo VARCHAR2(30),
    Precio_Unitario NUMBER(10),
    Cantidad_Disponible NUMBER(3),
    Descripcion VARCHAR2(50));

CREATE TABLE Registro_Orden(
    Id_Articulo NUMBER(5),
    Id_Orden NUMBER(8),
    Precio_Venta NUMBER(10),
    Cantidad NUMBER(3));

/*Crear Secuencias*/
CREATE SEQUENCE Seq_Id_Provincia;
CREATE SEQUENCE Seq_Id_Articulo;
CREATE SEQUENCE Seq_Id_Categoria;
CREATE SEQUENCE Seq_Id_Orden;
CREATE SEQUENCE Seq_Id_registro;

/*Llaves Primarias */
ALTER TABLE Cliente
           ADD CONSTRAINT Cedula_PK
           PRIMARY KEY(Cedula);

ALTER TABLE Articulo
           ADD CONSTRAINT Id_Articulo_PK
           PRIMARY KEY(Id_Articulo);

ALTER TABLE Provincia
           ADD CONSTRAINT Id_Provinvia_PK
           PRIMARY KEY(Id_Provincia);

ALTER TABLE Registro_Orden
           ADD CONSTRAINT Registro_Orden_PK
           PRIMARY KEY(Id_Articulo,Id_Orden);

ALTER TABLE Orden
           ADD CONSTRAINT Id_Orden_PK
           PRIMARY KEY(Id_Orden);

ALTER TABLE Categoria
           ADD CONSTRAINT Id_cat_PK
           PRIMARY KEY(Id_Categoria);
   
ALTER TABLE Telefono
           ADD CONSTRAINT CedulaT_PK
           PRIMARY KEY(Cedula,Telefono_cliente);
           
ALTER TABLE Articulo_Categoria
           ADD CONSTRAINT Id_cat_art_PK
           PRIMARY KEY(Id_Categoria,Id_Articulo);

/*Llaves Foráneas */
ALTER TABLE Cliente
           ADD CONSTRAINT Id_Provincia_FK
           FOREIGN KEY(Id_Provincia)
           REFERENCES Provincia(Id_Provincia);
           
ALTER TABLE Orden
           ADD CONSTRAINT CedulaOr_FK
           FOREIGN KEY(Cedula)
           REFERENCES Cliente(Cedula);

ALTER TABLE Registro_Orden
           ADD CONSTRAINT Id_Articulo_FK
           FOREIGN KEY(Id_Articulo)
           REFERENCES Articulo(Id_Articulo);

ALTER TABLE Registro_Orden
           ADD CONSTRAINT Id_Orden_FK
           FOREIGN KEY(Id_Orden)
           REFERENCES Orden(Id_Orden);

ALTER TABLE Articulo_Categoria
           ADD CONSTRAINT Id_cat_FK
           FOREIGN KEY(Id_Categoria)
           REFERENCES Categoria(Id_Categoria);
                   
ALTER TABLE Articulo_Categoria
           ADD CONSTRAINT id_art_FK
           FOREIGN KEY(Id_Articulo)
           REFERENCES Articulo(Id_Articulo);
           
ALTER TABLE Telefono
           ADD CONSTRAINT cedulaT_FK
           FOREIGN KEY(Cedula)
           REFERENCES Cliente(Cedula);
 
/*Restricción not null*/           
ALTER TABLE Cliente MODIFY (Nombre NOT NULL);
ALTER TABLE Cliente MODIFY (Primer_Apellido NOT NULL);
ALTER TABLE Cliente MODIFY (Segundo_Apellido NOT NULL);
ALTER TABLE Cliente MODIFY (Correo_Electronico NOT NULL);
ALTER TABLE Cliente MODIFY (Contrasena NOT NULL);
ALTER TABLE Provincia MODIFY (Provincia NOT NULL);
ALTER TABLE Registro_Orden MODIFY (Precio_Venta NOT NULL);
ALTER TABLE Registro_Orden MODIFY (Cantidad NOT NULL);
ALTER TABLE Articulo MODIFY (Nombre_Articulo NOT NULL);
ALTER TABLE Articulo MODIFY (Precio_Unitario NOT NULL);
ALTER TABLE Articulo MODIFY (Cantidad_Disponible NOT NULL);
ALTER TABLE Categoria MODIFY (Nombre_Categoria NOT NULL);
ALTER TABLE Telefono MODIFY (Telefono_cliente NOT NULL);

/*Restricciones*/
ALTER TABLE Orden ADD CONSTRAINT cant_CK check (Cantidad_Total >= 0);   
ALTER TABLE Orden ADD CONSTRAINT sub_CK check  (Subtotal >= 0);   
ALTER TABLE Orden ADD CONSTRAINT total_CK check(Total >= 0);   
ALTER TABLE Orden ADD CONSTRAINT imp_CK check  (Impuesto >= 0);  
ALTER TABLE Orden ADD CONSTRAINT desc_CK check (Descuento >= 0);  
ALTER TABLE Articulo ADD CONSTRAINT precio_unitario_CK check (Precio_Unitario >= 0);  
ALTER TABLE Articulo ADD CONSTRAINT Cantidad_Disponible_CK check (Cantidad_Disponible >= 0);  
ALTER TABLE Registro_Orden ADD CONSTRAINT Precio_Venta_CK check (Precio_Venta >= 0);  
ALTER TABLE Registro_Orden ADD CONSTRAINT Cantidad_CK check (Cantidad >= 0);  

/*Crear índices*/
CREATE INDEX nombre_cliente_idx
ON Cliente(Nombre);
CREATE INDEX correo_electronico_cliente_idx
ON Cliente(Correo_Electronico);
CREATE INDEX nombre_provincia_idx
ON Provincia(Provincia);
CREATE INDEX nombre_categoria_idx
ON Categoria(Nombre_Categoria);
CREATE INDEX telefono_cliente_idx
ON Telefono(Telefono_cliente);
CREATE INDEX nombre_articulo_idx
ON Articulo(Nombre_Articulo);

------Pruebas--------
/*Para verificar si una consulta utilizó el índice se debe seguir los siguientes pasos*/
--Agregar la cláusula EXPLAIN PLAN FOR  antes de la ejecución 
EXPLAIN PLAN FOR
SELECT * FROM Provincia
WHERE Provincia = 'Heredia';
--Luego se debe usar DBMS_XPLAN.DISPLAY () para mostrar el plan de ejecución
SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());
--Revisar si la table tiene índices
SELECT  *
FROM all_indexes
WHERE table_name = 'PROVINCIA';

/*Insertar datos*/

INSERT INTO Provincia VALUES(Seq_ID_Provincia.NEXTVAL,'San José');
INSERT INTO Provincia VALUES(Seq_ID_Provincia.NEXTVAL,'Heredia');
INSERT INTO Provincia VALUES(Seq_ID_Provincia.NEXTVAL,'Alajuela');
INSERT INTO Provincia VALUES(Seq_ID_Provincia.NEXTVAL,'Cartago');
INSERT INTO Provincia VALUES(Seq_ID_Provincia.NEXTVAL,'Puntarenas');
INSERT INTO Provincia VALUES(Seq_ID_Provincia.NEXTVAL,'Limón');
INSERT INTO Provincia VALUES(Seq_ID_Provincia.NEXTVAL,'Guanacaste');

INSERT INTO Cliente VALUES(118612525,1,'Te','Chen','Huang','te2525@gmail.com','user01');
INSERT INTO Cliente VALUES(121761212,2,'Maria','Barquero','Perez','maria1212@gmail.com','user02');
INSERT INTO Cliente VALUES(134412313,3,'Wendy','Mora','Mora','wendy2313@gmail.com','user03');

INSERT INTO Categoria VALUES(Seq_Id_Categoria.NEXTVAL,'Cuidado Personal');
INSERT INTO Categoria VALUES(Seq_Id_Categoria.NEXTVAL,'Mascota');
INSERT INTO Categoria VALUES(Seq_Id_Categoria.NEXTVAL,'Hogar');
INSERT INTO Categoria VALUES(Seq_Id_Categoria.NEXTVAL,'Nuestros Productos');

INSERT INTO Telefono VALUES(118612525,83592020);
INSERT INTO Telefono VALUES(121761212,89465208);
INSERT INTO Telefono VALUES(134412313,82056525);

INSERT INTO Articulo VALUES(Seq_Id_Articulo.NEXTVAL,'Cepillo',2900,0,'Cepillo de Bambú');
INSERT INTO Articulo VALUES(Seq_Id_Articulo.NEXTVAL,'Mascarilla',1900,3,'Mascarilla Natural de Aguacate');
INSERT INTO Articulo VALUES(Seq_Id_Articulo.NEXTVAL,'Desodorante',3900,3,'Desodorante Natural con Vitaminas');
INSERT INTO Articulo VALUES(Seq_Id_Articulo.NEXTVAL,'Vaso Colapsable',5900,3,'Vaso de Plastico Reutilizado');
INSERT INTO Articulo VALUES(Seq_Id_Articulo.NEXTVAL,'Detergente Ecologico',6900,3,'Detergente Natural de Citricos');
INSERT INTO Articulo VALUES(Seq_Id_Articulo.NEXTVAL,'Hueso',5900,3,'Hueso sabor Carne');
INSERT INTO Articulo VALUES(Seq_Id_Articulo.NEXTVAL,'Plato para mascota',7900,3,'Plato de Plastico Reutilizado');

INSERT INTO Articulo_Categoria VALUES(1,1);
INSERT INTO Articulo_Categoria VALUES(1,2);
INSERT INTO Articulo_Categoria VALUES(1,3);
INSERT INTO Articulo_Categoria VALUES(4,4);
INSERT INTO Articulo_Categoria VALUES(3,5);
INSERT INTO Articulo_Categoria VALUES(2,6);
INSERT INTO Articulo_Categoria VALUES(2,7);

INSERT INTO Orden VALUES(Seq_Id_Orden.NEXTVAL,118612525,2,6800,7684,13,0);
INSERT INTO Orden VALUES(Seq_Id_Orden.NEXTVAL,121761212,1,5900,6667,13,0);

INSERT INTO Registro_Orden VALUES(1,1,2900,1);
INSERT INTO Registro_Orden VALUES(3,1,3900,1);
INSERT INTO Registro_Orden VALUES(6,2,5900,1);


/*Esta función sirve para verificar si el usuario ya se ingresó al sistema*/
CREATE OR REPLACE FUNCTION verificar_cuenta(v_correo VARCHAR2,v_contrasena VARCHAR2)
RETURN NUMBER IS contador NUMBER;
BEGIN
    SELECT COUNT(*) INTO contador FROM Cliente
    WHERE Correo_Electronico = v_correo AND Contrasena = v_contrasena;
    RETURN contador;
END;
/

--Devuelve un 1 si esta contraseña corresponde a este usuario,de lo contrario devuelve 0
SELECT verificar_cuenta('maria1212@gmail.com','user02') from dual;


/*Un procedimiento almacenado que tome un conjunto de registros
no normalizados y los inserte en las tablas de su modelo. */
--Drop TABLE Temporal_Datos;
/*Se crea la tabla con un conjunto de registro no normalizados*/
CREATE TABLE Temporal_Datos
    (Cedula NUMBER,
     Nombre VARCHAR2(100),
     Provincia VARCHAR2(100),
     Cuenta VARCHAR2(100),
     Telefono VARCHAR2(100));

--SELECT * FROM Temporal_Datos;    
/*Insertar los datos*/
INSERT INTO Temporal_Datos VALUES(117770345,'Fabio Campo Nuñez','Heredia','Fabio0345@gmail.com,user04','66625252,845213652');
INSERT INTO Temporal_Datos VALUES(116662131,'Juan Sánchez Prieto','Alajuela','Juan2131@gmail.com,user05','66623212,65231874');

/*Esta función retorna el Id_Provincia, si la provincia no existe en la tabla se debe insertarlo primero*/
CREATE OR REPLACE FUNCTION insertar_provincia(name_provincia VARCHAR2)
RETURN NUMBER IS idProvincia NUMBER;
BEGIN 
    SELECT Id_Provincia INTO idProvincia FROM Provincia
    WHERE Provincia = trim(name_provincia);
    
    RETURN (idProvincia);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO Provincia VALUES (Seq_Id_Provincia.NEXTVAL, name_provincia);
        SELECT Id_Provincia INTO idProvincia FROM Provincia 
        WHERE Provincia = trim(name_provincia);
    
        RETURN (idProvincia);
END;
/

/*Esta función retorna la cédula, si el cliente no existe en la tabla se debe insertarlo primero*/
CREATE OR REPLACE FUNCTION insertar_cliente(cedula_cliente NUMBER,id_provincia NUMBER,nombre_cliente VARCHAR2,
                                            primer_apellido_cliente VARCHAR2,segundo_apellido_cliente VARCHAR2,
                                            correo_cliente VARCHAR2,contrasena_cliente VARCHAR2)
RETURN NUMBER IS idCliente NUMBER;
BEGIN 
    SELECT Cedula INTO idCliente FROM Cliente
    WHERE Cedula = cedula_cliente;
    
    RETURN (idCliente);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO Cliente VALUES (cedula_cliente,id_provincia,nombre_cliente,primer_apellido_cliente,segundo_apellido_cliente,correo_cliente,contrasena_cliente);
        SELECT Cedula INTO idCliente FROM Cliente 
        WHERE Cedula = cedula_cliente;
    
        RETURN (idCliente);
END;
/

/*Esta función retorna un valor boolean, se verifica si el teléfon ya está registrado en la tabla*/ 
CREATE OR REPLACE FUNCTION verificar_telefono(id_cliente NUMBER,tel_cliente NUMBER)
RETURN BOOLEAN IS
res NUMBER;
BEGIN
    SELECT COUNT(*) INTO res FROM Telefono
    WHERE Cedula = id_cliente
    AND Telefono_cliente = tel_cliente;
    IF res=0 THEN
        RETURN TRUE;
    ELSE
        RETURN False;
    END IF;
END;
/

/*Procedimiento Principal*/
/*Crear el procedimiento de normalizar_datos*/
CREATE OR REPLACE PROCEDURE normalizar_datos AS
cedula_cliente NUMBER;
telefono_cliente NUMBER(12);
nombre_cliente VARCHAR2(30);
primer_apellido_cliente VARCHAR2(30);
segundo_apellido_cliente VARCHAR2(30);
id_provincia NUMBER;
correo_cliente VARCHAR2(30);
contrasena_cliente VARCHAR2(30);
id_cliente NUMBER;
resultado BOOLEAN;
BEGIN
        FOR cur IN (SELECT * FROM Temporal_Datos)
            LOOP
                cedula_cliente := cur.Cedula;
                nombre_cliente := REGEXP_SUBSTR(cur.Nombre,'^\w+');
                primer_apellido_cliente := SUBSTR(cur.Nombre,INSTR(cur.Nombre,' ', 1)+1,INSTR(cur.Nombre,' ', -1,1) - INSTR(cur.Nombre,' ', 1,1)-1);
                segundo_apellido_cliente := REGEXP_SUBSTR(cur.Nombre,'\w+$'); 
                id_provincia := insertar_provincia(cur.Provincia);
                correo_cliente :=REGEXP_SUBSTR (cur.Cuenta, '[^,]+', 1, 1);
                contrasena_cliente :=REGEXP_SUBSTR (cur.Cuenta, '[^,]+', 1, 2);
                id_cliente := insertar_cliente(cedula_cliente,id_provincia,nombre_cliente,primer_apellido_cliente,segundo_apellido_cliente,correo_cliente,contrasena_cliente);                
                FOR tel IN (SELECT regexp_substr(cur.Telefono, '[^,]+', 1, level) AS tele
                          FROM Dual
                        CONNECT BY regexp_substr(cur.Telefono,'[^,]+', 1, level) IS NOT NULL)
                    LOOP    
                        resultado:=verificar_telefono(id_cliente,TO_NUMBER(tel.tele));
                        IF resultado = True THEN
                            INSERT INTO Telefono VALUES (id_cliente,TO_NUMBER(tel.tele));
                        END IF;
                    END LOOP;
            END LOOP;
END;
/

/*Llamar al procedimiento de normalizar datos*/
BEGIN
normalizar_datos; 
END;
/

/* Se crear el trigger */
--DROP TABLE Historial;
--SELECT * FROM Historial;
/*Se crea la tabla historial para el trigger*/
CREATE TABLE Historial
    (Id_registro NUMBER,
    Accion VARCHAR2(30),
    Fecha  DATE,
    Usuario VARCHAR2(30),
    Nombre_Tabla VARCHAR2(30),
    Datos_anteriores VARCHAR2(300),
    Datos_nuevos  VARCHAR2(300));

/*Se crea el trigger */    
CREATE OR REPLACE TRIGGER ti_orden
    BEFORE INSERT OR UPDATE OF Id_orden,Cedula,Cantidad_Total,Subtotal,Total,Impuesto,Descuento OR DELETE
    ON Orden
    FOR EACH ROW
    DECLARE 
        v_accion VARCHAR2(8);
        lista_datosV VARCHAR2(100); --Se almacenan los datos viejos
        lista_datosN VARCHAR2(100); --Se almacenan los datos nuevos
    BEGIN
        IF inserting THEN
            v_accion := 'INSERT';
            lista_datosN  := :NEW.Id_orden || ',' ||:NEW.Cedula || ',' || :NEW.Cantidad_Total || ',' ||:NEW.Subtotal || ',' ||:NEW.Total || ',' ||:NEW.Impuesto || ',' ||:NEW.Descuento;
        ELSIF updating THEN
            v_accion := 'UPDATE';
            lista_datosV  := :OLD.Id_orden || ',' ||:OLD.Cedula || ',' || :OLD.Cantidad_Total || ',' ||:OLD.Subtotal || ',' ||:OLD.Total || ',' ||:OLD.Impuesto || ',' ||:OLD.Descuento;
            lista_datosN  := :NEW.Id_orden || ',' ||:NEW.Cedula || ',' || :NEW.Cantidad_Total || ',' ||:NEW.Subtotal || ',' ||:NEW.Total || ',' ||:NEW.Impuesto || ',' ||:NEW.Descuento;
        ELSE
            v_accion := 'DELETE';
            lista_datosV  := :OLD.Id_orden || ',' ||:OLD.Cedula || ',' || :OLD.Cantidad_Total || ',' ||:OLD.Subtotal || ',' ||:OLD.Total || ',' ||:OLD.Impuesto || ',' ||:OLD.Descuento;
        END IF; 
       
        INSERT INTO Historial 
            VALUES (Seq_Id_registro.NEXTVAL,v_accion,SYSDATE,USER,'Orden',lista_datosV,lista_datosN);
    END;
/

SELECT Id_Registro,Accion,to_char(SYSDATE, 'dd-mm-yy hh24:mi:ss ') Feche_Hora,Usuario,Nombre_tabla,Datos_anteriores,datos_nuevos FROM Historial;

--SELECT * FROM ORDEN;
--SELECT * FROM Cliente;
--SELECT * FROM Registro_orden;
 
--Para probar Trigger, los números pueden cambiar segun los datos que existan en cada tabla                        
INSERT INTO Orden VALUES(Seq_Id_Orden.NEXTVAL,134412313,2,6800,7684,13,0);

DELETE FROM Orden where Id_Orden = 3;

SELECT * FROM orden;
UPDATE orden 
SET descuento = 1
WHERE id_orden = 2;

CREATE OR REPLACE TRIGGER ti_telefono
    BEFORE INSERT OR UPDATE OF Cedula,Telefono_cliente OR DELETE
    ON Telefono
    FOR EACH ROW
    DECLARE 
        v_accion VARCHAR2(8);
        lista_datosV VARCHAR2(100); --Se almacenan los datos viejos
        lista_datosN VARCHAR2(100); --Se almacenan los datos nuevos
    BEGIN
        IF inserting THEN
            v_accion := 'INSERT';
            lista_datosN  := :NEW.Cedula || ',' ||:NEW.Telefono_cliente;
        ELSIF updating THEN
            v_accion := 'UPDATE';
            lista_datosV  := :OLD.Cedula || ',' ||:OLD.Telefono_cliente;
            lista_datosN  := :NEW.Cedula || ',' ||:NEW.Telefono_cliente;
        ELSE
            v_accion := 'DELETE';
            lista_datosV  := :OLD.Cedula || ',' ||:OLD.Telefono_cliente;
        END IF; 
       
        INSERT INTO Historial 
            VALUES (Seq_Id_registro.NEXTVAL,v_accion,SYSDATE,USER,'Telefono',lista_datosV,lista_datosN);
    END;
/

--------PROBAR TRIGGER------------------------
INSERT INTO telefono values(118612525,22931679);
DELETE FROM Telefono where  Telefono_cliente= 22931679;

CREATE OR REPLACE TRIGGER ti_categoria
    BEFORE INSERT OR UPDATE OF Id_categoria,Nombre_categoria OR DELETE
    ON Categoria
    FOR EACH ROW
    DECLARE 
        v_accion VARCHAR2(8);
        lista_datosV VARCHAR2(100); --Se almacenan los datos viejos
        lista_datosN VARCHAR2(100); --Se almacenan los datos nuevos
    BEGIN
        IF inserting THEN
            v_accion := 'INSERT';
            lista_datosN  := :NEW.Id_categoria || ',' ||:NEW.Nombre_categoria;
        ELSIF updating THEN
            v_accion := 'UPDATE';
            lista_datosV  := :OLD.Id_categoria || ',' ||:OLD.Nombre_categoria;
            lista_datosN  := :NEW.Id_categoria || ',' ||:NEW.Nombre_categoria;
        ELSE
            v_accion := 'DELETE';
            lista_datosV  := :OLD.Id_categoria || ',' ||:OLD.Nombre_categoria;
        END IF; 
       
        INSERT INTO Historial 
            VALUES (Seq_Id_registro.NEXTVAL,v_accion,SYSDATE,USER,'Categoria',lista_datosV,lista_datosN);
    END;
/

------PRUEBA TRIGGER-------------------------
INSERT INTO Categoria VALUES(Seq_Id_Categoria.NEXTVAL,'Pymes');
DELETE FROM Categoria WHERE id_Categoria = 5;

UPDATE Categoria
SET nombre_categoria = 'Pymes2'
WHERE id_categoria = 5;


CREATE OR REPLACE TRIGGER ti_registro_orden
    BEFORE INSERT OR UPDATE OF Id_articulo,Id_Orden,Precio_venta,Cantidad OR DELETE
    ON Registro_orden
    FOR EACH ROW
    DECLARE 
        v_accion VARCHAR2(8);
        lista_datosV VARCHAR2(100); --Se almacenan los datos viejos
        lista_datosN VARCHAR2(100); --Se almacenan los datos nuevos
    BEGIN
        IF inserting THEN
            v_accion := 'INSERT';
            lista_datosN  := :NEW.Id_articulo || ',' ||:NEW.Id_Orden || ',' ||:NEW.Precio_venta || ',' ||:NEW.Cantidad;
        ELSIF updating THEN
            v_accion := 'UPDATE';
            lista_datosV  := :OLD.Id_articulo || ',' ||:OLD.Id_Orden || ',' ||:OLD.Precio_venta || ',' ||:OLD.Cantidad;
            lista_datosN  := :NEW.Id_articulo || ',' ||:NEW.Id_Orden || ',' ||:NEW.Precio_venta || ',' ||:NEW.Cantidad;
        ELSE
            v_accion := 'DELETE';
            lista_datosV  := :OLD.Id_articulo || ',' ||:OLD.Id_Orden || ',' ||:OLD.Precio_venta || ',' ||:OLD.Cantidad;
        END IF; 
       
        INSERT INTO Historial 
            VALUES (Seq_Id_registro.NEXTVAL,v_accion,SYSDATE,USER,'Registro_orden',lista_datosV,lista_datosN);
    END;
/

CREATE OR REPLACE TRIGGER ti_articulo
    BEFORE INSERT OR UPDATE OF Id_articulo,Nombre_articulo,Precio_unitario,Cantidad_disponible,Descripcion OR DELETE
    ON Articulo
    FOR EACH ROW
    DECLARE 
        v_accion VARCHAR2(8);
        lista_datosV VARCHAR2(100); --Se almacenan los datos viejos
        lista_datosN VARCHAR2(100); --Se almacenan los datos nuevos
    BEGIN
        IF inserting THEN
            v_accion := 'INSERT';
            lista_datosN  := :NEW.Id_articulo || ',' ||:NEW.Nombre_articulo || ',' ||:NEW.Precio_unitario || ',' ||:NEW.Cantidad_disponible || ',' ||:NEW.Descripcion;
        ELSIF updating THEN
            v_accion := 'UPDATE';
            lista_datosV  := :OLD.Id_articulo || ',' ||:OLD.Nombre_articulo || ',' ||:OLD.Precio_unitario || ',' ||:OLD.Cantidad_disponible || ',' ||:OLD.Descripcion;
            lista_datosN  := :NEW.Id_articulo || ',' ||:NEW.Nombre_articulo || ',' ||:NEW.Precio_unitario || ',' ||:NEW.Cantidad_disponible || ',' ||:NEW.Descripcion;
        ELSE
            v_accion := 'DELETE';
            lista_datosV  := :OLD.Id_articulo || ',' ||:OLD.Nombre_articulo || ',' ||:OLD.Precio_unitario || ',' ||:OLD.Cantidad_disponible || ',' ||:OLD.Descripcion;
        END IF; 
       
        INSERT INTO Historial 
            VALUES (Seq_Id_registro.NEXTVAL,v_accion,SYSDATE,USER,'Articulo',lista_datosV,lista_datosN);
    END;
/

-----PRUEBA DE TRIGGER--------------------
INSERT INTO Articulo VALUES(Seq_Id_Articulo.NEXTVAL,'Cama de Perro',2900,3,'Cama de Algodón');
UPDATE Articulo
SET Cantidad_disponible = 4
WHERE id_articulo = 8;
DELETE FROM Articulo where id_articulo = 8;

CREATE OR REPLACE TRIGGER ti_cliente
    BEFORE INSERT OR UPDATE OF Cedula,Id_provincia,Nombre,Primer_apellido,Segundo_apellido,Correo_electronico,Contrasena OR DELETE
    ON Cliente
    FOR EACH ROW
    DECLARE 
        v_accion VARCHAR2(8);
        lista_datosV VARCHAR2(100); --Se almacenan los datos viejos
        lista_datosN VARCHAR2(100); --Se almacenan los datos nuevos
    BEGIN
        IF inserting THEN
            v_accion := 'INSERT';
            lista_datosN  := :NEW.Cedula || ',' || :NEW.Id_provincia || ',' ||:NEW.Nombre || ',' ||:NEW.Primer_apellido || ',' 
                             || :NEW.Segundo_apellido || ',' ||:NEW.Correo_electronico || ',' ||:NEW.Contrasena;
        ELSIF updating THEN
            v_accion := 'UPDATE';
            lista_datosV  := :OLD.Cedula || ',' || :OLD.Id_provincia || ',' ||:OLD.Nombre || ',' ||:OLD.Primer_apellido || ',' 
                             || :OLD.Segundo_apellido || ',' ||:OLD.Correo_electronico || ',' ||:OLD.Contrasena;
            lista_datosN  := :NEW.Cedula || ',' || :NEW.Id_provincia || ',' ||:NEW.Nombre || ',' ||:NEW.Primer_apellido || ',' 
                             || :NEW.Segundo_apellido || ',' ||:NEW.Correo_electronico || ',' ||:NEW.Contrasena;
        ELSE
            v_accion := 'DELETE';
            lista_datosV  := :OLD.Cedula || ',' || :OLD.Id_provincia || ',' ||:OLD.Nombre || ',' ||:OLD.Primer_apellido || ',' 
                             || :OLD.Segundo_apellido || ',' ||:OLD.Correo_electronico || ',' ||:OLD.Contrasena;
        END IF; 
       
        INSERT INTO Historial 
            VALUES (Seq_Id_registro.NEXTVAL,v_accion,SYSDATE,USER,'Cliente',lista_datosV,lista_datosN);
    END;
/

-----------PRUEBA TRIGGER--------------
insert into cliente values(125005552,1,'Juana','Ramirez','Madrigal','juana@gmail.com','user06');
UPDATE Cliente
SET correo_electronico = 'juana01@gmail.com'
WHERE cedula = 125005552;
DELETE FROM Cliente where cedula =125005552;

CREATE OR REPLACE TRIGGER ti_provincia
    BEFORE INSERT OR UPDATE OF Id_provincia,Provincia OR DELETE
    ON Provincia
    FOR EACH ROW
    DECLARE 
        v_accion VARCHAR2(8);
        lista_datosV VARCHAR2(100); --Se almacenan los datos viejos
        lista_datosN VARCHAR2(100); --Se almacenan los datos nuevos
    BEGIN
        IF inserting THEN
            v_accion := 'INSERT';
            lista_datosN  := :NEW.Id_provincia || ',' || :NEW.Provincia;
        ELSIF updating THEN
            v_accion := 'UPDATE';
            lista_datosV  := :OLD.Id_provincia || ',' || :OLD.Provincia;
            lista_datosN  := :NEW.Id_provincia || ',' || :NEW.Provincia;
        ELSE
            v_accion := 'DELETE';
            lista_datosV  := :OLD.Id_provincia || ',' || :OLD.Provincia;
        END IF; 
       
        INSERT INTO Historial 
            VALUES (Seq_Id_registro.NEXTVAL,v_accion,SYSDATE,USER,'Provincia',lista_datosV,lista_datosN);
    END;
/

INSERT INTO Provincia VALUES(Seq_ID_Provincia.NEXTVAL,'NUEVA');
UPDATE Provincia
SET Provincia = 'Nueva2'
WHERE Id_provincia= 8;
DELETE FROM Provincia WHERE Id_provincia= 8;

/*Función que sirve para insertar un registro en la tabla de registro_orden */
CREATE OR REPLACE PROCEDURE insertar_registro(Id_Art NUMBER,v_Cedula NUMBER)    
  AS 
  Precio NUMBER;
  v_id_orden NUMBER;
  validacion NUMBER;
  
  BEGIN 
     SELECT precio_unitario INTO Precio FROM Articulo WHERE Id_Articulo = Id_Art;
     SELECT Id_orden INTO v_id_orden FROM orden WHERE Cedula = v_cedula;
     SELECT cantidad INTO validacion FROM registro_orden  WHERE id_articulo =Id_Art and id_orden=v_id_orden;
     
     IF validacion > 0 THEN
         UPDATE Registro_Orden 
         SET cantidad = cantidad + 1
         WHERE id_articulo =Id_Art and id_orden=v_id_orden;         
     END IF;
     
EXCEPTION 
    WHEN no_data_found THEN 
         INSERT INTO Registro_Orden VALUES(Id_Art,v_id_orden,Precio,1);
     
  END;
/

/*Función que sirve para actualizar orden de un cliente, donde actualiza los procesos de esa orden*/
CREATE OR REPLACE PROCEDURE actualizar_orden(Id_Art NUMBER,v_cedula NUMBER)    
  AS 
  v_id_orden NUMBER;
  v_precio_venta NUMBER;
  v_cantidad NUMBER;

BEGIN 
   SELECT Id_orden INTO v_id_orden FROM orden WHERE Cedula = v_cedula;
  
   SELECT precio_venta INTO v_precio_venta FROM registro_orden WHERE id_orden = v_id_orden AND id_articulo= Id_Art;
   
   SELECT cantidad INTO v_cantidad FROM registro_orden WHERE id_orden = v_id_orden AND id_articulo= Id_Art;
   
   UPDATE Orden 
   SET Cantidad_total = Cantidad_total + v_cantidad 
   WHERE id_orden = v_id_orden;
   
   UPDATE Orden 
   SET Subtotal = Subtotal + (v_precio_venta * v_cantidad)
   WHERE id_orden = v_id_orden;
   
   UPDATE Orden 
   SET Total = Subtotal * 1.13
   WHERE id_orden = v_id_orden;
   
END;
/

/*Función que sirve para eliminar datos de carrito */
CREATE OR REPLACE PROCEDURE eliminar_de_carrito(Id_Art NUMBER,v_cedula NUMBER)
     AS 
      v_id_orden NUMBER;
      v_precio_venta NUMBER;
      v_cantidad NUMBER;

BEGIN 
   SELECT Id_orden INTO v_id_orden FROM orden WHERE Cedula = v_cedula;
  
   SELECT precio_venta INTO v_precio_venta FROM registro_orden WHERE id_orden = v_id_orden AND id_articulo= Id_Art;
   
   SELECT cantidad INTO v_cantidad FROM registro_orden WHERE id_orden = v_id_orden AND id_articulo= Id_Art;
   
   UPDATE Orden 
   SET Cantidad_total = Cantidad_total - v_cantidad 
   WHERE id_orden = v_id_orden;
   
   UPDATE Orden 
   SET Subtotal = Subtotal - (v_precio_venta * v_cantidad)
   WHERE id_orden = v_id_orden;
   
   UPDATE Orden 
   SET Total = Subtotal * 1.13
   WHERE id_orden = v_id_orden;

   DELETE FROM registro_orden WHERE id_articulo =Id_Art and id_orden=v_id_orden;

END;
/

/*Se crea la tabla de cliente_estado*/
CREATE TABLE Cliente_Estado(
    Cedula NUMBER(15),
    Nombre VARCHAR2(30),
    Estado NUMBER(2));


/* 1 iniciar - 2 salir*/
/*Esta función sirve para verificar el estado de sesión*/
CREATE OR REPLACE PROCEDURE estado_sesion(correo VARCHAR2,contrasena VARCHAR2,estado NUMBER)    
  AS 
  t_cedula NUMBER;
  t_nombre VARCHAR2(30);
  cantidad NUMBER;
  BEGIN 
     SELECT Cedula INTO t_cedula FROM Cliente WHERE Correo_Electronico = correo AND Contrasena= contrasena;
     SELECT Nombre INTO t_nombre FROM Cliente WHERE Correo_Electronico = correo AND Contrasena= contrasena;   
     SELECT COUNT(*) INTO cantidad FROM Cliente_Estado
         WHERE Cedula = t_cedula;            
    IF estado = 2 AND cantidad = 1 THEN  
        DELETE FROM Cliente_Estado WHERE Cedula = t_cedula;
    END IF;    
    IF cantidad = 0 AND estado = 1 THEN
        INSERT INTO Cliente_Estado VALUES(t_cedula,t_nombre,1);
    END IF;
  END;
/
--Pruebas--
--EXECUTE estado_sesion('te2525@gmail.com','user01',1);
--EXECUTE cambiar_estado('te2525@gmail.com','user01');
--SELECT * FROM  Cliente_Estado;
--DROP TABLE Cliente_Estado;
--SELECT * FROM cliente;
--DELETE Cliente_Estado;

/*Esta función sirve para verificar el estado de sesión,retorna 1 si está activo y 0 inactivo*/
CREATE OR REPLACE FUNCTION verificar_estado
RETURN NUMBER IS
res NUMBER;
BEGIN
    SELECT COUNT(*) INTO res FROM Cliente_Estado;
    RETURN res;
END;
/

--SELECT * FROM Cliente_Estado;
--DELETE FROM Cliente_Estado;
--select * from categoria;
--SELECT * FROM Articulo_Categoria;

--Select utilizado para dividir los productos en categorias 
SELECT a.Id_Articulo,a.Nombre_Articulo,a.Precio_Unitario,Cantidad_Disponible,a.Descripcion from Articulo a
INNER JOIN Articulo_Categoria ac
ON ac.Id_Articulo = a.Id_Articulo
WHERE ac.Id_Categoria =4;    

SELECT * FROM Orden;
SELECT * FROM articulo; 
SELECT * FROM registro_orden;

CREATE OR REPLACE PROCEDURE realizar_pago(v_cedula NUMBER)    
  AS 
  CURSOR c1 IS 
      SELECT id_articulo,id_orden,cantidad FROM registro_orden 
      WHERE id_orden = (SELECT Id_orden FROM orden WHERE Cedula = v_cedula);
BEGIN 
   FOR item IN c1
   LOOP 
       UPDATE Orden 
       SET Cantidad_total = 0
       WHERE id_orden = item.id_orden;
       
       UPDATE Orden 
       SET Subtotal = 0
       WHERE id_orden = item.id_orden;
       
       UPDATE Orden 
       SET Total = 0
       WHERE id_orden = item.id_orden;
       
       UPDATE Articulo
       SET Cantidad_disponible = Cantidad_disponible - item.cantidad
       WHERE Id_articulo = item.id_articulo;
       
       END LOOP;
END;
/

--Para probarlo ------
EXECUTE realizar_pago(118612525);

--Verifica la cantidad de articulos disponibles en la tienda
CREATE OR REPLACE FUNCTION verificar_cantidad(v_id_articulo NUMBER)
RETURN NUMBER IS
res NUMBER;
BEGIN
    SELECT COUNT(*) INTO res FROM Articulo WHERE Id_Articulo = v_id_articulo
                                            AND Cantidad_Disponible > 0;
    RETURN res;
END;
/
SELECT verificar_cantidad(2) from dual;
     

