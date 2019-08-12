# This is the first edition of candlestick plotting function

using Plots
import Plots.plot

function plot(data::FTS, tic_period::Int64 = 5, show_volume::Bool = false)

    periods = nrow(data.prices)

    p = plot(legend = false,
             #layout = grid(2, 1, heights = [.8, .2]),
             title = "$(data.name) stock price",
             title_position = :left,
             xticks = (1:tic_period:periods,
                       Dates.format.(data.prices.date, "yy-mm-d")),
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

plot(da, 10)

#@time plot(da)

#@code_warntype plot(da)

#@code_native plot(da)
