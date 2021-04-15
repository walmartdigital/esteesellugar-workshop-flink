# Flink Workshop

## Enriquecimiento de datos en tiempo real

Este repositorio contiene los pasos necesarios para probar
un flujo de enriquecimiento de datos en tiempo real con
flink y Kafka.

### Prerrequisitos

- [Docker Engine - Community v20.10.5](https://docs.docker.com/get-docker/)
- Disponible al menos 4 Gb de memoria libres
- [Git](https://git-scm.com/downloads)

> Los comando utilizados en este repositorio están diseñados para trabajar
en un sistema Linux u OSX

### Ejecución en local

Ejecuta `./start.sh`. Una vez el ecript muestre que esta listo para comenzar
entra desde tu navegador a `http://localhost:8080` y `http:localhost:8081`
ambas direcciones se van a utilizar durante el workshop.

> Si tienes problemas con la ejecución del script, revisa los permisos del 
archivo `chmod +x ./start.sh`

### Contenido

Este workshop hace uso de [Zepellin](https://zeppelin.apache.org) como sistema para la ejecución de los pasos del taller, por lo que
,su contenido esta expresado dentro de un notebook llamado 
`flink-kafka-workshop1`

Happy coding =)