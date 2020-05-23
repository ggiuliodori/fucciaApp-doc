


## Flujo de comunicación

[gráfico donde se pueda ver como se conectan los medidores]

## Documentación


- [ OBIS_Code_Specs.pdf](https://dms.ascentio.com.ar/share/page/site/documentation/document-details?nodeRef=workspace%3A%2F%2FSpacesStore%2F4fc4a8c0-e6f6-45b0-bdf1-87d7e75dc99b)
- [HXF300 User Manual V1.6_20180827.pdf](https://dms.ascentio.com.ar/share/page/site/documentation/document-details?nodeRef=workspace://SpacesStore/42df9feb-e560-4728-b061-03b7c35183b0)
- [10.12_User_manual_of_HXE310CT___CTPT_meter_V2](https://dms.ascentio.com.ar/share/page/site/documentation/document-details?nodeRef=workspace://SpacesStore/de90d5df-8e8b-45d4-b937-760988432a90)

## Modos de lectura

Comandos para activar los modos de lectura:

::: warning 
Se debe actualizar en cada comando la variable `GATEWAY_NAME` con el nombre correspondiente.
:::

- Activar el billing diario
```bash

sudo docker-compose exec ${GATEWAY_NAME} curl -d '{"enableBillingReading":false,"enableBillingDailyReading":true}' -H "Content-Type: application/json" -X POST http://localhost:9090/meters/billing
```

- Activar el billing mensual
```bash
sudo docker-compose exec ${GATEWAY_NAME} curl -d '{"enableBillingReading":true,"enableBillingDailyReading":false}' -H "Content-Type: application/json" -X POST http://localhost:9090/meters/billing
```

- Activar lectura de profiles
```bash
sudo docker-compose exec ${GATEWAY_NAME} curl $RETRY_POLICY -d '{"enableProfilesReading":true}' -H "Content-Type: application/json" -X POST http://localhost:9090/meters/profiles
```

- Activar lectura de eventos
```bash

```

- Activar lectura de instantaneos
```bash

```

## Configuración

Ejemplo del archivo: `dlms-config.json`

::: details Click para ver el contenido
```json
{
  "portNumber": 41000,
  "authenticationPassword": "00000000",
  "readingMode": "LISTENER_READ_ON_DEMAND",
  "readingTimeoutInSeconds": 60,
  "quantityOfReadingRetries": 5,
  "readingTasksPoolSize": 4000,
  "billingConfiguration": {
      "billingCron" : "0 5 3,9,14,19,22,23 1-3 * ?",
      "parentBillingObis" : "0.0.98.1.0.255",
      "parentBillingObisValue" : 3,
      "parentBillingObisAttributeValue" : 7,
      "timeOutMinutes": 120,
      "periods": 1,
      "billingObis": [
        {
          "description": "billing.clock",
          "obis": "0.0.1.0.0.255,2"
        },
        {
          "description": "billing.activa-importada.energia.total",
          "obis": "1.0.1.8.0.255,2"
        },
        {
          "description": "billing.activa-exportada.energia.total",
          "obis": "1.0.2.8.0.255,2"
        },
        {
          "description": "billing.reactiva-q2-exportada.energia.total",
          "obis": "1.0.6.8.0.255,2"
        },
        {
          "description": "billing.reactiva-q3-exportada.energia.total",
          "obis": "1.0.7.8.0.255,2"
        },
        {
          "description": "billing.reactiva-q4-exportada.energia.total",
          "obis": "1.0.8.8.0.255,2"
        },
        {
          "description": "billing.activa-importada.energia.resto",
          "obis": "1.0.1.8.1.255,2"
        },
        {
          "description": "billing.activa-importada.energia.pico",
          "obis": "1.0.1.8.2.255,2"
        },
        {
          "description": "billing.activa-importada.energia.valle",
          "obis": "1.0.1.8.3.255,2"
        },
        {
          "description": "billing.activa-importada.energia.4",
          "obis": "1.0.1.8.4.255,2"
        },
        {
          "description": "billing.reactiva-q1-importada.energia.total",
          "obis": "1.0.5.8.0.255,2"
        },
        {
          "description": "billing.activa-exportada.energia.resto",
          "obis": "1.0.2.8.1.255,2"
        },
        {
          "description": "billing.activa-exportada.energia.pico",
          "obis": "1.0.2.8.2.255,2"
        },
        {
          "description": "billing.activa-exportada.energia.valle",
          "obis": "1.0.2.8.3.255,2"
        },
        {
          "description": "billing.activa-exportada.energia.4",
          "obis": "1.0.2.8.4.255,2"
        },
        {
          "description": "billing.aparente-importada.energia.total",
          "obis": "1.0.9.8.0.255,2"
        },
        {
          "description": "billing.aparente-exportada.energia.total",
          "obis": "1.0.10.8.0.255,2"
        },
        {
          "description": "billing.activa-importada.demanda-maxima.total",
          "obis": "1.0.1.6.0.255,2",
          "scaler": 0.1
        },
        {
          "description": "billing.activa-importada.demanda-maxima.total.timestamp",
          "obis": "1.0.1.6.0.255,5"
        },
        {
          "description": "billing.activa-exportada.demanda-maxima.total",
          "obis": "1.0.2.6.0.255,2",
          "scaler": 0.1
        },
        {
          "description": "billing.activa-exportada.demanda-maxima.total.timestamp",
          "obis": "1.0.2.6.0.255,5"
        },
        {
          "description": "billing.reactiva-importada.demanda-maxima.total",
          "obis": "1.0.3.6.0.255,2",
          "scaler": 0.1
        },
        {
          "description": "billing.reactiva-importada.demanda-maxima.total.timestamp",
          "obis": "1.0.3.6.0.255,5"
        },
        {
          "description": "billing.reactiva-exportada.demanda-maxima.total",
          "obis": "1.0.4.6.0.255,2",
          "scaler": 0.1
        },
        {
          "description": "billing.reactiva-exportada.demanda-maxima.total.timestamp",
          "obis": "1.0.4.6.0.255,5"
        },
        {
          "description": "billing.reactiva-q1-importada.demanda-maxima.total",
          "obis": "1.0.5.6.0.255,2",
          "scaler": 0.1
        },
        {
          "description": "billing.reactiva-q1-importada.demanda-maxima.total.timestamp",
          "obis": "1.0.5.6.0.255,5"
        },
        {
          "description": "billing.reactiva-q3-exportada.demanda-maxima.total",
          "obis": "1.0.7.6.0.255,2",
          "scaler": 0.1
        },
        {
          "description": "billing.reactiva-q3-exportada.demanda-maxima.total.timestamp",
          "obis": "1.0.7.6.0.255,5"
        },
        {
          "description": "billing.activa-importada.demanda-maxima.resto",
          "obis": "1.0.1.6.1.255,2",
          "scaler": 0.1
        },
        {
          "description": "billing.activa-importada.demanda-maxima.pico",
          "obis": "1.0.1.6.2.255,2",
          "scaler": 0.1
        },
        {
          "description": "billing.activa-importada.demanda-maxima.valle",
          "obis": "1.0.1.6.3.255,2",
          "scaler": 0.1
        },
        {
          "description": "billing.activa-importada.demanda-maxima.resto.timestamp",
          "obis": "1.0.1.6.1.255,5"
        },
        {
          "description": "billing.activa-importada.demanda-maxima.pico.timestamp",
          "obis": "1.0.1.6.2.255,5"
        },
        {
          "description": "billing.activa-importada.demanda-maxima.valle.timestamp",
          "obis": "1.0.1.6.3.255,5"
        },
        {
          "description": "billing.activa-exportada.demanda-maxima.resto",
          "obis": "1.0.2.6.1.255,2",
          "scaler": 0.1
        },
        {
          "description": "billing.activa-exportada.demanda-maxima.pico",
          "obis": "1.0.2.6.2.255,2",
          "scaler": 0.1
        },
        {
          "description": "billing.activa-exportada.demanda-maxima.valle",
          "obis": "1.0.2.6.3.255,2",
          "scaler": 0.1
        },
        {
          "description": "billing.activa-exportada.demanda-maxima.resto.timestamp",
          "obis": "1.0.2.6.1.255,5"
        },
        {
          "description": "billing.activa-exportada.demanda-maxima.valle.timestamp",
          "obis": "1.0.2.6.3.255,5"
        }
      ]
    },
   "profilesConfiguration": [
      {
          "parentProfileObis" : "1.0.99.1.0.255",
          "parentProfileObisValue" : 3,
          "parentProfileObisAttributeValue" : 7,
          "profileObis": [
            {
              "description": "profile1.clock",
              "obis": "0.0.1.0.0.255,2"
            },
            {
              "description": "profile1.status",
              "obis": "0.0.96.10.1.255,2"
            },
            {
              "description": "profile1.activa-importada.energia-acumulada.total",
              "obis": "1.0.1.29.0.255,2"
            },
            {
              "description": "profile1.reactiva-q1-importada.energia-acumulada.total",
              "obis": "1.0.5.29.0.255,2"
            },
            {
              "description": "profile1.reactiva-q2-importada.energia-acumulada.total",
              "obis": "1.0.6.29.0.255,2"
            },
            {
              "description": "profile1.reactiva-q3-importada.energia-acumulada.total",
              "obis": "1.0.7.29.0.255,2"
            },
            {
              "description": "profile1.reactiva-q4-importada.energia-acumulada.total",
              "obis": "1.0.8.29.0.255,2"
            },
            {
              "description": "profile1.activa-exportada.energia-acumulada.total",
              "obis": "1.0.2.29.0.255,2"
            },
            {
              "description": "profile1.factor-potencia.last-average-value.total",
              "obis": "1.0.13.25.0.255,2",
              "scaler": 0.001
            },
            {
              "description": "profile1.frecuencia.last-average-value.total",
              "obis": "1.0.14.25.0.255,2",
              "scaler": 0.01
            }
          ]
      },
      {
          "parentProfileObis" : "1.0.99.128.0.255",
          "parentProfileObisValue" : 3,
          "parentProfileObisAttributeValue" : 7,
          "profileObis": [
            {
              "description": "profile2.clock",
              "obis": "0.0.1.0.0.255,2"
            },
            {
              "description": "profile2.status",
              "obis": "0.0.96.10.131.255,2"
            },
            {
              "description": "profile2.voltage-l1.last-average-value.total",
              "obis": "1.0.32.25.0.255,2",
              "scaler": 0.1
            },
            {
              "description": "profile2.voltage-l2.last-average-value.total",
              "obis": "1.0.52.25.0.255,2",
              "scaler": 0.1
            },
            {
              "description": "profile2.voltage-l3.last-average-value.total",
              "obis": "1.0.72.25.0.255,2",
              "scaler": 0.1
            },
            {
              "description": "profile2.corriente-l1.last-average-value.total",
              "obis": "1.0.31.25.0.255,2",
              "scaler": 0.01
            },
            {
              "description": "profile2.corriente-l2.last-average-value.total",
              "obis": "1.0.51.25.0.255,2",
              "scaler": 0.01
            },
            {
              "description": "profile2.corriente-l3.last-average-value.total",
              "obis": "1.0.71.25.0.255,2",
              "scaler": 0.01
            }
          ]
      }
   ],
  "eventsConfiguration": [
    {
      "parentEventObis": "0.0.99.98.0.255",
      "parentEventObisValue": 3,
      "parentEventObisAttributeValue": 7,
      "eventObis": [
        {
          "description": "events.standard-event.clock",
          "obis": "0.0.1.0.0.255,2"
        },
        {
          "description": "events.standard-event.value",
          "obis": "0.0.96.11.0.255,2"
        }
      ]
    },
    {
      "parentEventObis": "0.0.99.98.1.255",
      "parentEventObisValue": 3,
      "parentEventObisAttributeValue": 7,
      "eventObis": [
        {
          "description": "events.fraud-detection-event.clock",
          "obis": "0.0.1.0.0.255,2"
        },
        {
          "description": "events.fraud-detection-event.value",
          "obis": "0.0.96.11.1.255,2"
        }
      ]
    },
    {
      "parentEventObis": "0.0.99.98.2.255",
      "parentEventObisValue": 3,
      "parentEventObisAttributeValue": 7,
      "eventObis": [
        {
          "description": "events.disconnector-control-event.clock",
          "obis": "0.0.1.0.0.255,2"
        },
        {
          "description": "events.disconnector-control-event.value",
          "obis": "0.0.96.11.2.255,2"
        }
      ]
    },
    {
      "parentEventObis": "0.0.99.98.4.255",
      "parentEventObisValue": 3,
      "parentEventObisAttributeValue": 7,
      "eventObis": [
        {
          "description": "events.power-quality-event.clock",
          "obis": "0.0.1.0.0.255,2"
        },
        {
          "description": "events.power-quality-event.value",
          "obis": "0.0.96.11.4.255,2"
        }
      ]
    },
    {
      "parentEventObis": "0.0.99.98.5.255",
      "parentEventObisValue": 3,
      "parentEventObisAttributeValue": 7,
      "eventObis": [
        {
          "description": "events.communication-event.clock",
          "obis": "0.0.1.0.0.255,2"
        },
        {
          "description": "events.communication-event.value",
          "obis": "0.0.96.11.5.255,2"
        }
      ]
    }
  ],
  "instantaneousConfiguration":
  {
    "instantaneousObis": [
      {
        "description": "instantaneous.voltage.L1",
        "obis": "1.0.32.7.0.255"
      },
      {
        "description": "instantaneous.voltage.L2",
        "obis": "1.0.52.7.0.255"
      },
      {
        "description": "instantaneous.voltage.L3",
        "obis": "1.0.72.7.0.255"
      },
      {
        "description": "instantaneous.current.LO.(neutral)",
        "obis": "1.0.91.7.0.255"
      },
      {
        "description": "instantaneous.current.L1",
        "obis": "1.0.31.7.0.255"
      },
      {
        "description": "instantaneous.current.L2",
        "obis": "1.0.51.7.0.255"
      },
      {
        "description": "instantaneous.current.L3",
        "obis": "1.0.71.7.0.255"
      },
      {
        "description": "instantaneous.current.(sum.over.all.phases)",
        "obis": "1.0.90.7.0.255"
      },
      {
        "description": "instantaneous.active.import.power.(+A)",
        "obis": "1.0.1.7.0.255"
      },
      {
        "description": "instantaneous.active.import.power.(+A).L1",
        "obis": "1.0.21.7.0.255"
      },
      {
        "description": "instantaneous.active.import.power.(+A).L2",
        "obis": "1.0.41.7.0.255"
      },
      {
        "description": "instantaneous.active.import.power.(+A).L3",
        "obis": "1.0.61.7.0.255"
      },
      {
        "description": "instantaneous.active.export.power.(-A)",
        "obis": "1.0.2.7.0.255"
      },
      {
        "description": "instantaneous.active.export.power.(-A).L1",
        "obis": "1.0.22.7.0.255"
      },
      {
        "description": "instantaneous.active.export.power.(-A).L2",
        "obis": "1.0.42.7.0.255"
      },
      {
        "description": "instantaneous.active.export.power.(-A).L3",
        "obis": "1.0.62.7.0.255"
      },
      {
        "description": "instantaneous.reactive.import.power.(+R)",
        "obis": "1.0.3.7.0.255"
      },
      {
        "description": "instantaneous.reactive.import.power.(+R).L1",
        "obis": "1.0.23.7.0.255"
      },
      {
        "description": "instantaneous.reactive.import.power.(+R).L2",
        "obis": "1.0.43.7.0.255"
      },
      {
        "description": "instantaneous.reactive.import.power.(+R).L3",
        "obis": "1.0.63.7.0.255"
      }
    ]
  }
}
```
:::