#=
FTS is short for financial time series, or OCHL format price information.
We are going to use a sstruct for this
=#

#include("FTS.jl")

#newcode.
module newcode

    using DataFrames

    struct FTS
        prices::DataFrame
    end




    function convertPriceData(data::DataFrame)
        return FTS(data)
    end
end
