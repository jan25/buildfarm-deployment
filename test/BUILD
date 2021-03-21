load("@io_bazel_rules_go//go:def.bzl", "go_binary")

exports_files(glob(["*"]))


sh_binary(
    name = "foo",
    srcs = ["foo.sh"],
)

go_binary(
    name = "hello",
    srcs = ["main.go"],
)
