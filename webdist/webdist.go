package webdist

import "embed"

// WebDist the web dist resource
//
//go:embed dist
var WebDist embed.FS
