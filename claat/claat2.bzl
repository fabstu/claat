load("@rules_jvm_external//:defs.bzl", "maven_install")
load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
load(
    "@io_bazel_rules_closure//closure:repositories.bzl",
    "rules_closure_dependencies",
    "rules_closure_toolchains",
)
load(
    "@io_bazel_rules_webtesting//web:repositories.bzl",
    "web_test_repositories",
)
load(
    "@io_bazel_rules_webtesting//web/versioned:browsers-0.3.2.bzl",
    "browser_repositories",
)
# Fetch required transitive dependencies. This is an optional step because you
# can always fetch the required NodeJS transitive dependency on your own.
load("@io_bazel_rules_sass//:package.bzl", "rules_sass_dependencies")
# Setup repositories which are needed for the Sass rules.
load("@io_bazel_rules_sass//:defs.bzl", "sass_repositories")

def claat2_dependencies():
    maven_install(
        artifacts=[
            "org.apache.httpcomponents:httpclient:4.5.5",
            "org.apache.httpcomponents:httpmime:4.5.5",
            "org.apache.httpcomponents:httpcore:4.4.9",
            "org.apache.commons:commons-exec:1.3",
            "org.seleniumhq:selenium-api:3.9.1",
            "org.seleniumhq.selenium:selenium-remote-driver:3.8.1",
            "net.java.dev:jna-client:4.5.1",
            "net.bytebuddy:byte-buddy:1.7.9",
            "net.java.dev:jna:4.5.1",
            "net.bytebuddy:byte-buddy:1.7.9",
            "com.squareup:okio:1.14.0",
            "com.squareup.okhttp3:okhttp:3.9.1",
            "cglib:cglib-nodep:3.2.6",
            "junit:junit:4.12",
            "commons-logging:commons-logging:1.2",
            "commons-codec:commons-codec:1.11",
            "org.hamcrest:hamcrest-core:1.3",
        ],
        repositories=[
            "https://maven.google.com",
            "https://repo1.maven.org/maven2",
        ],
    )

    bazel_skylib_workspace()

    rules_closure_dependencies()

    rules_closure_toolchains()

    web_test_repositories()

    browser_repositories(chromium=True)

    rules_sass_dependencies()

    sass_repositories()