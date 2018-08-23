#!/usr/bin/env bash

cd /opt/src/src/github.com/netlify/gocommerce
dep ensure
go build -o gocommerce main.go
cp gocommerce /opt/gocommerce/gocommerce
ln -s /opt/gocommerce/gocommerce /bin/gocommerce
