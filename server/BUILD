load("@io_bazel_rules_docker//container:container.bzl", "container_image", "container_layer")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

container_image(
    name = "server.container",
    base = "@java11_base//image",
    cmd = [
        "buildfarm-server_deploy.jar",
        "/server.config",
        # "--jvm_flag=-Djava.util.logging.config.file=/debug.logging.properties"
    ],
    # leverage the implicit target of the buildfarm-server to get a fat jar.
    # this is simply a workaround for the fact that we have so many dependencies,
    # so we'd want some wrappy script. This seemed more straightforward.
    # https://docs.bazel.build/versions/master/be/java.html#java_binary_implicit_outputs
    files = [
        "@build_buildfarm//src/main/java/build/buildfarm:buildfarm-server_deploy.jar",
        ":server.config",
        ":debug.logging.properties",
    ],
    ports = [
        "8980",
    ],
    tags = ["container"],
    visibility = ["//visibility:public"],
)

container_test(
    name = "server.container_test",
    configs = [":server-container-test.yaml"],
    image = ":server.container",
)

container_image(
    name = "hello",
    base = "@alpine_linux_amd64//image",
)

exports_files(glob(["*"]))
