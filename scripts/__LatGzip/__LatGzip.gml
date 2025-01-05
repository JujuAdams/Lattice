// Feather disable all

/// @param path

function __LatGzipUnzipFile(_path)
{
    if (not file_exists(_path))
    {
        __LatError($"{_path} not found");
        return undefined;
    }
    
    var _buffer = buffer_load(_path);
    var _result = __LatGzipUnzipBuffer(_buffer);
    buffer_delete(_buffer);
    
    return _result;
}

/// @param buffer

function __LatGzipUnzipBuffer(_buffer)
{
    var _directory = game_save_id + "\\";
    var _zipName   = "LatticeGzipTemp1";
    var _fileName  = "LatticeGzipTemp2";
    
    var _info = __LatGzipInfo(_buffer);
    if (_info < 0)
    {
        __LatError($"Error reading Gzip data");
        return undefined;
    }
    
    var _zip = new __LatClassZip();
    _zip.__AddData(_buffer, _info.__dataOffset, _info.__csize, _info.__usize, 8, _info.__crc, _fileName, _info.__mtime);
    var _zippedBuffer = _zip.__GenerateBuffer();
    _zip.__Destroy();
    
    if (_zippedBuffer < 0)
    {
        __LatError($"Error compressing Gzip data");
        return "";
    }
    
    buffer_save(_zippedBuffer, _directory + _zipName);
    buffer_delete(_zippedBuffer);
    
    if (zip_unzip(_directory + _zipName, _directory) < 1)
    {
        __LatError($"Error decompressing Gzip data");
        return "";
    }
    
    file_delete(_directory + _zipName);
    
    var _result = buffer_load(_directory + _fileName);
    file_delete(_directory + _fileName);
    
    return _result;
}

function __LatGzipInfo(_buffer)
{
    var _result = {
        __cmethod:    undefined,
        __flags:      undefined,
        __mtime:      undefined,
        __xflags:     undefined,
        __os:         undefined,
        __ftext:      undefined,
        __fname:      undefined,
        __fcomment:   undefined,
        __fhcrc:      undefined,
        __dataOffset: undefined,
        __csize:      undefined,
        __crc:        undefined,
        __usize:      undefined,
    };
    
    buffer_seek(_buffer, buffer_seek_start, 0);
    
    var _header = buffer_read(_buffer, buffer_u16);
    
    if (_header != 0x8B1F)
    {
        __LatError("Not a Gzip file");
        return _result;
    }
    
    with(_result)
    {
        __cmethod = buffer_read(_buffer, buffer_u8);
        __flags   = buffer_read(_buffer, buffer_u8);
        __mtime   = __LatDateFromUnix(buffer_read(_buffer, buffer_s32));
        __xflags  = buffer_read(_buffer, buffer_u8);
        __os      = buffer_read(_buffer, buffer_u8);
        __ftext   = __flags & 1;
        
        if (__flags & 4)
        {
            var _fextra = buffer_read(_buffer, buffer_u16);
            buffer_seek(_buffer, buffer_seek_relative, _fextra);
        }
        
        if (__flags & 8)
        {
            __fname = buffer_read(_buffer, buffer_string);
        }

        if (__flags & 16)
        {
            __fcomment = buffer_read(_buffer, buffer_string);
        }

        if (__flags & 2)
        {
            __fhcrc = buffer_read(_buffer, buffer_u16);
        }
        
        __dataOffset = buffer_tell(_buffer);
        buffer_seek(_buffer, buffer_seek_end, 8);
        __csize = buffer_tell(_buffer) - __dataOffset;
    
        __crc   = buffer_read(_buffer, buffer_u32);
        __usize = buffer_read(_buffer, buffer_u32);
    }

    return _result;
}

