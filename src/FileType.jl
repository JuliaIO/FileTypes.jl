module FileType

struct Type
    extension::String
    mime::MIME
end


TypeEpub   = Type("epub", MIME("application/epub+zip"))
TypeZip    = Type("zip", MIME("application/zip"))
TypeTar    = Type("tar", MIME("application/x-tar"))
TypeRar    = Type("rar", MIME("application/vnd.rar"))
TypeGz     = Type("gz", MIME("application/gzip"))
TypeBz2    = Type("bz2", MIME("application/x-bzip2"))
Type7z     = Type("7z", MIME("application/x-7z-compressed"))
TypeXz     = Type("xz", MIME("application/x-xz"))
TypePdf    = Type("pdf", MIME("application/pdf"))
TypeExe    = Type("exe", MIME("application/vnd.microsoft.portable-executable"))
TypeSwf    = Type("swf", MIME("application/x-shockwave-flash"))
TypeRtf    = Type("rtf", MIME("application/rtf"))
TypeEot    = Type("eot", MIME("application/octet-stream"))
TypePs     = Type("ps", MIME("application/postscript"))
TypeSqlite = Type("sqlite", MIME("application/vnd.sqlite3"))
TypeNes    = Type("nes", MIME("application/x-nintendo-nes-rom"))
TypeCrx    = Type("crx", MIME("application/x-google-chrome-extension"))
TypeCab    = Type("cab", MIME("application/vnd.ms-cab-compressed"))
TypeDeb    = Type("deb", MIME("application/vnd.debian.binary-package"))
TypeAr     = Type("ar", MIME("application/x-unix-archive"))
TypeZ      = Type("Z", MIME("application/x-compress"))
TypeLz     = Type("lz", MIME("application/x-lzip"))
TypeRpm    = Type("rpm", MIME("application/x-rpm"))
TypeElf    = Type("elf", MIME("application/x-executable"))
TypeDcm    = Type("dcm", MIME("application/dicom"))
TypeIso    = Type("iso", MIME("application/x-iso9660-image"))
TypeMachO  = Type("macho", MIME("application/x-mach-binary")) # Mach-O binaries have no common extension.

function Epub(buf)::Bool
	return length(buf) > 57 &&
		buf[1] == 0x50 && buf[2] == 0x4B && buf[3] == 0x3 && buf[4] == 0x4 &&
		buf[31] == 0x6D && buf[32] == 0x69 && buf[33] == 0x6D && buf[34] == 0x65 &&
		buf[35] == 0x74 && buf[36] == 0x79 && buf[37] == 0x70 && buf[38] == 0x65 &&
		buf[39] == 0x61 && buf[40] == 0x70 && buf[41] == 0x70 && buf[42] == 0x6C &&
		buf[43] == 0x69 && buf[44] == 0x63 && buf[45] == 0x61 && buf[46] == 0x74 &&
		buf[47] == 0x69 && buf[48] == 0x6F && buf[49] == 0x6E && buf[50] == 0x2F &&
		buf[51] == 0x65 && buf[52] == 0x70 && buf[53] == 0x75 && buf[54] == 0x62 &&
		buf[55] == 0x2B && buf[56] == 0x7A && buf[57] == 0x69 && buf[58] == 0x70
end

function Zip(buf)::Bool
	return length(buf) > 3 &&
		buf[1] == 0x50 && buf[2] == 0x4B &&
		(buf[3] == 0x3 || buf[3] == 0x5 || buf[3] == 0x7) &&
		(buf[4] == 0x4 || buf[4] == 0x6 || buf[4] == 0x8)
end

function Tar(buf)::Bool
	return length(buf) > 261 &&
		buf[258] == 0x75 && buf[259] == 0x73 &&
		buf[260] == 0x74 && buf[261] == 0x61 &&
		buf[262] == 0x72
end


function Rar(buf)::Bool
	return length(buf) > 6 &&
		buf[1] == 0x52 && buf[2] == 0x61 && buf[3] == 0x72 &&
		buf[4] == 0x21 && buf[5] == 0x1A && buf[6] == 0x7 &&
		(buf[7] == 0x0 || buf[7] == 0x1)
end

