package hello

import (
	"bytes"
	"testing"
)

func TestHello(t *testing.T) {
	got := &bytes.Buffer{}
	expected := "Hello!\n"
	Hello(got)
	if got.String() != expected {
		t.Errorf("Hello() == %q but expected %q",
			got.String(), expected)
	}
}

func BenchmarkHello(b *testing.B) {
	for b.Loop() {
		got := &bytes.Buffer{}
		Hello(got)
	}
}
