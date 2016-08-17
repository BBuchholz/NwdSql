-- FILE SUBSET test data created 2016-08-16

INSERT OR IGNORE INTO DisplayName (DisplayNameValue) VALUES ('Misc. Image');  
INSERT OR IGNORE INTO DisplayName (DisplayNameValue) VALUES ('Misc. Audio'); 
INSERT OR IGNORE INTO DisplayName (DisplayNameValue) VALUES ('Misc. Lyric Bit Audio');

INSERT OR IGNORE INTO Path (PathValue) VALUES ('C:/NWD-AUX/images/imageYYY.png');   
INSERT OR IGNORE INTO Path (PathValue) VALUES ('C:/NWD-AUX/images/imageXXX.jpg');   
INSERT OR IGNORE INTO Path (PathValue) VALUES ('C:/NWD-AUX/samples/sampleZZZ.wav');   
INSERT OR IGNORE INTO Path (PathValue) VALUES ('/storage/emulated/0/Pictures/Screenshots/Screenshot_2016-02-03-13-30-31.png');  
INSERT OR IGNORE INTO Path (PathValue) VALUES ('/storage/emulated/0/NWD-AUX/voicememos/sampleZZZ.wav');
INSERT OR IGNORE INTO Path (PathValue) VALUES ('/storage/emulated/0/NWD-AUX/voicememos/0301151528.wav'); 
INSERT OR IGNORE INTO Path (PathValue) VALUES ('/storage/emulated/0/NWD-AUX/voicememos/2015-05-09_23-58-39_lyricBit.wav'); 

INSERT OR IGNORE INTO Device (DeviceDescription) VALUES ('laptop');   
INSERT OR IGNORE INTO Device (DeviceDescription) VALUES ('tablet');   

INSERT OR IGNORE INTO File (DeviceId, PathId, DisplayNameId, FileDescription, FileName) VALUES ((SELECT DeviceId FROM Device WHERE DeviceDescription = 'laptop'), (SELECT PathId FROM Path WHERE PathValue = 'C:/NWD-AUX/images/imageXXX.jpg'), (SELECT DisplayNameId FROM DisplayName WHERE DisplayNameValue = 'Misc. Image'), 'description of image file imageXXX.jpg', 'imageXXX.jpg');
INSERT OR IGNORE INTO File (DeviceId, PathId, DisplayNameId) VALUES ((SELECT DeviceId FROM Device WHERE DeviceDescription = 'laptop'), (SELECT PathId FROM Path WHERE PathValue = 'C:/NWD-AUX/images/imageYYY.png'), (SELECT DisplayNameId FROM DisplayName WHERE DisplayNameValue = 'Misc. Image'));
INSERT OR IGNORE INTO File (DeviceId, PathId, DisplayNameId, FileDescription, FileName) VALUES ((SELECT DeviceId FROM Device WHERE DeviceDescription = 'laptop'), (SELECT PathId FROM Path WHERE PathValue = 'C:/NWD-AUX/samples/sampleZZZ.wav'), (SELECT DisplayNameId FROM DisplayName WHERE DisplayNameValue = 'Misc. Audio'), 'description of audio file sampleZZZ.wav', 'sampleZZZ.wav');
INSERT OR IGNORE INTO File (DeviceId, PathId, DisplayNameId, FileDescription, FileName) VALUES ((SELECT DeviceId FROM Device WHERE DeviceDescription = 'tablet'), (SELECT PathId FROM Path WHERE PathValue = '/storage/emulated/0/Pictures/Screenshots/Screenshot_2016-02-03-13-30-31.png'), (SELECT DisplayNameId FROM DisplayName WHERE DisplayNameValue = 'Misc. Image'), 'description of image file Screenshot_2016-02-03-13-30-31.png', 'Screenshot_2016-02-03-13-30-31.png');
INSERT OR IGNORE INTO File (DeviceId, PathId, DisplayNameId) VALUES ((SELECT DeviceId FROM Device WHERE DeviceDescription = 'tablet'), (SELECT PathId FROM Path WHERE PathValue = '/storage/emulated/0/NWD-AUX/voicememos/0301151528.wav'), (SELECT DisplayNameId FROM DisplayName WHERE DisplayNameValue = 'Misc. Audio'));
INSERT OR IGNORE INTO File (DeviceId, PathId, DisplayNameId, FileDescription, FileName) VALUES ((SELECT DeviceId FROM Device WHERE DeviceDescription = 'tablet'), (SELECT PathId FROM Path WHERE PathValue = '/storage/emulated/0/NWD-AUX/voicememos/2015-05-09_23-58-39_lyricBit.wav'), (SELECT DisplayNameId FROM DisplayName WHERE DisplayNameValue = 'Misc. Lyric Bit Audio'), 'description of lyric bit audio file 2015-05-09_23-58-39_lyricBit.wav', '2015-05-09_23-58-39_lyricBit.wav');
INSERT OR IGNORE INTO File (DeviceId, PathId, DisplayNameId) VALUES ((SELECT DeviceId FROM Device WHERE DeviceDescription = 'tablet'), (SELECT PathId FROM Path WHERE PathValue = '/storage/emulated/0/NWD-AUX/voicememos/sampleZZZ.wav'), (SELECT DisplayNameId FROM DisplayName WHERE DisplayNameValue = 'Misc. Audio'));

