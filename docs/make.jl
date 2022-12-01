using Documenter
using FileTypes

makedocs(
    sitename = "FileTypes",
    format = Documenter.HTML(),
    modules = [FileTypes]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "https://github.com/JuliaIO/FileTypes.jl.git"
)
