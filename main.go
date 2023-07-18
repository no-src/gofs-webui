package main

import (
	"flag"

	"github.com/no-src/gofs-webui/internal/about"
	"github.com/no-src/gofs-webui/internal/version"
	"github.com/no-src/gofs-webui/server"
	"github.com/no-src/log"
)

func main() {
	defer log.Close()

	var (
		printVersion bool
		printAbout   bool
	)
	flag.BoolVar(&printVersion, "v", false, "print the version info")
	flag.BoolVar(&printAbout, "about", false, "print the about info")
	flag.Parse()

	if printVersion {
		version.PrintVersion("gofs-webui")
		return
	}

	if printAbout {
		about.PrintAbout()
		return
	}
	server.Run()
}
