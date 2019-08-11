# This is the first edition of candlestick plotting function

using Plots
import Plots.plot

function plot(data::FTS)
    size = [1000, 1000]

    periods = nrow(data.prices)
    candleWidth = size[1] / periods

    p = plot(legend = false, title = "$(data.name) stock price",
             title_position = :left)

    for i ∈ 1:periods
        a = data.prices[i,:]

        p = plot!([i+.5, i+.5], [a.hign, a.low], color = "black")

        if a.open < a.close
            p = plot!(rectangle(1, abs(a.open - a.close), i, a.open), fill = "green")
        else
            p = plot!(rectangle(1, abs(a.open - a.close), i, a.close), fill = "red")
        end
    end
    return p
end

rectangle(w, h, x, y) = Shape(x .+ [0,w,w,0], y .+ [0,0,h,h])

plot(da2)
@time plot(da2)


@code_warntype plot(da2)


join("idfh", " ", "siof")
