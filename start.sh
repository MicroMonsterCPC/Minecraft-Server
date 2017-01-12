#!/bin/sh
docker run \
    -p 25565:25565 \
    --name mine-server \
    jpnlavender/spigot-minecraft-server 
