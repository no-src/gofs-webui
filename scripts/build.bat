@echo off
pushd web
call npm install
call npm run build-only
popd
xcopy web\dist webdist\dist /E /Y /I
go build

echo.
echo "gofs-webui build success"