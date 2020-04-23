using Lifting, DelimitedFiles
include("LiftingDictionaries.jl")
include("LiftingProgressions.jl")
include("nSuns CAP3-OHP6day.jl")
cd(@__DIR__)
save = false
if save
    for key in keys(programme)
        write(programme["nSuns CAP3-OHP6day"].name*".csv", programme["nSuns CAP3-OHP6day"])
        write(programme["nSuns CAP3-OHP6day"].name*".csv", programme["nSuns CAP3-OHP6day"], log=true)
    end
end

write(programme["nSuns CAP3-OHP6day"].name*".csv", programme["nSuns CAP3-OHP6day"], log=true)

programme["nSuns CAP3-OHP6day"].dict["Flat Bench"]


var = readdlm("Log "*programme["nSuns CAP3-OHP6day"].name*".csv", ',')
var[4,:]
# Find the rep history.
for i in 1:5
    println((i-1)*4+2:(i-1)*4+5)
end


keys(programme)
programme["nSuns CAP3-OHP6day"].dict["Pullup"][2].setScheme
display(programme["nSuns CAP3-OHP6day"])
exerProg["Flat Bench"][2].setScheme[5]
exerProg["Flat Bench"][1].trainingMax
exerProg["Pullup"][1].trainingMax

# exerProg["Pullup"][2].setScheme
updateRepMax(
    "Flat Bench",
    exerProg,
    20
)


# updateRepMax(
#     "Pullup",
#     exerProg,
#     25
# )
