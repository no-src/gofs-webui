# gofs-webui

[![Build](https://img.shields.io/github/actions/workflow/status/no-src/gofs-webui/webui.yml?branch=main)](https://github.com/no-src/gofs-webui/actions)
[![License](https://img.shields.io/github/license/no-src/gofs-webui)](https://github.com/no-src/gofs-webui/blob/main/LICENSE)
[![Release](https://img.shields.io/github/v/release/no-src/gofs-webui)](https://github.com/no-src/gofs-webui/releases)

A web UI tool of the [gofs](https://github.com/no-src/gofs).

## Installation

The first need [Go](https://go.dev/doc/install) and [Node](https://nodejs.org/en/download) installed, then you can use
the below command to install `gofs-webui`.

On Windows

```bash
$ scripts\build.bat
```

On Linux or macOS

```bash
$ chmod +x ./scripts/build.sh && ./scripts/build.sh
```

## Quick Start

On Windows

```bash
$ gofs-webui.exe
```

On Linux or macOS

```bash
$ ./gofs-webui
```

When you generate the configuration file `gofs.json` using `gofs-webui` and have
installed [gofs](https://github.com/no-src/gofs#installation), you can use the following command to run `gofs` and
synchronize your files.

```bash
$ gofs -conf=./gofs.json
```