function Gz(buf)::Bool 
	return length(buf) > 2 &&
		buf[1] == 0x1F && buf[2] == 0x8B && buf[3] == 0x8
end

function Bz2(buf)::Bool 
	return length(buf) > 2 &&
		buf[1] == 0x42 && buf[2] == 0x5A && buf[3] == 0x68
end

function SevenZ(buf)::Bool 
	return length(buf) > 5 &&
		buf[1] == 0x37 && buf[2] == 0x7A && buf[3] == 0xBC &&
		buf[4] == 0xAF && buf[5] == 0x27 && buf[6] == 0x1C
end

function Pdf(buf)::Bool
	return length(buf) > 3 &&
		buf[1] == 0x25 && buf[2] == 0x50 &&
		buf[3] == 0x44 && buf[4] == 0x46
end

function Exe(buf)::Bool
	return length(buf) > 1 &&
		buf[1] == 0x4D && buf[2] == 0x5A
end

function Swf(buf)::Bool 
	return length(buf) > 2 &&
		(buf[1] == 0x43 || buf[1] == 0x46) &&
		buf[2] == 0x57 && buf[3] == 0x53
end

function Rtf(buf)::Bool 
	return length(buf) > 4 &&
		buf[1] == 0x7B && buf[1] == 0x5C &&
		buf[2] == 0x72 && buf[3] == 0x74 &&
		buf[4] == 0x66
end

function Nes(buf)::Bool 
	return length(buf) > 3 &&
		buf[1] == 0x4E && buf[2] == 0x45 &&
		buf[3] == 0x53 && buf[4] == 0x1A
end

function Crx(buf)::Bool
	return length(buf) > 3 &&
		buf[1] == 0x43 && buf[2] == 0x72 &&
		buf[3] == 0x32 && buf[4] == 0x34
end

function Cab(buf)::Bool 
	return length(buf) > 3 &&
		((buf[1] == 0x4D && buf[2] == 0x53 && buf[3] == 0x43 && buf[4] == 0x46) ||
			(buf[1] == 0x49 && buf[2] == 0x53 && buf[3] == 0x63 && buf[4] == 0x28))
end

function Eot(buf)::Bool
	return length(buf) > 35 &&
		buf[35] == 0x4C && buf[36] == 0x50 &&
		((buf[9] == 0x02 && buf[10] == 0x00 &&
			buf[11] == 0x01) || (buf[9] == 0x01 &&
			buf[10] == 0x00 && buf[11] == 0x00) ||
			(buf[9] == 0x02 && buf[10] == 0x00 &&
				buf[11] == 0x02))
end

function Ps(buf)::Bool 
	return length(buf) > 1 &&
		buf[1] == 0x25 && buf[2] == 0x21
end

function Xz(buf)::Bool
	return length(buf) > 5 &&
		buf[1] == 0xFD && buf[2] == 0x37 &&
		buf[3] == 0x7A && buf[4] == 0x58 &&
		buf[5] == 0x5A && buf[6] == 0x00
end

function Sqlite(buf)::Bool
	return length(buf) > 3 &&
		buf[1] == 0x53 && buf[2] == 0x51 &&
		buf[3] == 0x4C && buf[4] == 0x69
end

function Deb(buf)::Bool
	return length(buf) > 20 &&
		buf[1] == 0x21 && buf[2] == 0x3C && buf[3] == 0x61 &&
		buf[4] == 0x72 && buf[5] == 0x63 && buf[6] == 0x68 &&
		buf[7] == 0x3E && buf[8] == 0x0A && buf[9] == 0x64 &&
		buf[10] == 0x65 && buf[11] == 0x62 && buf[12] == 0x69 &&
		buf[13] == 0x61 && buf[14] == 0x6E && buf[15] == 0x2D &&
		buf[16] == 0x62 && buf[17] == 0x69 && buf[18] == 0x6E &&
		buf[19] == 0x61 && buf[20] == 0x72 && buf[21] == 0x79
end

function Ar(buf)::Bool
	return length(buf) > 6 &&
		buf[1] == 0x21 && buf[2] == 0x3C &&
		buf[3] == 0x61 && buf[4] == 0x72 &&
		buf[5] == 0x63 && buf[6] == 0x68 &&
		buf[7] == 0x3E
