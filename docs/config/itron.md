## El medidor



## Documentos

- [Doc con los Obis](assets/docs/pub_logicaldevice535obissl761dec8-09pdf.pdf)



## Lectura de profiles


Objetivos:

- [ ] Leer todos los profiles cargados en el medidor, calcular el tiempo de cada profile y publicarlos en thingsboard.
	- NO hay que pedir por rangos de días
	- NO hay que hacer configurables todos los obis hardoce


### Limitaciones

Al consultar una lista de profiles, el arreglo con las respuesta de cada profile no llega con la fecha.

En la lectura de perfiles por rango lo que llega es una lista de perfiles, se espera que sean 96 por día. 
Pero esta respuesta tiene las siguientes características

- No todos los perfiles tienen llegan con la fecha en la que se leyo (este valor hay que calcularlo)
- Cada tanto, llega un perfil con una fecha, esto indica que los valores que le siguen corresponden a ese día.
- Como no se recibe un horario, se asume que los profiles comienzan a las 00:00:00 del día.


Teniendo en cuenta el log del ejemplo, los perfiles leídos corresponden al día 3/17/20, y son de ese día hasta que se recibe un perfil con el campo de fecha != null, en el ejemplo cambia la fecha a 3/18/20.

ref: https://www.gurux.fi/node/5948

::: details Log de ejemplo

```
[77755444]  Profile day detected: 0.0.96.56.1.255 -> 3/17/20
[77755444]		-> 1.1.32.27.0.255 = 37
[77755444]		-> 1.1.52.27.0.255 = 2278
[77755444]		-> 1.1.72.27.0.255 = 2243
[77755444]		-> 1.1.31.27.0.255 = 0
[77755444]		-> 1.1.51.27.0.255 = 211
[77755444]		-> 1.1.71.27.0.255 = 11
[77755444]		-> 1.1.32.27.0.255 = 37
[77755444]		-> 1.1.52.27.0.255 = 2283
[77755444]		-> 1.1.72.27.0.255 = 2247
[77755444]		-> 1.1.31.27.0.255 = 0
..... (valores)
[77755444]		-> 1.1.51.27.0.255 = 210
[77755444]		-> 1.1.71.27.0.255 = 11
[77755444]		-> 1.1.32.27.0.255 = 37
[77755444]		-> 1.1.52.27.0.255 = 2283
[77755444]		-> 1.1.72.27.0.255 = 2238
[77755444]		-> 1.1.31.27.0.255 = 0
[77755444]		-> 1.1.51.27.0.255 = 211
[77755444]		-> 1.1.71.27.0.255 = 11
[77755444]		-> 1.1.32.27.0.255 = 37
[77755444]		-> 1.1.52.27.0.255 = 2265
[77755444]		-> 1.1.72.27.0.255 = 2227
[77755444]		-> 1.1.31.27.0.255 = 0
[77755444]		-> 1.1.51.27.0.255 = 212
[77755444]		-> 1.1.71.27.0.255 = 11
[77755444]  Profile day detected: 0.0.96.56.1.255 -> 3/18/20
```
:::


### Profiles: Consulta por rango



AcePilot

```xml
<GetRequest>
  <GetRequestNormal>
    <!--Priority: NORMAL ServiceClass: CONFIRMED invokeID: 1-->
    <InvokeIdAndPriority Value="65" />
    <AttributeDescriptor>
      <!--PROFILE_GENERIC-->
      <ClassId Value="7" />
      <!--0.0.99.1.0.255-->
      <InstanceId Value="0000630100FF" />
      <AttributeId Value="2" />
    </AttributeDescriptor>
    <AccessSelection>
      <AccessSelector Value="1" />
      <AccessParameters>
        <Structure Qty="4" >
          <None />
          <!--2020-03-31 00:00:00-->
          <OctetString Value="07E4031F0200000000800000" />
          <!--2020-04-02 00:00:00-->
          <OctetString Value="07E404020400000000800000" />
          <Array Qty="0" >
          </Array>
        </Structure>
      </AccessParameters>
    </AccessSelection>
  </GetRequestNormal>
</GetRequest>
```



Gateway

```xml
<GetRequest>
  <GetRequestNormal>
    <!--Priority: HIGH ServiceClass: CONFIRMED invokeID: 1-->
    <InvokeIdAndPriority Value="193" />
    <AttributeDescriptor>
      <!--PROFILE_GENERIC-->
      <ClassId Value="7" />
      <!--0.0.99.1.0.255-->
      <InstanceId Value="0000630100FF" />
      <AttributeId Value="3" />
    </AttributeDescriptor>
  </GetRequestNormal>
</GetRequest>
```
