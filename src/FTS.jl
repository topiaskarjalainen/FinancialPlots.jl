#=
FTS is short for financial time series, or OCHL format price information.
We are going to use a sstruct for this
=#

#include("FTS.jl")

#newcode.


using DataFrames

struct FTS
    name::String
    prices::DataFrame
end

function convertPriceData(data::DataFrame, name::String)
    colnames = ["index", "date", "open", "hign", "low", "close", "volume", "adjusted"]
    names!(data, Symbol.(colnames))
    return FTS(name, data)
end
