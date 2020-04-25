using Lifting
import Lifting: Lifting_Programmes
cd(@__DIR__)

name = "nSunsCAP3_OHP_6Day_LP"
prog = deepcopy(Lifting_Programmes[name])
keyArr, date, day1, Δdays, reps, wght, rpe = loadLogFile(Lifting_Programmes, name)
tm = calcTrainingMaxLogs(prog, keyArr, reps, wght)

figs = plotData(prog, keyArr, Δdays, tm; xlabel = "Days", ylabel = "Weight", lw=3)
display.(figs)

updateMaxes(prog, keyArr, reps)
updateMaxes!(prog, keyArr, reps)
