package server

import (
	"net/http"
	"os/exec"
	"runtime"
	"time"

	"github.com/no-src/gofs-webui/server/dist"
	"github.com/no-src/log"
)

func Run() {
	addr := ":9097"
	url := "http://127.0.0.1" + addr
	var err error
	log.Log("start web server => %s", url)
	go func() {
		time.Sleep(time.Second)
		if err == nil && runtime.GOOS == "windows" {
			exec.Command("cmd", "/c", "start", url).Start()
		}
	}()
	err = log.ErrorIf(http.ListenAndServe(addr, http.FileServer(http.FS(dist.WebDist))), "start web server error")
}
