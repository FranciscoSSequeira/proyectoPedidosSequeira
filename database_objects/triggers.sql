-- Trigger para verificar si el correo electrónico de un cliente es único al insertar un nuevo cliente

USE PROYECTO_PEDIDOS;

DELIMITER //

CREATE TRIGGER before_insert_cliente_trigger
BEFORE INSERT ON CLIENTE
FOR EACH ROW
BEGIN
    DECLARE email_count INT;

    SELECT COUNT(*) INTO email_count
        FROM CLIENTE
    WHERE EMAIL = NEW.EMAIL;

    IF email_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo electrónico ya está en uso.';
    END IF;
END //

DELIMITER ;
