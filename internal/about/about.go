package about

import (
	"github.com/no-src/gofs-webui/internal/version"
	"github.com/no-src/log"
)

const logo = `
 ___       __   _______   ________  ___  ___  ___     
|\  \     |\  \|\  ___ \ |\   __  \|\  \|\  \|\  \    
\ \  \    \ \  \ \   __/|\ \  \|\ /\ \  \\\  \ \  \   
 \ \  \  __\ \  \ \  \_|/_\ \   __  \ \  \\\  \ \  \  
  \ \  \|\__\_\  \ \  \_|\ \ \  \|\  \ \  \\\  \ \  \ 
   \ \____________\ \_______\ \_______\ \_______\ \__\
    \|____________|\|_______|\|_______|\|_______|\|__|

`
const (
	openSourceUrl    = "https://github.com/no-src/gofs-webui"
	documentationUrl = "https://pkg.go.dev/github.com/no-src/gofs-webui@" + version.VERSION
	releaseUrl       = "https://github.com/no-src/gofs-webui/releases"
	dockerImageUrl   = "https://hub.docker.com/r/nosrc/gofs-webui"
)

// PrintAbout print the program logo and basic info
func PrintAbout() {
	log.Log(logo)
	log.Log("The gofs-webui is a web UI tool of the gofs")
	log.Log("Open source repository at: <%s>", openSourceUrl)
	log.Log("Download the latest version at: <%s>", releaseUrl)
	log.Log("The docker image repository address at: <%s>", dockerImageUrl)
	log.Log("Full documentation at: <%s>", documentationUrl)
}
