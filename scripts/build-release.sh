#!/usr/bin/env bash

# update repository
#git pull --no-rebase

# update the last git commit
echo -e "$(git rev-parse HEAD)\c" >internal/version/commit

# set GOPROXY environment variable
# export GOPROXY=https://goproxy.cn

############################## build-web ##############################

cd web
npm install
npm run build-only
cd ../
cp -r web/dist webdist

############################## build-web ##############################

export SOFT_RELEASE_GO_VERSION
export SOFT_RELEASE_VERSION
export SOFT_NAME="gofs-webui"
export SOFT_PREFIX="$(echo $SOFT_NAME | sed 's/-/_/g')_"

function init_version {
  go build -v -o . ./...

  SOFT_RELEASE_GO_VERSION=$(go version | awk '{print $3}')
  SOFT_RELEASE_VERSION=$(./${SOFT_NAME} -v | awk 'NR==1 {print $3}')
}

function build_release {
  # release path, for example, gofs_webui_go1.20.2_amd64_linux_v0.1.0
  SOFT_RELEASE="${SOFT_PREFIX}${SOFT_RELEASE_GO_VERSION}_${GOARCH}_${GOOS}_${SOFT_RELEASE_VERSION}"

  rm -rf "$SOFT_RELEASE"
  mkdir "$SOFT_RELEASE"

  # build
  go build -v -o . ./...

  if [ "$GOOS" == "windows" ]; then
    mv ${SOFT_NAME}.exe "$SOFT_RELEASE/"
    # windows release archive
    zip -r "$SOFT_RELEASE.zip" "$SOFT_RELEASE"
  else
    mv ${SOFT_NAME} "$SOFT_RELEASE/"
    # release archive
    tar -zcvf "$SOFT_RELEASE.tar.gz" "$SOFT_RELEASE"
  fi
  rm -rf "$SOFT_RELEASE"
}

init_version

############################## linux-release ##############################

# set go env
export GOOS=linux
export GOARCH=amd64

build_release

############################## linux-release ##############################

############################# windows-release #############################

export GOOS=windows
export GOARCH=amd64

build_release

############################# windows-release #############################

############################## macOS-release ##############################

export GOOS=darwin
export GOARCH=amd64

build_release

############################## macOS-release ##############################

# reset commit file
echo -e "\c" >internal/version/commit

ls -alh | grep ${SOFT_PREFIX}