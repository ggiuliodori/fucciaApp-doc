![dep](./assets/imagenes/logo.png)
# Fuccia App

## Registro

    - El sistema permitirá el registro de cualquier usuario.
        - Identificar si es socio o no socio

    - Registro con redes sociales y formulario

::: details Dudas

  - Confirmar qué redes sociales se utilizarán

:::

## Perfiles

### Los usuarios tendrán 2 tipos de perfiles: Socio o No Socio, Afiliado y No afiliado.

#### Socio: 
    - Ver su PLAN, Características, tiempo de duración, cantidad de tratamientos 
        disponibles etc.
    - Ademas podrá realizar un upgrade del plan, renovarlo.
    - Tendrá precios y descuentos especiales en productos,servicios y tratamientos.
    - Podrá gestionar turnos a los diferentes tratamientos de estetica.

#### No socio: 
    - Al registrarse tendrá acceso a ciertas promociones o planes para el incentivo 
        a ser Socio.
    - Tendrá posibilidad de comprar un plan o cualquier producto, servios y/o tratamientos.

::: details Dudas

- Asumimos que Afiliado y No Afiliado es equivalente a Socio y No Socio
- Ver Plan: definir todos los datos e información.
:::

## Login

- Determinara la vista/funcionalidades de cada usuario (dependiendo del perfil).

## Home

- Promociones o información destacada (dependiendo del perfil).

## Notificaciones

### El usuario SOCIO, recibirá notificaciones como:
    - vencimiento del plan
    - nuevas promociones
    - etc

::: details Dudas

- Definir todas las notificaciones.

:::

## Fucsia Plus

### Programa de beneficios
    - El Socio podrá ver sus puntos acumulados
    - Catalogo de beneficios del programa
    - Canjeo de beneficios
    - Historial de movimientos

::: details Dudas

- Está desarrollada la lógica de negocio para ésta funcionalidad? [Ver funcionalidades:exclamation:](./#funcionalidades)

:::

## Tienda Fucsia

- Podrá acceder al ecommerce en donde tendra la posibilidad de comprar productos con descuentos especiales.

::: details Dudas

- Está desarrollada la lógica de negocio para ésta funcionalidad? [Ver funcionalidades:exclamation:](./#funcionalidades)

:::

::: warning 

# Dudas Generales

## Servicios Rest
    - Asumimos que todos los servicios disponibles que tendrá la app 
        se consumiran a través de API REST.
    - Deberíamos tener acceso a un end point por cada uno de los servicios 
        que se ofrecen.

## Funcionalidades  
    - Definir quién estará a cargo del desarrollo de las funcionalidades 
        en caso de no existir.

::: tip
- RECOMENDAMOS QUE TODOS LOS SERVICIO/FUNCIONALIDADES QUE SE DESEAN IMPLEMENTAR EN LA APP, SEAN SERVICIOS REST
:::