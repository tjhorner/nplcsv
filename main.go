package main

import (
	"flag"
	"fmt"
	"io/ioutil"
	"os"
	"path"
	"regexp"
	"strings"
)

func escapeCsv(in string) string {
	return strings.ReplaceAll(in, `"`, `\"`)
}

func main() {
	inf := flag.String("i", "", "The file to read from.")
	ouf := flag.String("o", "out.csv", "The csv file to output to.")
	flag.Parse()

	if *inf == "" {
		fmt.Printf("nplcsv: Please provide an input file with the flag -i.\n")
		os.Exit(1)
	}

	cwd, _ := os.Getwd()
	inFile := path.Join(cwd, *inf)
	outFile := path.Join(cwd, *ouf)

	input, err := ioutil.ReadFile(inFile)
	if err != nil {
		fmt.Printf("nplcsv: %v\n", err)
		os.Exit(1)
	}

	re := regexp.MustCompile(`(.+) by (.+) on (.+) at \((.+), (.+)\)`)

	matches := re.FindAllStringSubmatch(string(input), -1)
	csv := "Date,Latitude,Longitude,Track,Artist\n"

	for _, match := range matches {
		csv += fmt.Sprintf(
			"\"%s\",\"%s\",\"%s\",\"%s\",\"%s\"\n",
			escapeCsv(match[3]),
			escapeCsv(match[4]),
			escapeCsv(match[5]),
			escapeCsv(match[1]),
			escapeCsv(match[2]),
		)
	}

	ioutil.WriteFile(outFile, []byte(csv), 0655)
}
