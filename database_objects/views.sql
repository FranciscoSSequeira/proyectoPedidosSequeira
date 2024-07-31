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