package main

import (
	"github.com/no-src/fserver"
	"github.com/no-src/gofs-webui/internal/about"
	"github.com/no-src/gofs-webui/internal/version"
	"github.com/no-src/gofs-webui/webdist"
	"github.com/no-src/log"
)

func main() {
	defer log.Close()

	exit, port := fserver.InitFlag(func() { version.PrintVersion("gofs-webui") }, about.PrintAbout)
	if exit {
		return
	}
	fserver.Run(port, "/dist", webdist.WebDist)
}
