.PHONY: dist dist-win dist-macos dist-linux ensure-dist-dir

ensure-dist-dir:
	@- mkdir -p dist

dist-win: ensure-dist-dir
	# Build for Windows x64
	GOOS=windows GOARCH=amd64 go build -o dist/nplcsv-windows-amd64.exe main.go

dist-macos: ensure-dist-dir
	# Build for macOS x64
	GOOS=darwin GOARCH=amd64 go build -o dist/nplcsv-darwin-amd64 main.go

dist-linux: ensure-dist-dir
	# Build for Linux x64
	GOOS=linux GOARCH=amd64 go build -o dist/nplcsv-linux-amd64 main.go

dist: dist-win dist-macos dist-linux