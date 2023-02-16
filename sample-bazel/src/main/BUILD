load(":file_count.bzl", "ruler_rule")

android_binary(
    name = "app",
    manifest = "AndroidManifest.xml",
    deps = ["//src/main/java/com/example/bazel:greeter_activity"],
)

ruler_rule(
    name = "ruler",
    deps = ["app"],
)

# foo_binary(name = "bin2")
