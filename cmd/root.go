// Package cmd handles the command-line interface for hellogopher.
package cmd

import (
	"github.com/spf13/cobra"
)

// RootCmd is the root for all hello commands.
var RootCmd = &cobra.Command{
	Use:           "hellogopher",
	Short:         "Say hello",
	Long:          `Currently, just say hello.`,
	SilenceErrors: true,
}
