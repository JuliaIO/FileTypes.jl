using FileTypes
using Test: @testset, @test, @test_throws

@testset "test_files_types" begin
    @test matcher("files/example.jpeg").extension == "jpg"
    @test matcher("files/example.gif").extension == "gif"
    @test matcher("files/example.webp").extension == "webp"
    @test matcher("files/example.tiff").extension == "tif"
    @test matcher("files/example.mp3").extension == "mp3"
    @test matcher("files/example.ttf").extension == "ttf"
    @test matcher("files/example.m4v").extension == "m4v"
    @test matcher("files/example.tar.gz").extension == "gz"
    @test matcher("files/example.wasm").extension == "wasm"
    @test matcher("files/example.dex").extension == "dex"
    @test matcher("files/example.dey").extension == "dey"
    @test Is(FileType.Image,"files/example.png") == true
    @test is_extension_supported("png") == true
    @test is_mime_supported(MIME("image/jpeg")) == true
    @test_throws ErrorException Is(FileType.Image,"files")
end 

