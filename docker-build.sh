#!/bin/bash
printf "\n"
printf "Docker Helper"
printf "\n"
docker compose -f docker-compose.yml -p laravue build
docker compose -f docker-compose.yml -p laravue up
printf "\n"
