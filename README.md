# gofs-webui

[![Build](https://img.shields.io/github/actions/workflow/status/no-src/gofs-webui/webui.yml?branch=main)](https://github.com/no-src/gofs-webui/actions)
[![License](https://img.shields.io/github/license/no-src/gofs-webui)](https://github.com/no-src/gofs-webui/blob/main/LICENSE)
[![Release](https://img.shields.io/github/v/release/no-src/gofs-webui)](https://github.com/no-src/gofs-webui/releases)

A web UI tool of the [gofs](https://github.com/no-src/gofs).

## Installation

The first need [Go](https://go.dev/doc/install) and [Node](https://nodejs.org/en/download) installed, then you can use
the below command to install `gofs-webui`.

### Windows

```bash
$ scripts\build.bat
```

### Linux or macOS

```bash
$ chmod +x ./scripts/build.sh && ./scripts/build.sh
```

### Docker

You can use the [build-docker.sh](/scripts/build-docker.sh) script to build the docker image and you should clone this
repository and `cd` to the root path of the repository first.

```bash
$ ./scripts/build-docker.sh
```

Or pull the docker image directly from [DockerHub](https://hub.docker.com/r/nosrc/gofs-webui) with the command below.

```bash
$ docker pull nosrc/gofs-webui
```

For more scripts about release and docker, please see the [scripts](/scripts) directory.

## Quick Start

### Windows

```bash
$ gofs-webui.exe
```

### Linux or macOS

```bash
$ ./gofs-webui
```

### Docker

```bash
$ docker run -it --rm --name running-gofs-webui -p 9097:9097 nosrc/gofs-webui:latest gofs-webui
```

## Run gofs

When you generate the configuration file `gofs.json` using `gofs-webui` and have
installed [gofs](https://github.com/no-src/gofs#installation), you can use the following command to run `gofs` and
synchronize your files.

```bash
$ gofs -conf=./gofs.json
```