
# Circutor - Análisis del PROTOCOLO

[circutor-tool](https://gitlab.ascentio.com.ar/teleco/epec/tools/circutor-tool)

IEC-870-5-102, son protocolos de la parte eléctrica de Europa
Los medidores son servidores, se pueden conectar por TCP o UDP

Hay documentos que describen el protocolo y tienen una aplicación de python donde realizan el proceso.

Tienen lo que se llaman ASDU: Estructura de los datos de aplicación
Es 1 ASDU por trama


## Autenticación
Para iniciar sesión es necesario primero enviar un mensaje ASDU con identificador 183 (HB7) enviando la clave de acceso.
Ver el doc: definicion-protocolo nortegas

## Palabra de inicio
Las tramas son de largo fijo comienzan en 16 (H10)
Las tramas son de largo variable comienzan con 104(H68)

## Longitud
Incluye el campo de control pero no el checksum

CM: Concentrador de medidas (aplicación)
RM: Registrador de medidas (Medidor)

## Campo de control
CM => RM
1bit RES
1bit PRM
1bit FCB
1bit FCV
4bit Código de función

RM => CM
1bit RES
1bit PRM
1bit ACD
1BIT DFC
4bit Código de función


::: details PRM
Utiliza a nivel aplicación un protocolo Maestro/Esclavo: Maestro sería la aplicación y Esclavo sería el medidor.
0:Esclavo
1: Maestro
::: 

::: details FCB
Por cada mensaje que se envía desde el Maestro se tiene que ir alternando de 0 a 1, si eso se mantiene significa que lo estoy retransmitiendo, en caso nominal deberíamos ver que ese campo va cambiando 0,1,0,1
:::

::: details FCV
Habilita el FCB
:::

::: details ACD 
Por lo que dice la documentación siempre estará en cero.
::: 

::: details DFC
Control de flujo de datos, 0 se aceptan futuros mensajes, 1 overflow.
::: 

::: details Código de Función
Maestro:
0000: reposición del enlace
0011: envío de datos de usuario
1001: solicitud de estado de enlace
1011: solicitud de datos clase 2

Esclavo:
0000: ACK positivo
0001: ACK negativo
1000: Datos de usuario
1001: Datos de usuario no disponibles
1011: estado de enlace o demanda de acceso
:::

## DIrección del contador
Es el ID del contador
Datos de aplicación (ASDU)

## ASDU
Contiene:
ID de unidad de datos

    Identificador de tipo (1B)
    N: Cantidad de objetos de información  (1B)
    Causa de transmisión  (1B)
    Dirección común de ASDU  (3B)

Objeto 1

    Dirección del objeto
    elementos de información
    Etiqueta de tiempo 

Objeto N

    Dirección del objeto
    elementos de información
    Etiqueta de tiempo 

Etiqueta de tiempo común

    ID de tipo (1B)

Indica el tipo de acción o lectura a realizar
de 1 a 127 están definidos, de 128 a 255 son para uso especial

![id tipo 1b.png](../assets/imagenes/id_tipo_1b.png)


    N: Cantidad de objetos de información  (1B)

Numero de objetos que tiene la estructura variable
El primer bit identifica si se envian todas las direcciones de cada objeto o solo la dirección del primero
El protocolo indica que siempre estará en 0
Los otros 7 bits indicarán el numero de objetos: de 0 a 127 objetos.

    Causa de transmisión (1B)

El primer bit indica si es test o nominal
el segundo bit indica si la confirmación es positiva o negativa
los demás 6 bits indican la causa

![causa_transmision_1b.png](../assets/imagenes/causa_transmision_1b.png)


    Dirección común del ASDU

Dirección del punto de medida (2 bytes): Unidad de direccionamiento básico a nivel aplicación. Una clave para cada uno de los puntos de medida.
Opcionalmente podrá tener otras clases para acceso a otros niveles de información.
Por cada vez que se quiere consultar a una dirección diferente, se debe iniciar sesión nuevamente.

Dirección del registro (1byte): todos los registros en los que el contador almacena información
ejemplo: <11> totales integrados por período 1 <21> valores diarios con período

![direccion_comun_ASDU.png](../assets/imagenes/direccion_comun_ASDU.png)


## Objetos de Información

Dirección del objeto (1 byte) - Opcional

Conjunto de Información

Etiqueta de tiempo - Opcional

## Dirección de objeto

![direccion_objeto.png](../assets/imagenes/direccion_objeto.png)


## Agrupaciones. Nuevas direcciones de Objeto
En aras de economizar ASDUs libres, y con el beneficio adicional de racionalizar los objetos que definen a un RM, se han agrupado por ámbito diferentes operativas de explotación, empleando los mismos ASDUs para la petición/lectura/modificación y asignando diferentes Direcciones de Objetos de Información a los diferentes elementos.

![agrupaciones.png](../assets/imagenes/agrupaciones.png)


## Conjunto de Información

### Totales integrados:

Totales integrados :=CP40{energía,cualificador}
Energía (kWh o kVAr) :CP32[1..32]<2,147,483,648..2,147,483,647>
Cualificador :UI8[1..8]<0..255>

### Información de Tarifación:

![informacion_tarifacion.png](../assets/imagenes/informacion_tarifacion.png)

## Etiqueta de tiempo
Puede ser de dos tipos a (5bytes) o b (7bytes) estos 2 bytes extra contienen segundos y milisegundos.

![etiqueta_tiempo.png](../assets/imagenes/etiqueta_tiempo.png)

## Checksum
suma aritmetica, desde el campo de control incluido

## End
H16


