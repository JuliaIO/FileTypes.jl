module Applications


using FileType

TypeWasm = FileType.Types("wasm", "application/wasm")
TypeDex  = FileType.Types("dex", "application/vnd.android.dex")
TypeDey  = FileType.Types("dey", "application/vnd.android.dey")

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

end

