load("@io_bazel_rules_docker//container:container.bzl", "container_image", "container_layer")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

container_image(
    name = "worker.container",
    base = "@java11_base//image",
    cmd = [
        "buildfarm-operationqueue-worker_deploy.jar",
        "/worker.config"
    ],
    # leverage the implicit target of the buildfarm-operationqueue-worker to get a fat jar.
    # this is simply a workaround for the fact that we have so many dependencies,
    # so we'd want some wrappy script. This seemed more straightforward.
    # https://docs.bazel.build/versions/master/be/java.html#java_binary_implicit_outputs
    files = [
        "@build_buildfarm//src/main/java/build/buildfarm:buildfarm-operationqueue-worker_deploy.jar",
        ":worker.config"
    ],
    tags = ["container"],
    visibility = ["//visibility:public"],
)

container_test(
    name = "worker.container_test",
    configs = [":worker-container-test.yaml"],
    image = ":worker.container",
)

container_image(
    name = "hello",
    base = "@alpine_linux_amd64//image",
    cmd = ["cat", "/worker.config"],
    layers = [
        ":worker-jar",
        ":worker-config-file"
    ],
)

exports_files(glob(["*"]))
