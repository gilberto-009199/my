#!/bin/bash
# Stop All
sudo docker stop $(sudo docker ps -q) 
# Remove All
sudo docker rm $(sudo docker ps -a -q)
