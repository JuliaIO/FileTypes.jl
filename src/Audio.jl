module Audios

using FileType
TypeMidi = FileType.Types("mid", "audio/midi")
TypeMp3  = FileType.Types("mp3", "audio/mpeg")
TypeM4a  = FileType.Types("m4a", "audio/m4a")
TypeOgg  = FileType.Types("ogg", "audio/ogg")
TypeFlac = FileType.Types("flac", "audio/x-flac")
TypeWav  = FileType.Types("wav", "audio/x-wav")
TypeAmr  = FileType.Types("amr", "audio/amr")
TypeAac  = FileType.Types("aac", "audio/aac")

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