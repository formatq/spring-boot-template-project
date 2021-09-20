#!/bin/bash

echo "-= docker-compose down start =-"
docker-compose down -v
echo "-= docker-compose down end =-"

echo "-= docker-compose up start =-"
docker-compose up --build
echo "-= docker-compose up end =-"