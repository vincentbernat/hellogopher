package cmd

import (
	"os"

	"github.com/spf13/cobra"

	"hellogopher/hello"
)

func init() {
	RootCmd.AddCommand(helloCmd)
}

var helloCmd = &cobra.Command{
	Use:   "hello",
	Short: "Say hello",
	Long:  `Print a nice hello message on the standard output.`,
	Run: func(*cobra.Command, []string) {
		hello.Hello(os.Stdout)
	},
}
