create DATABASE proyectodiseño;
use proyectodiseño;

select * from dim_clientes;
select * from ventas;
select * from dim_fecha;
select * from dim_paices;
select * from dim_productos;


CREATE TABLE dim_clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    id_pais VARCHAR(100)
);

CREATE TABLE ventas (
    id_factura INT PRIMARY KEY,
    fecha_id DATE,
    id_cliente INT,
    id_pais VARCHAR(100),
    cantidad INT,
    monto DECIMAL(10,2)
);

CREATE TABLE dim_fecha (
    fecha_id INT PRIMARY KEY,
    año INT,
    mes INT,
    dia INT,
    hora TIME
);

CREATE TABLE dim_paices (
    id_pais INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE dim_productos (
    id_categoria VARCHAR(100) PRIMARY KEY,
    nombre VARCHAR(100)
);



INSERT INTO dim_paices (id_pais,nombre) VALUES
(1,'United Kingdom'),
(2,'Germany'),
(3,'EIRE'),
(4,'France'),
(5,'Sweden'),
(6,'Belgium'),
(7,'Italy'),
(8,'Israel'),
(9,'Portugal'),
(10,'Netherlands'),
(11,'Channel Islands'),
(12,'Switzerland'),
(13,'Finland'),
(14,'Spain'),
(15,'Japan');


select * from dim_clientes;
select * from dim_fecha;
select * from dim_paices;
select * from ventas;
select * from dim_productos;



SELECT * from dim_paises;

-- paices que compro mas
SELECT 
    id_pais,
    SUM(monto) AS total_compras
FROM ventas
GROUP BY id_pais
ORDER BY total_compras DESC
LIMIT 5;


-- paices que compro menos
SELECT id_pais, SUM(cantidad) AS total_comprado
FROM ventas
GROUP BY id_pais
ORDER BY total_comprado ASC
LIMIT 5;

-- mayores ventas
SELECT id_cliente, monto
FROM ventas
ORDER BY monto DESC
LIMIT 10;


SELECT id_cliente, SUM(monto) AS total_gastado
FROM ventas
GROUP BY id_cliente
ORDER BY total_gastado ASC
LIMIT 50;


-- cantidad de personas
SELECT 
    id_pais,
    COUNT(DISTINCT id_cliente) AS cantidad_clientes
FROM ventas
GROUP BY id_pais
ORDER BY cantidad_clientes DESC;


-- ¿Qué clientes generan más ingresos?
SELECT 
    id_cliente,
    SUM(monto) AS total_ingresos
FROM ventas
GROUP BY id_cliente
ORDER BY total_ingresos DESC
LIMIT 50;


--

