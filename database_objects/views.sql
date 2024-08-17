-- view de cantidad de pedidos por fecha

CREATE VIEW 
	PedidosPorFecha AS
SELECT
    DATE (FECHA) AS Fecha,
    COUNT(*) AS TotalPedidos
FROM
    PEDIDO
GROUP BY
    DATE (FECHA);

-- view pedido por cliente

USE PROYECTO_PEDIDOS;

CREATE VIEW
	PedidoPorCliente AS
SELECT
	IDCLIENTE AS Cliente,
    COUNT(*) AS TotalPedidoPorCliente
FROM
	PEDIDO
GROUP BY
	IDCLIENTE;
