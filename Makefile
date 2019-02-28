.PHONY: dist dist-win dist-macos dist-linux ensure-dist-dir build install uninstall

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

build:
	@- mkdir -p bin
	go build -o bin/nplcsv main.go
	@- chmod +x bin/nplcsv

install: build
	mv bin/nplcsv /usr/local/bin/nplcsv
	@- rm -rf bin
	@echo "nplcsv was installed to /usr/local/bin/nplcsv. Run make uninstall to get rid of it, or just remove the binary yourself."

uninstall:
	rm /usr/local/bin/nplcsv