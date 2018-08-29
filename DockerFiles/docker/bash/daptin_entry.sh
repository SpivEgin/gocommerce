#!/usr/bin/env bash

tlmapis init
tlmapis adduser --username $DB_USER
DATABASE_URL="database=${DB_NAME} host=${DB_HOST} port=${DB_PORT} user=${DB_USER} sslmode=verify-ca sslcert=cockroachCerts/client.${DB_USER}.crt sslkey=cockroachCerts/client.${DB_USER}.key sslrootcert=cockroachCerts/ca.crt"
gocommerce
