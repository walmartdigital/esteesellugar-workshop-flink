# Flink Workshop

## Enriquecimiento de datos en tiempo real

Este repositorio contiene los pasos necesarios para probar
un flujo de enriquecimiento de datos en tiempo real con
flink y Kafka.

### Prerrequisitos

- [Docker Engine - Community v20.10.5](https://docs.docker.com/get-docker/)
- [Docker compose](https://docs.docker.com/compose/install/) - generalmente disponible al instalar docker engine
- Disponible al menos 4 Gb de memoria libres
- [Git](https://git-scm.com/downloads)

> Los comando utilizados en este repositorio están diseñados para trabajar
en un sistema Linux u OSX

### Ejecución en local

Ejecuta `./start.sh`. Una vez el script muestre que está listo para comenzar
entra desde tu navegador a `http://localhost:8080` y `http:localhost:8081`
ambas direcciones se van a utilizar durante el workshop.

> Si tienes problemas con la ejecución del script, revisa los permisos del 
archivo `chmod +x ./start.sh`

### Contenido

Este workshop hace uso de [Zepellin](https://zeppelin.apache.org) como sistema para la ejecución de los pasos del taller, por lo que ,su contenido esta expresado dentro de un notebook llamado `Flink Kafka Workshop`

#### Comandos utilizados
- `docker exec -it wrokshop-real-time-enrichment_kafka_1 /bin/bash` para el acceso al contenedor de kafka
- `kafka-topics --bootstrap-server kafka:9092 --list` Para listar los tópicos en kafka
- `kafka-topics --bootstrap-server kafka:9092 --create --topic enriched-item` Para crear un tópico en kafka
- `kafka-console-consumer --bootstrap-server kafka:9092 --topic enriched-item --from-beginning` Para consumir desde un tópico en kafka
- `kafka-console-producer --bootstrap-server kafka:9092 --topic test` Para producir datos a un tópico en kafka

### Ejercicio

En este workshop vamos a trabajar en un concepto muy utilizado en la ingeniería de datos, que es el enriquecimiento de datos.
Vamos a tener una fuente de datos que simula el envío de transacciones que se generan al escanear un artículo en cada una da las cajas de una cadena de supermercados. Este mensaje tiene estos campos:

```
"scanItem": {
    "tienda": 1,
    "codigo_de_barra": "ABC-584-000",
    "cantidad": 2,
    "precio": 2178
}
````
Dada la gran cantidad de transacciones que están pasando es recomendable que este mensaje sea lo más liviano posible, por lo que si queremos sacar información más entendible debemos crear un job que se ocupe de enriquecer este set de datos. Para esto vamos a utilizar un servicio que a partir de un código de barras nos entrega información del producto. Este servicio se encuentra en "https://kafka-flink-workshop.herokuapp.com/api/v1/products/<codigo_de_barras>" y al ser llamado con el codigo de barras nos entrega el siguiente mensaje:
````
Producto: {
    codigo_de_barra: "ABC-540-000",
    nombre: "Juice - Apple Cider",
    departamento: "Outdoors"
}
```

**Happy coding =)**