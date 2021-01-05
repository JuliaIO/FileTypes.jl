module FileType

struct Types
    extension::String
    mime::MIME
end

include("Image.jl")
include("Audio.jl")
include("Font.jl")
include("Video.jl")
include("Application.jl")
include("Archive.jl")

export Is, matcher, is_extension_supported, is_mime_supported

const FileTypes=(FileType.Images.Image,FileType.Audios.Audio,FileType.Fonts.Font,FileType.Videos.Video,FileType.Applications.Application,FileType.Archives.Archive)

"""
    API to check if it is of given type or not.
    Args:
        FileType.FileTypes (object)  
        filename (String) i.e filepath 
    Returns:
        true if the filetype matches with the given object else flase
"""
function Is(obj,filename::String)::Bool
    try
        if isfile(filename)
            f=open(filename)
            data=read(f)
            close(f)
            for (key,value) in obj
                if value(data)
                    return true
                end
            end
            return false
        else
            throw(error("file not found"))
        end
    catch e
        return throw(error("something wrong happned"))
    end    
end


"""
    API to return FileType.Type object which has files as extension of the file and MIME of the file
    Args:
        filename (String) i.e filepath 
    Returns:
        FileType.Type object 
"""
function matcher(filename::String)::FileType.Types 
    try
        if isfile(filename)
            f=open(filename)
            data=read(f)
            close(f)
            for i in FileTypes
                for (key,value) in i
                    if value(data)
                        return key
                    end
                end
            end
        else
            throw(error("file not found"))
        end
    catch e
        throw(error("file not present"))
    end    
end

"""
    Checks if the given extension string is
    one of the supported by the library.
    Args:
        ext (String): file extension string. E.g: jpg, png, mp4, mp3
    Returns:
        true if the file extension is supported.
        Otherwise false.
"""
function is_extension_supported(ext::String)::Bool
    for kind in FileTypes
        for (key,value) in kind
            if key.extension==ext
                return true
            end
        end
    return false
    end
end


"""
    Checks if the given MIME type string is
    one of the supported by the library.
    Args:
        mime (String): MIME string. E.g: image/jpeg, video/mpeg
    Returns:
        true if the MIME type is supported.
        Otherwise false.
"""

function is_mime_supported(mime::MIME)::Bool
    for kind in FileTypes
        for (key,value) in kind
            if key.mime==mime
                return true
            end
        end
    return false
    end
end

end 