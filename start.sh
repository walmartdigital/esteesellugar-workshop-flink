#!/bin/bash

graceful_exit() {
    echo "Exit requested..."
    docker-compose down
    exit 0
}
# this line exectues when process exits
trap 'graceful_exit' TERM INT HUP

echo "Inicializando ambiente..."
docker compose up -d

echo "Esperando por Zepellin..."
http_response=0
until [[ $http_response == "200" ]]; do http_response=$(curl -i -s localhost:8080 | grep HTTP | awk '{print $2}') && echo "..." && sleep 2; done

echo "loading workshop"
curl http://localhost:8080/api/notebook/import -d @'flink-kafka-workshop.zpln'

printf "\n\nPresione enter para detener la ejecución"
read -r -n 1

echo "Bajando ambiente..."
docker compose down
echo "Done! happy coding"