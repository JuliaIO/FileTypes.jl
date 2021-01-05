module Videos


using FileType

TypeM4v  = FileType.Types("m4v", MIME("video/x-m4v"))
TypeMov  = FileType.Types("mov", MIME("video/quicktime"))
TypeAvi  = FileType.Types("avi", MIME("video/x-msvideo"))
TypeWmv  = FileType.Types("wmv", MIME("video/x-ms-wmv"))
TypeMpeg = FileType.Types("mpg", MIME("video/mpeg"))
TypeFlv  = FileType.Types("flv", MIME("video/x-flv"))
Type3gp  = FileType.Types("3gp", MIME("video/3gpp"))

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

end
