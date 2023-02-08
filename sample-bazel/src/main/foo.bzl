# A provider with one field, transitive_sources.
# FooFiles = provider(fields = ["transitive_sources"])

# AndroidPreDexJarInfo = provider()

# def get_transitive_srcs(srcs, deps):
#   """Obtain the source files for a target and its transitive dependencies.

#   Args:
#     srcs: a list of source files
#     deps: a list of targets that are direct dependencies
#   Returns:
#     a collection of the transitive sources
#   """
#     print(deps)




def _foo_binary_impl(ctx):
    print("analyzing", ctx.label)
    #trans_srcs = get_transitive_srcs([], ctx.attr.deps)

    # in_file = ctx.attr.deps #ctx.file.file

    

    # The output file is declared with a name based on the target's name.
    # out_file = ctx.actions.declare_file("%s.size" % ctx.attr.name)

    # ctx.actions.run_shell(
    #     # Input files visible to the action.
    #     inputs = [],
    #     # Output files that must be created by the action.
    #     outputs = [out_file],
    #     # The progress message uses `short_path` (the workspace-relative path)
    #     # since that's most meaningful to the user. It omits details from the
    #     # full path that would help distinguish whether the file is a source
    #     # file or generated, and (if generated) what configuration it is built
    #     # for.
    #     progress_message = "Getting size of %s" % "x",
    #     # The command to run. Alternatively we could use '$1', '$2', etc., and
    #     # pass the values for their expansion to `run_shell`'s `arguments`
    #     # param (see convert_to_uppercase below). This would be more robust
    #     # against escaping issues. Note that actions require the full `path`,
    #     # not the ambiguous truncated `short_path`.
    #     command = "echo hello > %s" % out_file.path
    #     #command = "wc -c '%s' | awk '{print $1}' > '%s'" %
    #     #            (in_file.path, out_file.path),
    # )

    # Tell Bazel that the files to build for this target includes
    # `out_file`.

    my_depset = depset([], transitive = [ctx.attr.deps[0].files])
    print(my_depset.to_list())

    d = DefaultInfo(files = ctx.attr.deps[0].files)
    print(ctx.attr.deps[0].files.to_list())
    return [DefaultInfo()]

    # out = ctx.actions.declare_file(ctx.label.name)
    # ctx.actions.write(
    #     output = out,
    #     content = "Hello {}!\n".format(ctx.attr.username)
    # )

foo_binary = rule(
    implementation = _foo_binary_impl,
    attrs = {
        "username": attr.string(),
        "deps": attr.label_list(            
            mandatory = True,
        )
    }
)

print("bzl file evaluation")
