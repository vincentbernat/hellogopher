# Makefile for Go projects

This is an example of `Makefile` to build a Go project. This is quite
similar to [Filippo Valsorda's hellogopher](https://github.com/cloudflare/hellogopher).

This is for people who don't know about `GOPATH` or who don't want to
use it (like me). With such a `Makefile`, a project can be built
whatever its location on the disk. Note however the use of symlinks is
frowned upon by Go authors and some tools refuse to work with them.

This is intended for *programs* only. For libraries, you should be
able to use `go build`, `go install`, `go get` directly or you will
make the life of your users difficult.

Also, it is not intended to be an universal `Makefile`. It should stay
basic to stay easy to understand.

## Dependencies

This example relies on modules to retrieve dependencies. This require
use of Go 1.11. To update a dependency, just edit `go.mod`. If you
don't want to set a specific version, delete the line: on the next
`go` command, the latest version will be inserted automatically.

For older versions of Go, it's possible to use `vgo` instead:

    go get -u golang.org/x/vgo
    make GO=$GOPATH/bin/vgo

## Versioning

Version is extracted from git tags using anything prefixed by `v`.

## Usage

The following commands are available:

 - `make help` to get help
 - `make` to build the binary (in `bin/`)
 - `make test` to run tests
 - `make test-verbose` to run tests in verbose mode
 - `make test-race` for race tests
 - `make test-xml` for tests with xUnit-compatible output
 - `make test-coverage` for test coverage (will output `index.html`,
   `coverage.xml` and `profile.out` in `test/coverage.*/`.
 - `make test PKG=helloworld/hello` to restrict test to a package
 - `make clean`
 - `make lint` to run golint
 - `make fmt` to run gofmt

The very first line of the `Makefile` is the most important one: this
is the path of the package. I don't use a `go get`able package path
but you can.

Be sure to browse the remaining of the `Makefile` to understand what
it does. There are some tools that will be downloaded. You can use
already-installed one by specifying their full path this way instead:

    make lint GOLINT=/usr/bin/golint

Files other than `.gitignore` and `Makefile` are just examples.

## License

This `Makefile` is published under the CC0 1.0 license. See `LICENSE`
for more details.
