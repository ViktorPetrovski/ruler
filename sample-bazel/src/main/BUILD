load(":foo.bzl", "foo_binary")
load(":hash.bzl", "hashes")

android_binary(
    name = "app",
    manifest = "AndroidManifest.xml",
    deps = ["//src/main/java/com/example/bazel:greeter_activity"],
)

hashes(
    name = "build_hash",
    src = "BUILD",
)

foo_binary(
    name = "bin", 
    username = "Alice", 
    deps=[":app"]
)

# foo_binary(name = "bin2")
