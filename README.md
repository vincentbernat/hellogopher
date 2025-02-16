# Makefile for Go projects (1.24+)

This is an example of `Makefile` to build a Go project. This is quite
similar to [Filippo Valsorda's hellogopher](https://github.com/cloudflare/hellogopher).

Initially, this is for people who don't know about `GOPATH` or who
don't want to use it (like me). However, starting with Go 1.11,
modules enable to work outside of `GOPATH` without any special
environment. This turns this `Makefile` as only a convenience tool.

This `Makefile` may not be used as is. It is expected to be modified
to fit your needs. See [Akvorado's
Makefile](https://github.com/akvorado/akvorado/blob/main/Makefile) for
an example on a more complex project.

## Dependencies

This example relies on modules to retrieve dependencies. This requires use of Go
1.24 or more recent. To update a dependency, use `go get DEPENDENCY@REVISION` or
`go get -tool DEPENDENCY@REVISION` if this is a tool.

You can checkout tag [v0.6][] if you need compatibility down to Go 1.11 or tag
[v1.4][] if you need compatibility down to Go 1.16.

[v0.6]: https://github.com/vincentbernat/hellogopher/tree/v0.6
[v1.4]: https://github.com/vincentbernat/hellogopher/tree/v1.4

Some tools now require more recent versions of Go (1.22+), but it would be
possible to pin them to older versions.

On first build, you need to run `go mod init PROJECTNAME`.

## Versioning

Version is extracted from git tags using anything prefixed by `v`.

## Usage

The following commands are available:

 - `make help` to get help
 - `make` to build the binary (in `bin/`)
 - `make test` to run tests
 - `make test-verbose` to run tests in verbose mode
 - `make test-race` for race tests
 - `make test-coverage` for test coverage (will output `coverage.html`
   and `coverage.xml` in `test/`.
 - `make test PKG=helloworld/hello` to restrict test to a package
 - `make clean`
 - `make lint` to run golint
 - `make fmt` to run gofmt

Be sure to browse the `Makefile` to understand what it does. Files other than
`.gitignore` and `Makefile` are just examples.

## Misc

If you prefer, you can also include this Makefile into another one.
Rename it to `hellogopher.mk` and put in `Makefile` something like
this:

    include hellogopher.mk
    
    # Your custom settings
    TIMEOUT=10
    
    # Your custom rules
    doc: ; $(info $(M) build documentation) @ ## Build documentation
    	$(MAKE) -C doc

## License

This `Makefile` is published under the CC0 1.0 license. See `LICENSE`
for more details.
