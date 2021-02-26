using Documenter
using FileType

makedocs(
    sitename = "FileType",
    format = Documenter.HTML(),
    modules = [FileType]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "https://github.com/Agent-Hellboy/FileType.jl.git"
)
