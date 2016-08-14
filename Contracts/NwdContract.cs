public class NwdContract {

    //FILE SUBSET (NEW)
    public static string TABLE_DISPLAY_NAME = "DisplayName";  
    public static string COLUMN_DISPLAY_NAME_ID = "DisplayNameId";  
    public static string COLUMN_DISPLAY_NAME_VALUE = "DisplayNameValue";  

    public static string TABLE_PATH = "Path"; 
    public static string COLUMN_PATH_ID = "PathId"; 
    public static string COLUMN_PATH_VALUE = "PathValue";    

    public static string TABLE_HASH = "Hash";   
    public static string COLUMN_HASH_ID = "HashId"; 
    public static string COLUMN_HASH_VALUE = "HashValue";  

    public static string TABLE_DEVICE = "Device";  
    public static string COLUMN_DEVICE_ID = "DeviceId"; 
    public static string COLUMN_DEVICE_DESCRIPTION = "DeviceDescription";  

    public static string TABLE_FILE = "File";   
    public static string COLUMN_FILE_ID = "FileId"; 
    public static string COLUMN_FILE_DESCRIPTION = "FileDescription";  
    public static string COLUMN_FILE_NAME = "FileName";

    public static string TABLE_TAG = "Tag";    
    public static string COLUMN_TAG_ID = "TagId";   
    public static string COLUMN_TAG_VALUE = "TagValue"; 

    public static string TABLE_FILE_TAG = "FileTag";
    public static string COLUMN_FILE_TAG_ID = "FileTagId";
    public static string COLUMN_FILE_TAG_TAGGED_AT = "FileTagTaggedAt";
    public static string COLUMN_FILE_TAG_UNTAGGED_AT = "FileTagUntaggedAt";

    public static string TABLE_FILE_HASH = "FileHash"; 
    public static string COLUMN_FILE_HASH_ID = "FileHashId";

    public static string TABLE_AUDIO_TRANSCRIPT = "AudioTranscript";    
    public static string COLUMN_AUDIO_TRANSCRIPT_ID = "AudioTranscriptId";  
    public static string COLUMN_AUDIO_TRANSCRIPT_VALUE = "AudioTranscriptValue";     
    public static string COLUMN_AUDIO_TRANSCRIPT_BEGIN_TIME = "AudioTranscriptBeginTime";  
    public static string COLUMN_AUDIO_TRANSCRIPT_END_TIME = "AudioTranscriptEndTime";  

    public static string TABLE_LOCAL_CONFIG = "LocalConfig";   
    public static string COLUMN_LOCAL_CONFIG_ID = "LocalConfigId";  
    public static string COLUMN_LOCAL_CONFIG_KEY = "LocalConfigKey"; 
    public static string COLUMN_LOCAL_CONFIG_VALUE = "LocalConfigValue";    

    public static string TABLE_TRANSCRIPTION = "Transcription";
    public static string COLUMN_TRANSCRIPTION_ID = "TranscriptionId";

    //FILE SUBSET (PREVIOUS)
    public static string TABLE_FILE_TAGS = "FileTags";      
    public static string COLUMN_FILE_TAGS_ID = "FileTagsId";     
    
    public static string COLUMN_FILE_HASHED_AT = "FileHashedAt";
   
}