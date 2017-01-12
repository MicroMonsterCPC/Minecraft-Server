#!/bin/sh
docker build -t spigot-minecraft-server .
docker run \
    -p 25565:25565 \
    --name mine-server \
    spigot-minecraft-server 
