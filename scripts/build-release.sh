#!/usr/bin/env bash

# update repository
#git pull --no-rebase

# update the last git commit
echo -e "$(git rev-parse main)\c" >internal/version/commit

# set GOPROXY environment variable
# export GOPROXY=https://goproxy.cn

############################## build-web ##############################

cd web
npm install
npm run build-only
cd ../
cp -r web/dist/* server/dist

############################## build-web ##############################

############################## linux-release ##############################

# set go env for linux
export GOOS=linux
export GOARCH=amd64

# build gofs-webui
go build -v -o . ./...

export GOFS_WEBUI_RELEASE_GO_VERSION=$(go version | awk '{print $3}')
export GOFS_WEBUI_RELEASE_VERSION=$(./gofs-webui -v | awk 'NR==1 {print $3}')

# release path, for example, gofs_webui_go1.20.2_amd64_linux_v0.1.0
export GOFS_WEBUI_RELEASE="gofs_webui_${GOFS_WEBUI_RELEASE_GO_VERSION}_${GOARCH}_${GOOS}_${GOFS_WEBUI_RELEASE_VERSION}"

rm -rf "$GOFS_WEBUI_RELEASE"
mkdir "$GOFS_WEBUI_RELEASE"
mv gofs-webui "$GOFS_WEBUI_RELEASE/"

# linux release archive
tar -zcvf "$GOFS_WEBUI_RELEASE.tar.gz" "$GOFS_WEBUI_RELEASE"

rm -rf "$GOFS_WEBUI_RELEASE"

############################## linux-release ##############################

############################# windows-release #############################

# set go env for windows
export GOOS=windows
export GOARCH=amd64

# build gofs-webui
go build -v -o . ./...

# release path, for example, gofs_webui_go1.20.2_amd64_windows_v0.1.0
export GOFS_WEBUI_RELEASE="gofs_webui_${GOFS_WEBUI_RELEASE_GO_VERSION}_${GOARCH}_${GOOS}_${GOFS_WEBUI_RELEASE_VERSION}"

mkdir "$GOFS_WEBUI_RELEASE"
mv gofs-webui.exe "$GOFS_WEBUI_RELEASE/"

# windows release archive
zip -r "$GOFS_WEBUI_RELEASE.zip" "$GOFS_WEBUI_RELEASE"

rm -rf "$GOFS_WEBUI_RELEASE"

############################# windows-release #############################

############################## macOS-release ##############################

# set go env for macOS
export GOOS=darwin
export GOARCH=amd64

# build gofs-webui
go build -v -o . ./...

# release path, for example, gofs_webui_go1.20.2_amd64_darwin_v0.1.0
export GOFS_WEBUI_RELEASE="gofs_webui_${GOFS_WEBUI_RELEASE_GO_VERSION}_${GOARCH}_${GOOS}_${GOFS_WEBUI_RELEASE_VERSION}"

rm -rf "$GOFS_WEBUI_RELEASE"
mkdir "$GOFS_WEBUI_RELEASE"
mv gofs-webui "$GOFS_WEBUI_RELEASE/"

# macOS release archive
tar -zcvf "$GOFS_WEBUI_RELEASE.tar.gz" "$GOFS_WEBUI_RELEASE"

rm -rf "$GOFS_WEBUI_RELEASE"

############################## macOS-release ##############################

# reset commit file
echo -e "\c" >internal/version/commit
