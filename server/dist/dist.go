package dist

import "embed"

// WebDist the web dist resource
//
//go:embed assets favicon.svg index.html
var WebDist embed.FS