end

function Z(buf)::Bool 
	return length(buf) > 1 &&
		((buf[1] == 0x1F && buf[2] == 0xA0) ||
			(buf[1] == 0x1F && buf[2] == 0x9D))
end

function Lz(buf)::Bool 
	return length(buf) > 3 &&
		buf[1] == 0x4C && buf[2] == 0x5A &&
		buf[3] == 0x49 && buf[4] == 0x50
end

function Rpm(buf)::Bool
	return length(buf) > 96 &&
		buf[1] == 0xED && buf[2] == 0xAB &&
		buf[3] == 0xEE && buf[4] == 0xDB
end

function Elf(buf)::Bool
	return length(buf) > 52 &&
		buf[1] == 0x7F && buf[2] == 0x45 &&
		buf[3] == 0x4C && buf[4] == 0x46
end

function Dcm(buf)::Bool
	return length(buf) > 131 &&
		buf[128] == 0x44 && buf[129] == 0x49 &&
		buf[130] == 0x43 && buf[131] == 0x4D
end

function Iso(buf)::Bool 
	return length(buf) > 32773 &&
		buf[32770] == 0x43 && buf[32771] == 0x44 &&
		buf[32772] == 0x30 && buf[32773] == 0x30 &&
		buf[32774] == 0x31
end

function MachO(buf)::Bool 
	return length(buf) > 3 && ((buf[1] == 0xFE && buf[2] == 0xED && buf[3] == 0xFA && buf[4] == 0xCF) ||
		(buf[1] == 0xFE && buf[2] == 0xED && buf[3] == 0xFA && buf[4] == 0xCE) ||
		(buf[1] == 0xBE && buf[2] == 0xBA && buf[3] == 0xFE && buf[4] == 0xCA) ||
		#Big endian versions below here...
		(buf[1] == 0xCF && buf[2] == 0xFA && buf[3] == 0xED && buf[4] == 0xFE) ||
		(buf[1] == 0xCE && buf[2] == 0xFA && buf[3] == 0xED && buf[4] == 0xFE) ||
		(buf[1] == 0xCA && buf[2] == 0xFE && buf[3] == 0xBA && buf[4] == 0xBE))
end

Archive = Dict(
	TypeEpub=>   Epub,
	TypeZip=>  Zip,
	TypeTar=>    Tar,
	TypeRar=>    Rar,
	TypeGz=>     Gz,
	TypeBz2=>    Bz2,
	Type7z=>     SevenZ,
	TypeXz=>     Xz,
	TypePdf=>    Pdf,
	TypeExe=>    Exe,
	TypeSwf=>    Swf,
	TypeRtf=>    Rtf,
	TypeEot=>    Eot,
	TypePs=>     Ps,
	TypeSqlite=> Sqlite,
	TypeNes=>    Nes,
	TypeCrx=>    Crx,
	TypeCab=>    Cab,
	TypeDeb=>    Deb,
	TypeAr=>     Ar,
	TypeZ=>      Z,
	TypeLz=>     Lz,
	TypeRpm=>    Rpm,
	TypeElf=>    Elf,
	TypeDcm=>    Dcm,
	TypeIso=>    Iso,
	TypeMachO=>  MachO,
)



TypeWoff  = Type("woff", MIME("application/font-woff"))
TypeWoff2 = Type("woff2", MIME("application/font-woff"))
TypeTtf   = Type("ttf", MIME("application/font-sfnt"))
TypeOtf   = Type("otf", MIME("application/font-sfnt"))

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

Font= Dict(
	TypeWoff =>  Woff,
	TypeWoff2=>  Woff2,
	TypeTtf  =>  Ttf,
	TypeOtf  =>  Otf,
)


