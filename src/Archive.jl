module Archives
include("ABSType.jl")


TypeEpub   = ABSType.Type("epub", MIME("application/epub+zip"))
TypeZip    = ABSType.Type("zip", MIME("application/zip"))
TypeTar    = ABSType.Type("tar", MIME("application/x-tar"))
TypeRar    = ABSType.Type("rar", MIME("application/vnd.rar"))
TypeGz     = ABSType.Type("gz", MIME("application/gzip"))
TypeBz2    = ABSType.Type("bz2", MIME("application/x-bzip2"))
Type7z     = ABSType.Type("7z", MIME("application/x-7z-compressed"))
TypeXz     = ABSType.Type("xz", MIME("application/x-xz"))
TypePdf    = ABSType.Type("pdf", MIME("application/pdf"))
TypeExe    = ABSType.Type("exe", MIME("application/vnd.microsoft.portable-executable"))
TypeSwf    = ABSType.Type("swf", MIME("application/x-shockwave-flash"))
TypeRtf    = ABSType.Type("rtf", MIME("application/rtf"))
TypeEot    = ABSType.Type("eot", MIME("application/octet-stream"))
TypePs     = ABSType.Type("ps", MIME("application/postscript"))
TypeSqlite = ABSType.Type("sqlite", MIME("application/vnd.sqlite3"))
TypeNes    = ABSType.Type("nes", MIME("application/x-nintendo-nes-rom"))
TypeCrx    = ABSType.Type("crx", MIME("application/x-google-chrome-extension"))
TypeCab    = ABSType.Type("cab", MIME("application/vnd.ms-cab-compressed"))
TypeDeb    = ABSType.Type("deb", MIME("application/vnd.debian.binary-package"))
TypeAr     = ABSType.Type("ar", MIME("application/x-unix-archive"))
TypeZ      = ABSType.Type("Z", MIME("application/x-compress"))
TypeLz     = ABSType.Type("lz", MIME("application/x-lzip"))
TypeRpm    = ABSType.Type("rpm", MIME("application/x-rpm"))
TypeElf    = ABSType.Type("elf", MIME("application/x-executable"))
TypeDcm    = ABSType.Type("dcm", MIME("application/dicom"))
TypeIso    = ABSType.Type("iso", MIME("application/x-iso9660-image"))
TypeMachO  = ABSType.Type("macho", MIME("application/x-mach-binary")) # Mach-O binaries have no common extension.

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

end

