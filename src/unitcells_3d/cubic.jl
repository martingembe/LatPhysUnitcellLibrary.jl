################################################################################
#
#   CUBIC (SC / SIMPLE CUBIC) LATTICE
#
################################################################################



# Implementation
# - implementation 1
# - labels <: Any
function getUnitcellCubic(
            unitcell_type  :: Type{U},
            implementation :: Val{1}
        ) :: U where {LS,LB,S<:AbstractSite{LS,3},B<:AbstractBond{LB,3},U<:AbstractUnitcell{S,B}}

    # return a new Unitcell
    return newUnitcell(
        # Type of the unitcell
        U,
        # lattice vectors
        Vector{Float64}[
            Float64[1, 0, 0],
            Float64[0, 1, 0],
            Float64[0, 0, 1]
        ],
        # sites
        S[
            newSite(S, Float64[0,0,0], getDefaultLabelN(LS,1))
        ],
        # bonds
        B[
            newBond(B, 1,1, getDefaultLabel(LB), (+1,0,0)),
            newBond(B, 1,1, getDefaultLabel(LB), (-1,0,0)),
            newBond(B, 1,1, getDefaultLabel(LB), (0,+1,0)),
            newBond(B, 1,1, getDefaultLabel(LB), (0,-1,0)),
            newBond(B, 1,1, getDefaultLabel(LB), (0,0,+1)),
            newBond(B, 1,1, getDefaultLabel(LB), (0,0,-1))
        ]
    )
end
