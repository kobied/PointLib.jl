module PointLib

greet() = print("Hello World!")

using LinearAlgebra

export Points2D, iscollinear, ϵ

struct Point2D
    x::Float64
    y::Float64
end

function ϵ end

let _ϵ = 1e-5
    global ϵ() = _ϵ
end

function length(pA::Point2D, pB::Point2D)
    x1,y1,x2,y2 = pA.x, pA.y, pB.x, pB.y
    dx, dy = x1 - x2, y1 - y2
    return sqrt(dx*dx+dy*dy)
end

Δ(pA::Point2D, pB::Point2D, pC::Point2D) = 0.5*det([pA.x pA.y 1; pB.x pB.y 1; pC.x pC.y 1])
L(pA::Point2D, pB::Point2D, pC::Point2D) = max(length(pA, pB), length(pB, pC), length(pC,pA))

function iscollinear(pA::Point2D, pB::Point2D, pC::Point2D)
    l = L(pA, pB, pC)
    l ≤ ϵ() && return true
    return 2Δ(pA, pB, pC)/l ≤ ϵ()
end

end # module
