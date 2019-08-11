# This is the first edition of candlestick plotting function

using Plots
import Plots.plot

function plot(data::FTS)

    periods = nrow(data.prices)

    p = plot(legend = false,
             title = "$(data.name) stock price",
             title_position = :left,
             xticks = (1:30, Dates.format.(data.prices.index, "yy-mm-d")),
             xrotation = rad2deg(pi/3)
             )

    for i ∈ 1:periods
        row = data.prices[i,:]

        p = plot!([i, i], [row.hign, row.low], color = "black")

        if row.open < row.close
            p = plot!(rectangle(1, abs(row.open - row.close), i - .5, row.open), fill = "green")
        else
            p = plot!(rectangle(1, abs(row.open - row.close), i - .5, row.close), fill = "red")
        end
    end
    return p
end

rectangle(w, h, x, y) = Shape(x .+ [0,w,w,0], y .+ [0,0,h,h])

plot(da)

@time plot(da)

@code_warntype plot(da)

@code_native plot(da)x
