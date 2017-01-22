// Package hello provides commands to say hello.
package hello

import (
	"fmt"
	"io"
)

// Hello displays a nice hello message on the provided writer.
func Hello(out io.Writer) {
	fmt.Fprintln(out, "Hello!")
}
