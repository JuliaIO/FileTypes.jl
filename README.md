Small and dependency free [Julia](https://julialang.org/) package to infer file and MIME type checking the [magic numbers](<https://en.wikipedia.org/wiki/Magic_number_(programming)#Magic_numbers_in_files>) signature.


## Features

- Supports a [wide range](#supported-types) of file types
- Provides file extension and proper MIME type
- File discovery by extension or MIME type
- File discovery by class (image, video, audio...)
- Provides a bunch of helpers and file matching shortcuts
- Simple and semantic API

## Installation

```bash
  using Pkg
  Pkg.add(github_repo_url)
    
```

## General Info
currently under developement.

Take a look on [contribution](##contribution)



## Examples

#### Simple file type checking

```julia
  using FileType

  julia> kind = Match("example.gif")
  FileType.Types("gif", "image/gif")

  julia> kind.extension
  "gif"

  julia> kind.mime
  "image/gif"

```

#### Check type class

```julia
  using FileType
  julia> Is(FileType.Images.Image,"example.gif")
  true
```

#### Add additional file type matchers

```julia
  using FileType

  julia> IsMimeSupported("image/jpeg")
  true

  julia> IsExtensionSupported("png")
  true

```

## Supported types

#### Image

- **jpg** - `image/jpeg`
- **png** - `image/png`
- **gif** - `image/gif`
- **webp** - `image/webp`
- **cr2** - `image/x-canon-cr2`
- **tif** - `image/tiff`
- **bmp** - `image/bmp`
- **heif** - `image/heif`
- **jxr** - `image/vnd.ms-photo`
- **psd** - `image/vnd.adobe.photoshop`
- **ico** - `image/vnd.microsoft.icon`
- **dwg** - `image/vnd.dwg`

#### Video

- **m4v** - `video/x-m4v`
- **webm** - `video/webm`
- **mov** - `video/quicktime`
- **avi** - `video/x-msvideo`
- **wmv** - `video/x-ms-wmv`
- **mpg** - `video/mpeg`
- **flv** - `video/x-flv`
- **3gp** - `video/3gpp`

#### Audio

- **mid** - `audio/midi`
- **mp3** - `audio/mpeg`
- **m4a** - `audio/m4a`
- **ogg** - `audio/ogg`
- **flac** - `audio/x-flac`
- **wav** - `audio/x-wav`
- **amr** - `audio/amr`
- **aac** - `audio/aac`

#### Archive

- **epub** - `application/epub+zip`
- **zip** - `application/zip`
- **tar** - `application/x-tar`
- **rar** - `application/vnd.rar`
- **gz** - `application/gzip`
- **bz2** - `application/x-bzip2`
- **7z** - `application/x-7z-compressed`
- **xz** - `application/x-xz`
- **pdf** - `application/pdf`
- **exe** - `application/vnd.microsoft.portable-executable`
- **swf** - `application/x-shockwave-flash`
- **rtf** - `application/rtf`
- **iso** - `application/x-iso9660-image`
- **eot** - `application/octet-stream`
- **ps** - `application/postscript`
- **sqlite** - `application/vnd.sqlite3`
- **nes** - `application/x-nintendo-nes-rom`
- **crx** - `application/x-google-chrome-extension`
- **cab** - `application/vnd.ms-cab-compressed`
- **deb** - `application/vnd.debian.binary-package`
- **ar** - `application/x-unix-archive`
- **Z** - `application/x-compress`
- **lz** - `application/x-lzip`
- **rpm** - `application/x-rpm`
- **elf** - `application/x-executable`
- **dcm** - `application/dicom`

#### Documents

- **doc** - `application/msword`
- **xls** - `application/vnd.ms-excel`
- **ppt** - `application/vnd.ms-powerpoint`


#### Font

- **woff** - `application/font-woff`
- **woff2** - `application/font-woff`
- **ttf** - `application/font-sfnt`
- **otf** - `application/font-sfnt`

#### Application

- **wasm** - `application/wasm`
- **dex** - `application/vnd.android.dex`
- **dey** - `application/vnd.android.dey`

## contribution

- Currently, the ``Is`` API takes a parameter as FileType.Images.The image which is a dictionary of all the supported image. I think it should be an (immutable)namedtuple as the custom filetype should be of unknown type only.    
- There should be an API to add new custom Types.
- Currently, Filetypes(publicly accessed) is a tuple that should be an Array as this library has to provide an API to add a new type, and that new type could we handled in ``Is`` API like FileType.Unknown.
- The FileType.Images.Image should be FileType.Images
- I am confused with implicit exception handling.
- I have no idea about Julia naming convention.

## License

MIT - Prince Roshan
