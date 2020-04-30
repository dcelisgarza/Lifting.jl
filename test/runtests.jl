using SafeTestsets

@safetestset "Maths" begin
    include("./mathsTests.jl")
end

@safetestset "Structs" begin
    include("./structTests.jl")
end

@safetestset "IO" begin
    include("./ioTests.jl")
end
