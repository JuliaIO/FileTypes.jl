using FileType
using Test: @testset, @test, @test_throws

@testset "test_files_types" begin
    @test Match("files/example.jpeg").extension == "jpg"
    @test Match("files/example.gif").extension == "gif"
    @test Match("files/example.webp").extension == "webp"
    @test Match("files/example.tiff").extension == "tif"
    @test Match("files/example.mp3").extension == "mp3"
    @test Match("files/example.ttf").extension == "ttf"
    @test Match("files/example.m4v").extension == "m4v"
    @test Match("files/example.tar.gz").extension == "gz"
    @test Match("files/example.wasm").extension == "wasm"
    @test Match("files/example.dex").extension == "dex"
    @test Match("files/example.dey").extension == "dey"
    @test Is(FileType.Images.Image,"files/example.png") == true
    @test IsExtensionSupported("png") == true
    @test IsMimeSupported("image/jpeg") == true
    @test_throws ErrorException Is(FileType.Images.Image,"files")
end 

