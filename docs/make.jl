if Base.HOME_PROJECT[] !== nothing
    Base.HOME_PROJECT[] = abspath(Base.HOME_PROJECT[])
end

using Documenter, PointLib

makedocs(
    format = Documenter.HTML(),
    modules = [PointLib],
    sitename = "PointLib",
    pages = [
        "README.md",
        "API Reference" => "index.md"
    ]
)

deploydocs(
    repo = "github.com/kobied/PointLib.jl.git"
)