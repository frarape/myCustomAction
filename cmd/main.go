package main

import (
	"fmt"
	"os"
	"strings"
)

func main() {
	fmt.Println("HelloWorld")
	inputArgs := os.Args[1:]
	fmt.Println(strings.Join(inputArgs, " "))
}