TypeJpeg     = Type("jpg", MIME("image/jpeg"))
TypeJpeg2000 = Type("jp2", MIME("image/jp2"))
TypePng      = Type("png", MIME("image/png"))
TypeGif      = Type("gif", MIME("image/gif"))
TypeWebp     = Type("webp", MIME("image/webp"))
TypeCR2      = Type("cr2", MIME("image/x-canon-cr2"))
TypeTiff     = Type("tif", MIME("image/tiff"))
TypeBmp      = Type("bmp", MIME("image/bmp"))
TypeJxr      = Type("jxr", MIME("image/vnd.ms-photo"))
TypePsd      = Type("psd", MIME("image/vnd.adobe.photoshop"))
TypeIco      = Type("ico", MIME("image/vnd.microsoft.icon"))
TypeDwg      = Type("dwg", MIME("image/vnd.dwg"))


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




TypeM4v  = Type("m4v", MIME("video/x-m4v"))
TypeMov  = Type("mov", MIME("video/quicktime"))
TypeAvi  = Type("avi", MIME("video/x-msvideo"))
TypeWmv  = Type("wmv", MIME("video/x-ms-wmv"))
TypeMpeg = Type("mpg", MIME("video/mpeg"))
TypeFlv  = Type("flv", MIME("video/x-flv"))
Type3gp  = Type("3gp", MIME("video/3gpp"))

function M4v(buf)::Bool
	return length(buf) > 10 &&
		buf[5] == 0x66 && buf[6] == 0x74 &&
		buf[7] == 0x79 && buf[8] == 0x70 &&
		buf[9] == 0x4D && buf[10] == 0x34 &&
		buf[11] == 0x56
end


function Mov(buf)::Bool 
	return length(buf) > 15 && ((buf[1] == 0x0 && buf[2] == 0x0 &&
		buf[3] == 0x0 && buf[4] == 0x14 &&
		buf[5] == 0x66 && buf[6] == 0x74 &&
		buf[7] == 0x79 && buf[8] == 0x70) ||
		(buf[5] == 0x6d && buf[6] == 0x6f && buf[7] == 0x6f && buf[8] == 0x76) ||
		(buf[5] == 0x6d && buf[6] == 0x64 && buf[7] == 0x61 && buf[8] == 0x74) ||
		(buf[13] == 0x6d && buf[14] == 0x64 && buf[15] == 0x61 && buf[16] == 0x74))
end

function Avi(buf)::Bool
	return length(buf) > 10 &&
		buf[1] == 0x52 && buf[2] == 0x49 &&
		buf[3] == 0x46 && buf[4] == 0x46 &&
		buf[9] == 0x41 && buf[10] == 0x56 &&
		buf[11] == 0x49
end

function Wmv(buf)::Bool
	return length(buf) > 9 &&
		buf[1] == 0x30 && buf[2] == 0x26 &&
		buf[3] == 0xB2 && buf[4] == 0x75 &&
		buf[5] == 0x8E && buf[6] == 0x66 &&
		buf[7] == 0xCF && buf[8] == 0x11 &&
		buf[9] == 0xA6 && buf[10] == 0xD9
end

function Mpeg(buf)::Bool
	return length(buf) > 3 &&
		buf[1] == 0x0 && buf[2] == 0x0 &&
		buf[3] == 0x1 && buf[4] >= 0xb0 &&
		buf[4] <= 0xbf
end

function Flv(buf)::Bool
	return length(buf) > 3 &&
		buf[1] == 0x46 && buf[2] == 0x4C &&
		buf[3] == 0x56 && buf[4] == 0x01
end

function Match3gp(buf)::Bool
	return length(buf) > 10 &&
		buf[5] == 0x66 && buf[6] == 0x74 && buf[7] == 0x79 &&
		buf[8] == 0x70 && buf[9] == 0x33 && buf[10] == 0x67 &&
		buf[11] == 0x70
end


Video = Dict(
	TypeM4v=>M4v,
	TypeMov=>Mov,
	TypeAvi=>Avi,
	TypeWmv=>Wmv,
	TypeMpeg=>Mpeg,
	TypeFlv=>Flv,
	Type3gp=>Match3gp,
)


TypeWasm = Type("wasm", MIME("application/wasm"))
TypeDex  = Type("dex", MIME("application/vnd.android.dex"))
TypeDey  = Type("dey", MIME("application/vnd.android.dey"))