INSERT OR IGNORE INTO Hash (HashValue) VALUES ('15755a4c110043177006d23b3e52deeb44b0cf9d');   
INSERT OR IGNORE INTO Hash (HashValue) VALUES ('a5aba15de1d4b2c8ef1a04e4d2231954c8cd6608');     
INSERT OR IGNORE INTO Hash (HashValue) VALUES ('be831bfdbae441c2c0e54f1d9fc2cf734cb5a740');   
INSERT OR IGNORE INTO Hash (HashValue) VALUES ('f05366bfcce166fe41a4fe7fdaa6b38d54ef850a');      
INSERT OR IGNORE INTO Hash (HashValue) VALUES ('8ff563a3c24caee3b5a7a255d619deadbe5e835d');
INSERT OR IGNORE INTO Hash (HashValue) VALUES ('03f9adff886616f908a68058ff8488c00d18e093');

INSERT OR IGNORE INTO Tag (TagValue) VALUES ('lyric bits');    
INSERT OR IGNORE INTO Tag (TagValue) VALUES ('samples');    
INSERT OR IGNORE INTO Tag (TagValue) VALUES ('artwork');    
INSERT OR IGNORE INTO Tag (TagValue) VALUES ('diagrams');    
INSERT OR IGNORE INTO Tag (TagValue) VALUES ('audio');   

INSERT OR IGNORE INTO AudioTranscript (AudioTranscriptValue, AudioTranscriptBeginTime, AudioTranscriptEndTime) VALUES ('This is a testing audio bit...', '00:00:00', '00:00:05');    
INSERT OR IGNORE INTO AudioTranscript (AudioTranscriptValue, AudioTranscriptBeginTime, AudioTranscriptEndTime) VALUES ('... I am using it for testing audio.', '00:00:05', '00:00:10');    

