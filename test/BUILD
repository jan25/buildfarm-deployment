load("@io_bazel_rules_go//go:def.bzl", "go_binary")

exports_files(glob(["*"]))


sh_binary(
    name = "foo",
    srcs = ["foo.sh"],
)

go_binary(
    name = "hello",
    srcs = ["main.go"],
    goarch = "amd64",
    goos = "linux",
)

cc_binary(
    name = "main",
    srcs = ["main.cc"],
)