# Wasm detects a Web Assembly 1.0 filetype.
function Wasm(buf)::Bool
	# WASM has starts with `\0asm`, followed by the version.
	# http://webassembly.github.io/spec/core/binary/modules.html#binary-magic
	return length(buf) >= 8 &&
		buf[1] == 0x00 && buf[2] == 0x61 &&
		buf[3] == 0x73 && buf[4] == 0x6D &&
		buf[5] == 0x01 && buf[6] == 0x00 &&
		buf[7] == 0x00 && buf[8] == 0x00
end

# Dex detects dalvik executable(DEX)
function Dex(buf)::Bool
	# https://source.android.com/devices/tech/dalvik/dex-format#dex-file-magic
	return length(buf) > 36 &&
		# magic
		buf[1] == 0x64 && buf[2] == 0x65 && buf[3] == 0x78 && buf[4] == 0x0A &&
		# file size
		buf[37] == 0x70
end

# Dey Optimized Dalvik Executable(ODEX)
function Dey(buf)::Bool
	return length(buf) > 100 &&
		# dey magic
		buf[1] == 0x64 && buf[2] == 0x65 && buf[3] == 0x79 && buf[4] == 0x0A &&
		# dex
		Dex(buf[41:101])
end

Application = Dict(
	TypeWasm=>Wasm,
	TypeDex=>Dex,
	TypeDey=>Dey,
)


TypeMidi = Type("mid", MIME("audio/midi"))
TypeMp3  = Type("mp3", MIME("audio/mpeg"))
TypeM4a  = Type("m4a", MIME("audio/m4a"))
TypeOgg  = Type("ogg", MIME("audio/ogg"))
TypeFlac = Type("flac", MIME("audio/x-flac"))
TypeWav  = Type("wav", MIME("audio/x-wav"))
TypeAmr  = Type("amr", MIME("audio/amr"))
TypeAac  = Type("aac", MIME("audio/aac"))

function Midi(buf)::Bool
	return length(buf) > 3 &&
		buf[1] == 0x4D && buf[2] == 0x54 &&
		buf[3] == 0x68 && buf[4] == 0x64
end

function Mp3(buf)::Bool 
	return length(buf) > 2 &&
		((buf[1] == 0x49 && buf[2] == 0x44 && buf[3] == 0x33) ||
			(buf[1] == 0xFF && buf[2] == 0xfb))
end

function M4a(buf)::Bool 
	return length(buf) > 10 &&
		((buf[5] == 0x66 && buf[6] == 0x74 && buf[7] == 0x79 &&
			buf[8] == 0x70 && buf[9] == 0x4D && buf[10] == 0x34 && buf[11] == 0x41) ||
			(buf[1] == 0x4D && buf[2] == 0x34 && buf[3] == 0x41 && buf[4] == 0x20))
end

function Ogg(buf)::Bool 
	return length(buf) > 3 &&
		buf[1] == 0x4F && buf[2] == 0x67 &&
		buf[3] == 0x67 && buf[4] == 0x53
end

function Flac(buf)::Bool 
	return length(buf) > 3 &&
		buf[1] == 0x66 && buf[2] == 0x4C &&
		buf[3] == 0x61 && buf[4] == 0x43
end

function Wav(buf)::Bool 
	return length(buf) > 11 &&
		buf[1] == 0x52 && buf[2] == 0x49 &&
		buf[3] == 0x46 && buf[4] == 0x46 &&
		buf[9] == 0x57 && buf[10] == 0x41 &&
		buf[11] == 0x56 && buf[12] == 0x45
end

function Amr(buf)::Bool 
	return length(buf) > 11 &&
		buf[1] == 0x23 && buf[2] == 0x21 &&
		buf[3] == 0x41 && buf[4] == 0x4D &&
		buf[5] == 0x52 && buf[6] == 0x0A
end

function Aac(buf)::Bool
	return length(buf) > 1 &&
		((buf[1] == 0xFF && buf[2] == 0xF1) ||
			(buf[1] == 0xFF && buf[2] == 0xF9))
end


Audio = Dict(
	TypeMidi => Midi,
	TypeMp3 =>  Mp3,
	TypeM4a => M4a,
	TypeOgg =>  Ogg,
	TypeFlac => Flac,
	TypeWav =>  Wav,
	TypeAmr =>  Amr,
	TypeAac =>  Aac,
)


end 