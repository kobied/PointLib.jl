if Base.HOME_PROJECT[] !== nothing
    Base.HOME_PROJECT[] = abspath(Base.HOME_PROJECT[])
end

isinstalled(pkg::String) = any(x -> x.name == pkg && x.is_direct_dep, values(Pkg.dependencies()))

using Pkg

if !isinstalled("Documenter")
    Pkg.add("Documenter")
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