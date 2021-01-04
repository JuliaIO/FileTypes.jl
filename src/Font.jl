module Fonts
using FileType

TypeWoff  = FileType.Types("woff", "application/font-woff")
TypeWoff2 = FileType.Types("woff2", "application/font-woff")
TypeTtf   = FileType.Types("ttf", "application/font-sfnt")
TypeOtf   = FileType.Types("otf", "application/font-sfnt")

function Woff(buf)::Bool
	return length(buf) > 7 &&
		buf[1] == 0x77 && buf[2] == 0x4F &&
		buf[3] == 0x46 && buf[4] == 0x46 &&
		buf[5] == 0x00 && buf[6] == 0x01 &&
		buf[7] == 0x00 && buf[8] == 0x00
end

function Woff2(buf)::Bool
	return length(buf) > 7 &&
		buf[1] == 0x77 && buf[2] == 0x4F &&
		buf[3] == 0x46 && buf[4] == 0x32 &&
		buf[5] == 0x00 && buf[6] == 0x01 &&
		buf[7] == 0x00 && buf[8] == 0x00
end

function Ttf(buf)::Bool
	return length(buf) > 4 &&
		buf[1] == 0x00 && buf[2] == 0x01 &&
		buf[3] == 0x00 && buf[4] == 0x00 &&
		buf[5] == 0x00
end

function Otf(buf)::Bool 
	return length(buf) > 4 &&
		buf[1] == 0x4F && buf[2] == 0x54 &&
		buf[3] == 0x54 && buf[4] == 0x4F &&
		buf[5] == 0x00
end

Font = Dict(
	TypeWoff =>  Woff,
	TypeWoff2=>  Woff2,
	TypeTtf  =>  Ttf,
	TypeOtf  =>  Otf,
)

end
