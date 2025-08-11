package cmd

import (
	"fmt"
	"runtime"

	"github.com/spf13/cobra"
)

var (
	// Version contains the current version.
	Version = "dev"
)

func init() {
	RootCmd.AddCommand(versionCmd)
}

var versionCmd = &cobra.Command{
	Use:   "version",
	Short: "Print version",
	Long:  `Display version and build information about hellogopher.`,
	Run: func(*cobra.Command, []string) {
		fmt.Printf("hellogopher %s\n", Version)
		fmt.Printf("  Built with: %s\n", runtime.Version())
	},
}
