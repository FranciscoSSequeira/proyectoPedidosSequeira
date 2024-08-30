###Ecommerce

Problema:
Se crea un sistema de gestion de pedidos de productos para una tienda ecommerce de videojuegos.

Repositorio del Ecommerce al cual se le quiere aplicar esta base de datos : https://github.com/FranciscoSSequeira/Gameplay.git

Descripcion del problema:

1- Gestión de clientes y empleados : se precisa de una base de datos para registrar ambos actores y poder gestionar las acciones que puedan realizar.

2- Gestión de pedidos : Se precisa gestionar los hechos que se puedan realizar en el sector de pedidos. 

3- Gestión de productos : Se precisa un sistema de gestión de los productos y su stock disponible.

4- Gestion de facturas : se precisa un sistema que contenga y emita los datos para su posterior facturación.

## Descripción de la Base de Datos - Gesitión de pedidos de productos por parte de clientes

Esta base de datos está diseñada para gestionar los pedidos de productos por parte de clientes. Tambien gestiona la información relacionada con clientes, productos, empleados y facturación. 
A continuación se detallan los elementos principales de la base de datos:

### Tablas:

1. **PEDIDO**:
   -Almacena información respecto del pedido.
   - Atributos: IDPEDIDO, IDFACTURA, IDCLIENTE, IDJUEGO, IDEMPLEADO, FECHA, NUMEROPEDIDO, PRODUCTO, CANTIDAD, CANCELACION.
     
2. **CLIENTE**:
   - Almacena información sobre los clientes que realizan los pedidos.
   - Atributos: IDCLIENTE, NOMBRE, DNI, EMAIL.
     
3. **EMPLEADO**:
   - Almacena información sobre los empleados que administran los pedidos.
   - Atributos: IDEMPLEADO, NOMBRE.
     
4. **JUEGO**:
   - Almacena información sobre los juegos en venta.
   - Atributos: IDJUEGO, NOMBREJUEGO, PLATAFORMA, GENERO.
     
5. **FACTURA**:
   -Almacena información respecto de la factura hecha de la venta del producto.
   -Atributos: IDFACTURA, IDPEDIDO, NUMEROFACTURA, FECHA.

### Problemática Resuelta:

Esta base de datos permite gestionar eficientemente el proceso de pedidos de productos en la tienda ecommerce. Algunos aspectos que aborda incluyen:

- Registro de clientes y empleados involucrados en el proceso del pedido.
- Gestión de la disponibilidad de productos.
- Registro de los pedidos realizados, incluyendo fecha, cliente, pedido, empleado y factura.

En resumen, esta base de datos proporciona una estructura para organizar y gestionar eficientemente las operaciones de pedidos de productos en la tienda ecommerce, lo que contribuye a mejorar el servicio ofrecido a los clientes y optimizar las operaciones de la tienda.
*/

## PEDIDOS
Descripcion de los tipos de datos

**************************************************
| Tabla         | Columna       | Tipo de dato   |
| ------------- | ------------- | -------------  |
| Pedido        | IDPEDIDO      | INT            |
|               | IDFACTURA     | INT            |
|               | IDCLIENTE     | INT            |
|               | IDJUEGO       | INT            |
|               | IDEMPLEADO    | INT            |
|               | FECHA         | DATETIME       |
|               | NUMEROPEDIDO  | INT            |
|               | PRODUCTO      | INT            |
|               | CANTIDAD      | INT            |
|               | CANCELACION   | DATETIME       |
| ------------- | ------------- | -------------  |
| CLIENTE       | IDCLIENTE     | INT            |
|               | NOMBRE        | VARCHAR(100)   |
|               | DNI           | VARCHAR(20)    |
|               | EMAIL         | VARCHAR(100)   |
| ------------- | ------------- | -------------  |
| EMPLEADO      | IDEMPLEADO    | INT            |
|               | NOMBRE        | VARCHAR(100)   |
| ------------- | ------------- | -------------  |
| JUEGO         | IDJUEGO       | INT            |
|               | NOMBREJUEGO   | VARCHAR(300)   |
|               | PLATAFORMA    | VARCHAR(50)    |
|               | GENERO        | VARCHAR(150)   |
| ------------- | ------------- | -------------  |
| FACTURA       | IDFACTURA     | INT            |
|               | IDPEDIDO      | INT            |
|               | NUMEROFACTURA | VARCHAR(255)   |
|               | FECHA         | VARCHAR(20)    |
**************************************************








![diagramaER2](https://github.com/user-attachments/assets/f3b1a2e8-d120-4603-8aae-39f1cd50c7a2)