function __LatClassZip() constructor
{
    __csize   = 0;
    __usize   = 0;
    __entries = 0;
    
    __dataBuffer      = buffer_create(1024, buffer_grow, 1);
    __directoryBuffer = buffer_create(1024, buffer_grow, 1);
    
    __AddData = function(_data, _offset, _csize, _usize, _cmethod, _crc, _fname, _mtime)
    {
        var _fnameLength = string_byte_length(_fname);
        var _headerOffset = buffer_tell(__dataBuffer);
        
        buffer_write(__dataBuffer, buffer_u32,  $4034b50); //signature
        buffer_write(__dataBuffer, buffer_u16,  20); //version needed
        buffer_write(__dataBuffer, buffer_u16,  0); //general flag
        buffer_write(__dataBuffer, buffer_u16,  _cmethod); //compression method
        buffer_write(__dataBuffer, buffer_u16,  __LatDateToDosTime(_mtime)); //mod time
        buffer_write(__dataBuffer, buffer_u16,  __LatDateToDosDate(_mtime)); //mod date
        buffer_write(__dataBuffer, buffer_u32,  _crc); //crc
        buffer_write(__dataBuffer, buffer_u32,  _csize); //compressed size
        buffer_write(__dataBuffer, buffer_u32,  _usize); //uncompressed size
        buffer_write(__dataBuffer, buffer_u16,  _fnameLength); //file name length
        buffer_write(__dataBuffer, buffer_u16,  0); //extra length
        buffer_write(__dataBuffer, buffer_text, _fname); //file name
        
        if (_usize > 0)
        {
            if (buffer_tell(__dataBuffer) + _csize < buffer_get_size(__dataBuffer))
            {
                buffer_resize(__dataBuffer, buffer_tell(__dataBuffer) + _csize);
            }
            
            buffer_copy(_data, _offset, _csize, __dataBuffer, buffer_tell(__dataBuffer));
            buffer_seek(__dataBuffer, buffer_seek_relative, _csize);
        }
        
        buffer_write(__directoryBuffer, buffer_u32,  $2014b50); //signature
        buffer_write(__directoryBuffer, buffer_u16,  63); //OS (15-8) - version made by (7 - 0), 6.3
        buffer_write(__directoryBuffer, buffer_u16,  20); //version required 2.0
        buffer_write(__directoryBuffer, buffer_u16,  0); //general flag
        buffer_write(__directoryBuffer, buffer_u16,  _cmethod); //compression method
        buffer_write(__directoryBuffer, buffer_u16,  __LatDateToDosTime(_mtime)); //mod time
        buffer_write(__directoryBuffer, buffer_u16,  __LatDateToDosDate(_mtime)); //mod date
        buffer_write(__directoryBuffer, buffer_u32,  _crc); //crc
        buffer_write(__directoryBuffer, buffer_u32,  _csize); //compressed size
        buffer_write(__directoryBuffer, buffer_u32,  _usize); //uncompressed size
        buffer_write(__directoryBuffer, buffer_u16,  _fnameLength); //file name length
        buffer_write(__directoryBuffer, buffer_u16,  0); //extra length
        buffer_write(__directoryBuffer, buffer_u16,  0); //comment length
        buffer_write(__directoryBuffer, buffer_u16,  0); //disk start n
        buffer_write(__directoryBuffer, buffer_u16,  0); //internal file attributes
        buffer_write(__directoryBuffer, buffer_u32,  0); //external file attributes
        buffer_write(__directoryBuffer, buffer_u32,  _headerOffset); //local file header offset
        buffer_write(__directoryBuffer, buffer_text, _fname); //zip name
        
        __csize += _csize;
        __usize += _usize;
        ++__entries;
    }
    
    __GenerateBuffer = function()
    {
        if (__entries == 0)
        {
            __LatError("ZIP is empty");
            return -1;
        }
        
        var _headerSize = 22;
        var _buffer = buffer_create(_headerSize + buffer_tell(__dataBuffer) + buffer_tell(__directoryBuffer), buffer_fixed, 1);
        
        buffer_copy(__dataBuffer, 0, buffer_tell(__dataBuffer), _buffer, buffer_tell(_buffer));
        buffer_seek(_buffer, buffer_seek_relative, buffer_tell(__dataBuffer));
        
        buffer_copy(__directoryBuffer, 0, buffer_tell(__directoryBuffer), _buffer, buffer_tell(_buffer));
        buffer_seek(_buffer, buffer_seek_relative, buffer_tell(__directoryBuffer));
        
        buffer_write(_buffer, buffer_u32, $6054b50); //signature
        buffer_write(_buffer, buffer_u16, 0); //current disk number
        buffer_write(_buffer, buffer_u16, 0); //central dir disk start
        buffer_write(_buffer, buffer_u16, __entries); //number of central dir records on disk
        buffer_write(_buffer, buffer_u16, __entries); //total number of central dir records
        buffer_write(_buffer, buffer_u32, buffer_tell(__directoryBuffer)); //size of central dir
        buffer_write(_buffer, buffer_u32, buffer_tell(__dataBuffer)); //start of central dir
        buffer_write(_buffer, buffer_u16, 0); //comment length
        
        return _buffer;
    }
    
    __Exists = function()
    {
        return true;
    }
    
    __Destroy = function()
    {
        __GenerateBuffer = function() { return undefined; }
        __AddData        = function() {}
        __Destroy        = function() {}
        __Exists         = function() { return false; }
        
        buffer_delete(__dataBuffer);
        buffer_delete(__directoryBuffer);
    }
}

function __LatDateToDosTime(_inDateTime)
{
    var _timezone = date_get_timezone();
    date_set_timezone(timezone_utc);
    var _date = (date_get_hour(_inDateTime) << 11) | (date_get_minute(_inDateTime) << 5) | (date_get_second(_inDateTime) div 2);
    date_set_timezone(_timezone);
    
    return _date;
}

function __LatDateToDosDate(_inDateTime)
{
    var _timezone = date_get_timezone();
    date_set_timezone(timezone_utc);
    var _date = ((date_get_year(_inDateTime)-1980) << 9) | (date_get_month(_inDateTime) << 5) | date_get_day(_inDateTime);
    date_set_timezone(_timezone);
    
    return _date;
}

function __LatDateFromUnix(_inDateTime)
{
    var _timezone = date_get_timezone();
    date_set_timezone(timezone_utc);
    var _dateTime = date_inc_second(date_create_datetime(2000, 1, 1, 0, 0, 0), _inDateTime - 946684800);
    date_set_timezone(_timezone)

    return _dateTime;
}