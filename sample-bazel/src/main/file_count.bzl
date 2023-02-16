FileCountInfo = provider(
    fields = {
        "count": "number of files",
    },
)

def _file_count_aspect_impl(target, ctx):
    count = 0

    #    print(ctx.rule)
    #    for dep in ctx.rule.attr:
    #        #print(dep[AndroidBinaryData])
    #        print(dep[JavaInfo].outputs.jars[0].class_jar)

    # Make sure the rule has a srcs attribute.
    if hasattr(ctx.rule.attr, "srcs"):
        # Iterate through the files that make up the sources and
        # print their paths.
        for src in ctx.rule.attr.srcs:
            for f in src.files.to_list():
                print(f.path)

    # Get the counts from our dependencies.
    # print(ctx.rule.attr.deps)
    #    for dep in ctx.rule.attr.deps:
    #        count = count + dep[FileCountInfo].count
    return [FileCountInfo(count = 10)]

file_count_aspect = aspect(
    implementation = _file_count_aspect_impl,
    attr_aspects = [
        "deps",
        "exports",
        "runtime_deps",
    ],
)

def _file_count_rule_impl(ctx):
    for dep in ctx.attr.deps:
        #print(dep[AndroidBinaryData])
        print("Rule")
        # print(dep[JavaInfo].outputs.jars[0].class_jar)

#    for dep in ctx.attr.deps:
#        print(dep[FileCountInfo].count)

ruler_rule = rule(
    implementation = _file_count_rule_impl,
    attrs = {
        "deps": attr.label_list(mandatory = True, allow_files = True, providers = [JavaInfo], aspects = [file_count_aspect]),
    },
)
