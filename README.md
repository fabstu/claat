# Rule for generating html codelab

Inside WORKSPACE:

```s
load("@com_github_googlecodelabs_tools//claat:claat.bzl", "claat_dependencies")

claat_dependencies()
```

Inside BUILD.bazel:

```s
load("@com_github_googlecodelabs_tools//claat:claat.bzl", "claat")

filegroup(
    name = "example-mds",
    srcs = glob(["*.md"]),
)

claat(
    name = "examples",
    srcs = [
        ":example-mds",
    ],
)
```

Build and list result:

```sh
bazel build //claat:examples # BUILD.bazel above is located in //claat here.

ls $(bazel info bazel-genfiles)/<label>/examples.tar
# Output:
# bazel-out/darwin-fastbuild/bin/claat/examples.tar
```