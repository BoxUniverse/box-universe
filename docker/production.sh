#!/bin/sh
cd ../server && yarn build
cd ../client && yarn build
cd ../docker && docker-compose --env-file ../.env -f ./docker-compose.prod.yml up --build
