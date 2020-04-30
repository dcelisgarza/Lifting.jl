using Lifting
using Test

@testset "Maths" begin
    @test isapprox(calcRPE(3, calcIntensity(3, 8)), 8)
    @test isapprox(
        calcReps(calcIntensity(3, 8), calcRPE(3, calcIntensity(3, 8))),
        3,
    )

    @test calcIntensity(1, 3) == 0.7927699381639448
    @test calcIntensity(1, 5) == 0.8369601606963508
    @test calcIntensity(1, 6) == 0.8609556607834696
    @test calcIntensity(2, 1) == 0.6837373081262179
    @test calcIntensity(2, 10) == 0.9320967516428205
    @test calcIntensity(3, 5) == 0.7674204440806303
    @test calcIntensity(3, 8) == 0.8416327675690841
    @test calcIntensity(4, 1) == 0.5781098697807519
    @test calcIntensity(4, 7) == 0.7856495497947491
    @test calcIntensity(4, 8) == 0.810257864565398
    @test calcIntensity(5, 1) == 0.536711034778875
    @test calcIntensity(5, 2) == 0.6135345726731701
    @test calcIntensity(5, 4) == 0.6833868653044488
    @test calcIntensity(5, 5) == 0.7092198581560283
    @test calcIntensity(6, 3) == 0.6263113393667992
    @test calcIntensity(6, 5) == 0.6833479493866953
    @test calcIntensity(7, 5) == 0.6593075387107712
    @test calcIntensity(7, 10) == 0.7750478868872971
    @test calcIntensity(8, 2) == 0.5319184303087121
    @test calcIntensity(8, 5) == 0.6369071787400383
    @test calcIntensity(9, 2) == 0.5093407432979247
    @test calcIntensity(9, 9) == 0.704666457876605
    @test calcIntensity(9, 10) == 0.7262574340517902
    @test calcIntensity(10, 3) == 0.5366678294469638

    @test calcRPE(1, 0.8) == 3.342342342342342
    @test calcRPE(2, 0.3) == 0.05156764251678613
    @test calcRPE(2, 0.7) == 1.3099066269984132
    @test calcRPE(2, 0.9) == 8.88856743957622
    @test calcRPE(2, 1.0) == 10.0
    @test calcRPE(3, 0.9) == 10.0
    @test calcRPE(4, 0.8) == 7.586200791837665
    @test calcRPE(5, 0.4) == 0.3934674694286991
    @test calcRPE(6, 0.1) == 0.05901737061084574
    @test calcRPE(7, 0.4) == 0.6265524536794053
    @test calcRPE(7, 0.8) == 10.0
    @test calcRPE(7, 1.0) == 10.0
    @test calcRPE(9, 0.2) == 0.23682903555711834
    @test calcRPE(9, 0.6) == 4.380666149879444
    @test calcRPE(10, 1.0) == 10.0

    @test calcReps(0.2, 3) == 57
    @test calcReps(0.2, 5) == 72
    @test calcReps(0.2, 8) == 86
    @test calcReps(0.3, 5) == 41
    @test calcReps(0.4, 8) == 32
    @test calcReps(0.5, 4) == 14
    @test calcReps(0.6, 1) == 4
    @test calcReps(0.6, 6) == 11
    @test calcReps(0.7, 1) == 2
    @test calcReps(0.7, 8) == 8
    @test calcReps(0.8, 3) == 1
    @test calcReps(0.8, 6) == 3
    @test calcReps(0.8, 10) == 6
    @test calcReps(1.0, 9) == 0

    @test calcIntensityRatio(1, 2, 8, 6) == 0.8554603294340484
    @test calcIntensityRatio(1, 8, 10, 1) == 0.4327753512915275
    @test calcIntensityRatio(2, 2, 10, 3) == 0.7401991037647249
    @test calcIntensityRatio(2, 7, 10, 3) == 0.6316772019672708
    @test calcIntensityRatio(2, 9, 7, 3) == 0.6656842312192123
    @test calcIntensityRatio(3, 8, 7, 8) == 0.8661098904150482
    @test calcIntensityRatio(3, 10, 3, 10) == 1.0
    @test calcIntensityRatio(4, 4, 7, 7) == 0.9922434668550097
    @test calcIntensityRatio(4, 5, 4, 7) == 1.0657925380128117
    @test calcIntensityRatio(4, 6, 10, 7) == 0.842533486694681
    @test calcIntensityRatio(5, 7, 7, 8) == 0.9626050463922357
    @test calcIntensityRatio(5, 8, 4, 10) == 1.1034631381591704
    @test calcIntensityRatio(5, 10, 4, 1) == 0.6957552282811349
    @test calcIntensityRatio(6, 8, 8, 3) == 0.7664551245770161
    @test calcIntensityRatio(6, 10, 7, 2) == 0.694007341735247
    @test calcIntensityRatio(8, 4, 5, 1) == 0.8793406504937742
    @test calcIntensityRatio(8, 4, 6, 1) == 0.8205956008180643
    @test calcIntensityRatio(8, 8, 9, 2) == 0.7220860050141765
    @test calcIntensityRatio(9, 7, 8, 8) == 1.0658963533980068
    @test calcIntensityRatio(9, 8, 1, 8) == 1.3366720451385716

    @test calcRPERatio(1, 0.1, 10, 0.8) == 2.9993973518287506e14
    @test calcRPERatio(2, 0.4, 1, 0.4) == -4.614083979793281e-14
    @test calcRPERatio(2, 0.8, 10, 0.8) == 2.0069922576450354
    @test calcRPERatio(4, 0.6, 2, 0.4) == 0.07359916350276016
    @test calcRPERatio(4, 0.7, 3, 1.0) == 2.805871332615087
    @test calcRPERatio(4, 0.9, 5, 0.9) == 1.0
    @test calcRPERatio(4, 0.9, 8, 0.7) == 0.7755866011749226
    @test calcRPERatio(4, 0.9, 9, 0.7) == 0.8782128594994774
    @test calcRPERatio(5, 0.2, 6, 0.3) == 2.4186452245040173
    @test calcRPERatio(5, 0.5, 1, 0.5) == 8.813339622784159e-15
    @test calcRPERatio(5, 0.9, 6, 0.2) == 0.014388869488003317
    @test calcRPERatio(6, 0.2, 7, 0.6) == 20.620074858037235
    @test calcRPERatio(6, 0.4, 6, 1.0) == 19.73972406773003
    @test calcRPERatio(6, 0.5, 4, 0.7) == 3.5867973963742124
    @test calcRPERatio(6, 0.6, 9, 0.2) == 0.10156686550096347
    @test calcRPERatio(6, 1.0, 2, 0.7) == 0.13099066269984133
    @test calcRPERatio(6, 1.0, 3, 0.7) == 0.246570448138738
    @test calcRPERatio(8, 0.1, 9, 0.1) == 1.147351193973504
    @test calcRPERatio(8, 0.5, 8, 0.9) == 6.495419905922825
    @test calcRPERatio(8, 1.0, 3, 0.7) == 0.246570448138738
    @test calcRPERatio(9, 0.2, 5, 1.0) == 42.22455230827558
    @test calcRPERatio(9, 0.3, 5, 1.0) == 21.486366386831257

    @test calcRepRatio(0.1, 7, 0.1, 7) == 1.0
    @test calcRepRatio(0.1, 7, 1.0, 3) == 0.0
    @test calcRepRatio(0.1, 8, 0.2, 8) == 0.441025641025641
    @test calcRepRatio(0.2, 8, 0.7, 7) == 0.08139534883720931
    @test calcRepRatio(0.3, 5, 0.6, 9) == 0.36585365853658536
    @test calcRepRatio(0.3, 7, 0.3, 8) == 1.0638297872340425
    @test calcRepRatio(0.3, 9, 0.9, 2) == 0.0
    @test calcRepRatio(0.4, 1, 0.2, 5) == 7.2
    @test calcRepRatio(0.5, 2, 1.0, 7) == 0.0
    @test calcRepRatio(0.5, 3, 0.6, 5) == 0.8333333333333334
    @test calcRepRatio(0.6, 2, 0.9, 8) == 0.2
    @test calcRepRatio(0.6, 10, 0.8, 3) == 0.0625
    @test calcRepRatio(0.7, 1, 0.5, 6) == 9.0
    @test calcRepRatio(0.7, 6, 0.6, 6) == 1.8333333333333333
    @test calcRepRatio(0.8, 3, 0.9, 8) == 1.0
    @test calcRepRatio(0.8, 7, 0.1, 3) == 33.0
    @test calcRepRatio(0.8, 10, 0.1, 10) == 34.666666666666664
    @test calcRepRatio(0.9, 3, 0.5, 8) == Inf
    @test calcRepRatio(0.9, 7, 0.1, 9) == 202.0
    @test calcRepRatio(0.9, 8, 0.2, 9) == 90.0
    @test isnan(calcRepRatio(1.0, 8, 1.0, 3))

    weight = rand(10:30, 20)
    actualReps = rand(1:10, 20)
    actualRPE = rand(1:10, 20)
    targetReps = rand(1:10, 20)
    targetRPE = rand(1:10, 20)

    @test calcRepMax.(weight, actualReps, actualRPE, targetReps, targetRPE) ==
          weight .*
          calcIntensityRatio.(actualReps, actualRPE, targetReps, targetRPE)

    @test intensityArb(1) == 0.9724788485850433
    @test intensityArb(2) == 0.9419743782969102
    @test intensityArb(3) == 0.9133254178463787
    @test intensityArb(4) == 0.8863676653075695
    @test intensityArb(5) == 0.8609556607834696
    @test intensityArb(6) == 0.8369601606963508
    @test intensityArb(7) == 0.814265939255761
    @test intensityArb(8) == 0.7927699381639448
    @test intensityArb(9) == 0.7723797018614351
    @test intensityArb(10) == 0.753012048192771
    @test intensityArb(11) == 0.7345919341805627
    @test intensityArb(12) == 0.7170514842965725
    @test intensityArb(13) == 0.7003291547027102
    @test intensityArb(14) == 0.684369011771147
    @test intensityArb(15) == 0.6691201070592172
    @test intensityArb(16) == 0.6545359340227779
    @test intensityArb(17) == 0.6405739542630196
    @test intensityArb(18) == 0.6271951831409934
    @test intensityArb(19) == 0.61436382625791
    @test intensityArb(20) == 0.6020469596628537
end
