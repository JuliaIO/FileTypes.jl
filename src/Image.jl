module Images

using FileType

TypeJpeg     = FileType.Types("jpg", MIME("image/jpeg"))
TypeJpeg2000 = FileType.Types("jp2", MIME("image/jp2"))
TypePng      = FileType.Types("png", MIME("image/png"))
TypeGif      = FileType.Types("gif", MIME("image/gif"))
TypeWebp     = FileType.Types("webp", MIME("image/webp"))
TypeCR2      = FileType.Types("cr2", MIME("image/x-canon-cr2"))
TypeTiff     = FileType.Types("tif", MIME("image/tiff"))
TypeBmp      = FileType.Types("bmp", MIME("image/bmp"))
TypeJxr      = FileType.Types("jxr", MIME("image/vnd.ms-photo"))
TypePsd      = FileType.Types("psd", MIME("image/vnd.adobe.photoshop"))
TypeIco      = FileType.Types("ico", MIME("image/vnd.microsoft.icon"))
TypeDwg      = FileType.Types("dwg", MIME("image/vnd.dwg"))


function Jpeg(buf)::Bool
	return length(buf) > 2 &&
		buf[1] == 0xFF &&
		buf[2] == 0xD8 &&
		buf[3] == 0xFF
end

function Jpeg2000(buf)::Bool 
	return length(buf) > 12 &&
		buf[1] == 0x0 &&
		buf[2] == 0x0 &&
		buf[3] == 0x0 &&
		buf[4] == 0xC &&
		buf[5] == 0x6A &&
		buf[6] == 0x50 &&
		buf[7] == 0x20 &&
		buf[8] == 0x20 &&
		buf[9] == 0xD &&
		buf[10] == 0xA &&
		buf[11] == 0x87 &&
		buf[12] == 0xA &&
		buf[13] == 0x0
end

function Png(buf)::Bool 
	return length(buf) > 3 &&
		buf[1] == 0x89 && buf[2] == 0x50 &&
		buf[3] == 0x4E && buf[4] == 0x47
end

function Gif(buf)::Bool
	return length(buf) > 2 &&
		buf[1] == 0x47 && buf[2] == 0x49 && buf[3] == 0x46
end

function Webp(buf)::Bool
	return length(buf) > 11 &&
		buf[9] == 0x57 && buf[10] == 0x45 &&
		buf[11] == 0x42 && buf[12] == 0x50
end

function CR2(buf)::Bool 
	return length(buf) > 10 &&
		((buf[1] == 0x49 && buf[2] == 0x49 && buf[3] == 0x2A && buf[4] == 0x0) || # Little Endian
			(buf[1] == 0x4D && buf[2] == 0x4D && buf[3] == 0x0 && buf[4] == 0x2A)) && # Big Endian
		buf[9] == 0x43 && buf[10] == 0x52 && # CR2 magic word
		buf[11] == 0x02 # CR2 major version
end

function Tiff(buf)::Bool
	return length(buf) > 10 &&
		((buf[1] == 0x49 && buf[2] == 0x49 && buf[3] == 0x2A && buf[4] == 0x0) || # Little Endian
			(buf[1] == 0x4D && buf[2] == 0x4D && buf[3] == 0x0 && buf[4] == 0x2A)) && # Big Endian
		!CR2(buf) # To avoid conflicts differentiate Tiff from CR2
end

function Bmp(buf)::Bool
	return length(buf) > 1 &&
		buf[1] == 0x42 &&
		buf[2] == 0x4D
end

function Jxr(buf)::Bool 
	return length(buf) > 2 &&
		buf[1] == 0x49 &&
		buf[2] == 0x49 &&
		buf[3] == 0xBC
end

function Psd(buf)::Bool 
	return length(buf) > 3 &&
		buf[1] == 0x38 && buf[2] == 0x42 &&
		buf[3] == 0x50 && buf[4] == 0x53
end

function Ico(buf)::Bool
	return length(buf) > 3 &&
		buf[1] == 0x00 && buf[2] == 0x00 &&
		buf[3] == 0x01 && buf[4] == 0x00
end

function Dwg(buf)::Bool
	return length(buf) > 3 &&
		buf[1] == 0x41 && buf[2] == 0x43 &&
		buf[3] == 0x31 && buf[4] == 0x30
end


Image = Dict(
	TypeJpeg     => Jpeg,
	TypeJpeg2000 => Jpeg2000,
	TypePng      => Png,
	TypeGif      => Gif,
	TypeWebp     => Webp,
	TypeCR2      => CR2,
	TypeTiff     => Tiff,
	TypeBmp      => Bmp,
	TypeJxr      => Jxr,
	TypePsd      => Psd,
	TypeIco      => Ico,
	TypeDwg      => Dwg,
)

end
