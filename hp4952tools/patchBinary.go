package main

import (
	"encoding/hex"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"strings"
)

type ConversionInfo struct {
	inFile  string
	outFile string
	dryMode bool
	debug   int
	patches string
	spec    string
}

type PatchInfo struct {
	address   int
	wordValue int
}

// main patch binary
func main() {
	fmt.Println("Patch binary with word value (LO-HI ordered)")
	inFilePtr := flag.String("in", "testee.bin",
		"Input binary file")
	outFilePtr := flag.String("out", "testee.out",
		"Output binary file")

	patchesPtr := flag.String("patches", "00=abba,0d00=cafe",
		"List of words to patch, set of address=value pairs, e.g. \"10=abba,0180=000c\". \n\r\tNo leading '0x', #digits must be even, add leading '0' if required")
	specPtr := flag.String("spec", "",
		"use value \"hp4952a\" for special handling of HP4952A binaries.\n\r\tWill patch filesize value with correct word. codesize value needs to be added manually via -patches option")

	dryRunPtr := flag.Bool("dry-run", false,
		"dry run mode")
	debugPtr := flag.Int("debug", 0,
		"Debug level")
	flag.Parse()

	fmt.Printf("--in, binary input file: %s\n", *inFilePtr)
	fmt.Printf("--out, binary output file: %s\n", *outFilePtr)
	fmt.Printf("--patches, adress/word pairs to patch: %s\n", *patchesPtr)
	fmt.Printf("--spec, special handling id. One of: hp4952a %s\n", *specPtr)
	fmt.Printf("--dry-run: %t\n", *dryRunPtr)
	fmt.Printf("--debug: %d\n", *debugPtr)

	//var sb strings.Builder

	// Create type
	confInfo := ConversionInfo{
		inFile:  *inFilePtr,
		outFile: *outFilePtr,
		dryMode: *dryRunPtr,
		debug:   *debugPtr,
		patches: *patchesPtr,
		spec:    *specPtr,
	}

	patchLines := strings.Split(*patchesPtr, ",")
	mumPatches := len(patchLines)
	patches := make([]PatchInfo, mumPatches)
	i := 0
	for i < mumPatches {
		//log.Printf("Patch %d : %s\n\r", i, patchLines[i])
		addPatch(&patches, i, patchLines[i])
		i++
	}

	// HP5249 binary file name
	infile := confInfo.inFile

	// Read in file
	bytes, err := ioutil.ReadFile(infile)
	if err != nil {
		log.Printf("Error loading file %s: %s\n\r", infile, err)
		return
	}

	fmt.Printf("Bytes read in: %d\n\r", len(bytes))

	// Patch file
	//fmt.Printf("#Patches: %d\n\r", len(patches))
	i = 0
	for i < len(patches) {
		fmt.Printf("Applying patch %d\n\r", i)
		applyPatch(bytes, patches[i])
		i++
	}

	if confInfo.spec == "hp4952a" {
		fmt.Printf("Special handling for HP4952A binary files.\n\r")
		// Patch file size word at 0x102
		fileLength := len(bytes)
		// file size is in 256bytes blocks
		blocks := fileLength/256 - 1
		if blocks == 0 {
			// not smaller than 1
			blocks = 1
		}

		oldValue := int(bytes[0x103])
		oldValue = oldValue<<8 + int(bytes[0x102])
		fmt.Printf("Old word value at 0x102: 0x%04x (decimal %d)\n\r", oldValue, oldValue)
		fmt.Printf("Binary file size is: 0x%x (decimal %d), resulting in 0x%x blocks (decimal %d)\n\r",
			fileLength, fileLength, blocks, blocks)
		fmt.Printf("New word value at 0x102: 0x%04x\n\r", blocks)
		patch := PatchInfo{
			address:   0x102,
			wordValue: blocks,
		}
		applyPatch(bytes, patch)
	}

	// Write file
	err = os.WriteFile(confInfo.outFile, bytes /*[]byte(confInfo.outContent.String())*/, 0644)
	if err != nil {
		log.Printf("Error Writing output file %s\n\r", err)
		return
	}
	fmt.Printf("Done.\n\r")
}

func applyPatch(bytes []byte, patch PatchInfo) {
	addr := patch.address
	val := patch.wordValue
	bytes[addr] = byte(val & 0xff) // LO
	addr++
	val = val >> 8
	bytes[addr] = byte(val & 0xff) // HI
}

func addPatch(patches *[]PatchInfo, i int, s string) {
	fmt.Printf("Patch %d: %s\n\r", i, s)
	parts := strings.Split(s, "=")
	//fmt.Printf("address: \"%s\", value: \"%s\"\n\r", parts[0], parts[1])

	decodePatch(parts, patches, i)
	fmt.Printf("\t ... decoded to 0x%x=0x%x\n\r", (*patches)[i].address, (*patches)[i].wordValue)

}

func decodePatch(parts []string, patches *[]PatchInfo, i int) {
	(*patches)[i].address = decodeValue(parts[0])
	(*patches)[i].wordValue = decodeValue(parts[1])
}

func decodeValue(part string) int {
	a, err := hex.DecodeString(part)
	if err != nil {
		log.Printf("Error decoding string \"%s\" to hex value. %s\n\r", part, err)
	}
	v := toInt(a)
	//fmt.Printf("Decoded value: 0x%x (decimal %d)\r\n", a, v)
	return v
}

func toInt(a []byte) int {
	res := 0
	i := 0
	for i < len(a) {
		//fmt.Printf("\t%d 0x%x - %d\n\r", i, a[i], a[i])
		res += int(a[i])
		i++
		if i < len(a) {
			res *= 256
		}
	}
	return res
}
