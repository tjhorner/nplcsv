# nplcsv

A tool that converts the format that [Now Playing Log](https://play.google.com/store/apps/details?id=com.radix.nowplayinglog) spits out (why??) into a CSV.

## Installing

**(Prebuilt binaries available from [releases](https://github.com/tjhorner/nplcsv/releases).)**

Clone repo.

```bash
# Build nplcsv then install it to /usr/local/bin
make install
```

If you wanna get rid of it:

```bash
make uninstall
```

## Building

First, install Go.

Then just:

```bash
make build
```

`bin/nplcsv` will magically appear. You can also just:

```bash
go run main.go
```

To distribute:

```bash
make dist
```

3 files will be spit out in the `dist` directory - one for Windows, one for macOS, and one for Linux.

You can also run `make dist-win`, `make dist-macos`, or `make dist-linux` to build them individually.

## FAQ

### How do I use it?

```bash
nplcsv -i your_dumb_file.txt -o the_output_file_but_this_is_optional_and_defaults_to_out.csv
```

### Couldn't this easily just be a `sed` command or something?

Yeah

### So why did you make it...?

I wanted an excuse to use Go

### Ah, ok.

That's not a question