INSERT OR IGNORE INTO FileTag (FileId, TagId) VALUES ((SELECT FileId FROM File WHERE DeviceId = (SELECT DeviceId FROM Device WHERE DeviceDescription = 'laptop') AND PathId = (SELECT PathId FROM Path WHERE PathValue = 'C:/NWD-AUX/images/imageXXX.jpg')), (SELECT TagId FROM Tag WHERE TagValue = 'artwork'));
INSERT OR IGNORE INTO FileTag (FileId, TagId) VALUES ((SELECT FileId FROM File WHERE DeviceId = (SELECT DeviceId FROM Device WHERE DeviceDescription = 'laptop') AND PathId = (SELECT PathId FROM Path WHERE PathValue = 'C:/NWD-AUX/images/imageYYY.png')), (SELECT TagId FROM Tag WHERE TagValue = 'diagrams'));
INSERT OR IGNORE INTO FileTag (FileId, TagId) VALUES ((SELECT FileId FROM File WHERE DeviceId = (SELECT DeviceId FROM Device WHERE DeviceDescription = 'laptop') AND PathId = (SELECT PathId FROM Path WHERE PathValue = 'C:/NWD-AUX/samples/sampleZZZ.wav')), (SELECT TagId FROM Tag WHERE TagValue = 'samples'));
INSERT OR IGNORE INTO FileTag (FileId, TagId) VALUES ((SELECT FileId FROM File WHERE DeviceId = (SELECT DeviceId FROM Device WHERE DeviceDescription = 'laptop') AND PathId = (SELECT PathId FROM Path WHERE PathValue = 'C:/NWD-AUX/samples/sampleZZZ.wav')), (SELECT TagId FROM Tag WHERE TagValue = 'audio'));
INSERT OR IGNORE INTO FileTag (FileId, TagId) VALUES ((SELECT FileId FROM File WHERE DeviceId = (SELECT DeviceId FROM Device WHERE DeviceDescription = 'tablet') AND PathId = (SELECT PathId FROM Path WHERE PathValue = '/storage/emulated/0/NWD-AUX/voicememos/sampleZZZ.wav')), (SELECT TagId FROM Tag WHERE TagValue = 'samples'));
INSERT OR IGNORE INTO FileTag (FileId, TagId) VALUES ((SELECT FileId FROM File WHERE DeviceId = (SELECT DeviceId FROM Device WHERE DeviceDescription = 'tablet') AND PathId = (SELECT PathId FROM Path WHERE PathValue = '/storage/emulated/0/NWD-AUX/voicememos/sampleZZZ.wav')), (SELECT TagId FROM Tag WHERE TagValue = 'audio'));
INSERT OR IGNORE INTO FileTag (FileId, TagId) VALUES ((SELECT FileId FROM File WHERE DeviceId = (SELECT DeviceId FROM Device WHERE DeviceDescription = 'tablet') AND PathId = (SELECT PathId FROM Path WHERE PathValue = '/storage/emulated/0/NWD-AUX/voicememos/2015-05-09_23-58-39_lyricBit.wav')), (SELECT TagId FROM Tag WHERE TagValue = 'lyric bits'));
INSERT OR IGNORE INTO FileTag (FileId, TagId) VALUES ((SELECT FileId FROM File WHERE DeviceId = (SELECT DeviceId FROM Device WHERE DeviceDescription = 'tablet') AND PathId = (SELECT PathId FROM Path WHERE PathValue = '/storage/emulated/0/NWD-AUX/voicememos/2015-05-09_23-58-39_lyricBit.wav')), (SELECT TagId FROM Tag WHERE TagValue = 'audio'));

