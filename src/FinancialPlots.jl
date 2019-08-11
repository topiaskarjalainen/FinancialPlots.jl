using Plots
using CSV
using Dates
using DataFrames

using Revise


module FinancialPlots
    using Plots
    using CSV
    using Dates
    using DataFrames

    include("FTS.jl")

    export FTS, convertPriceData
end # module
