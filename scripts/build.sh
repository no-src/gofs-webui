#!/usr/bin/env bash

cd web
npm install
npm run build-only
cd ../
cp -r web/dist/* server/dist
go build

echo -e "\ngofs-webui build success"