INSERT OR IGNORE INTO FileHash (FileId, HashId) VALUES ((SELECT FileId FROM File WHERE DeviceId = (SELECT DeviceId FROM Device WHERE DeviceDescription = 'laptop') AND PathId = (SELECT PathId FROM Path WHERE PathValue = 'C:/NWD-AUX/images/imageXXX.jpg')), (SELECT HashId FROM Hash WHERE HashValue = '15755a4c110043177006d23b3e52deeb44b0cf9d'));
INSERT OR IGNORE INTO FileHash (FileId, HashId) VALUES ((SELECT FileId FROM File WHERE DeviceId = (SELECT DeviceId FROM Device WHERE DeviceDescription = 'laptop') AND PathId = (SELECT PathId FROM Path WHERE PathValue = 'C:/NWD-AUX/images/imageYYY.png')), (SELECT HashId FROM Hash WHERE HashValue = 'a5aba15de1d4b2c8ef1a04e4d2231954c8cd6608'));
INSERT OR IGNORE INTO FileHash (FileId, HashId) VALUES ((SELECT FileId FROM File WHERE DeviceId = (SELECT DeviceId FROM Device WHERE DeviceDescription = 'laptop') AND PathId = (SELECT PathId FROM Path WHERE PathValue = 'C:/NWD-AUX/samples/sampleZZZ.wav')), (SELECT HashId FROM Hash WHERE HashValue = 'be831bfdbae441c2c0e54f1d9fc2cf734cb5a740'));
INSERT OR IGNORE INTO FileHash (FileId, HashId) VALUES ((SELECT FileId FROM File WHERE DeviceId = (SELECT DeviceId FROM Device WHERE DeviceDescription = 'laptop') AND PathId = (SELECT PathId FROM Path WHERE PathValue = 'C:/NWD-AUX/samples/sampleZZZ.wav')), (SELECT HashId FROM Hash WHERE HashValue = '8ff563a3c24caee3b5a7a255d619deadbe5e835d'));
INSERT OR IGNORE INTO FileHash (FileId, HashId) VALUES ((SELECT FileId FROM File WHERE DeviceId = (SELECT DeviceId FROM Device WHERE DeviceDescription = 'tablet') AND PathId = (SELECT PathId FROM Path WHERE PathValue = '/storage/emulated/0/NWD-AUX/voicememos/sampleZZZ.wav')), (SELECT HashId FROM Hash WHERE HashValue = 'be831bfdbae441c2c0e54f1d9fc2cf734cb5a740'));
INSERT OR IGNORE INTO FileHash (FileId, HashId) VALUES ((SELECT FileId FROM File WHERE DeviceId = (SELECT DeviceId FROM Device WHERE DeviceDescription = 'tablet') AND PathId = (SELECT PathId FROM Path WHERE PathValue = '/storage/emulated/0/NWD-AUX/voicememos/2015-05-09_23-58-39_lyricBit.wav')), (SELECT HashId FROM Hash WHERE HashValue = 'f05366bfcce166fe41a4fe7fdaa6b38d54ef850a'));
INSERT OR IGNORE INTO FileHash (FileId, HashId) VALUES ((SELECT FileId FROM File WHERE DeviceId = (SELECT DeviceId FROM Device WHERE DeviceDescription = 'tablet') AND PathId = (SELECT PathId FROM Path WHERE PathValue = '/storage/emulated/0/NWD-AUX/voicememos/2015-05-09_23-58-39_lyricBit.wav')), (SELECT HashId FROM Hash WHERE HashValue = '03f9adff886616f908a68058ff8488c00d18e093'));

INSERT OR IGNORE INTO Transcription (FileId, AudioTranscriptId) VALUES ((SELECT FileId FROM File WHERE DeviceId = (SELECT DeviceId FROM Device WHERE DeviceDescription = 'tablet') AND PathId = (SELECT PathId FROM Path WHERE PathValue = '/storage/emulated/0/NWD-AUX/voicememos/0301151528.wav')), (SELECT AudioTranscriptId FROM AudioTranscript WHERE AudioTranscriptValue = 'This is a testing audio bit...' AND AudioTranscriptBeginTime = '00:00:00' AND AudioTranscriptEndTime = '00:00:05'));
INSERT OR IGNORE INTO Transcription (FileId, AudioTranscriptId) VALUES ((SELECT FileId FROM File WHERE DeviceId =  (SELECT DeviceId FROM Device WHERE DeviceDescription = 'tablet') AND PathId = (SELECT PathId FROM Path WHERE PathValue = '/storage/emulated/0/NWD-AUX/voicememos/2015-05-09_23-58-39_lyricBit.wav')), (SELECT AudioTranscriptId FROM AudioTranscript WHERE AudioTranscriptValue = '... I am using it for testing audio.' AND AudioTranscriptBeginTime = '00:00:05' AND AudioTranscriptEndTime = '00:00:10'));

INSERT OR IGNORE INTO LocalConfig (LocalConfigKey, LocalConfigValue) VALUES ('local device name', 'laptop');   