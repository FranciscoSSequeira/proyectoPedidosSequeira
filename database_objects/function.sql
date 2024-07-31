-- Función para contar los pedidos de un cliente en un intervalo de tiempo

USE PROYECTO_PEDIDOS;

DROP FUNCTION IF EXISTS contar_pedidos_cliente;

DELIMITER //

CREATE FUNCTION contar_pedidos_cliente(cliente_id INT, fecha_inicio DATETIME, fecha_fin DATETIME) RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE pedidos_count INT;

    SELECT COUNT(*) INTO pedidos_count
    FROM PEDIDO
    WHERE IDCLIENTE = cliente_id
    AND FECHA >= fecha_inicio
    AND FECHA <= fecha_fin;

    RETURN pedidos_count;
END //

DELIMITER ;
