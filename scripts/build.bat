@echo off
pushd web
call npm install
call npm run build-only
popd
xcopy web\dist\* server\dist /E /Y
go build

echo.
echo "gofs-webui build success"