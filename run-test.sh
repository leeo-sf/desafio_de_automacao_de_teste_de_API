#!/bin/bash

COLLECTION_PATH="./Desafio Banco Carrefour.postman_collection.json"
ENVIRONMENT_PATH="./Desafio_CSF.postman_environment.json"

npx newman run $COLLECTION_PATH -e $ENVIRONMENT_PATH