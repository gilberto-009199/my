#!/bin/bash
# Stop All
sudo docker stop $(sudo docker ps -q) 
# Remove All containers
sudo docker rm $(sudo docker ps -a -q)
# Remove All images
sudo docker rmi $(sudo docker images -q)
# Remove All Networks (except the default ones)
sudo docker network rm $(sudo docker network ls --filter "driver!=bridge" --filter "driver!=host" --filter "driver!=none" -q)