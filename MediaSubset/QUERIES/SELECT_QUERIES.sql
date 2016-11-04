--PathId for PathValue
SELECT PathId FROM Path WHERE PathValue = ?

--DeviceId for DeviceDescription
SELECT DeviceId FROM Device WHERE DeviceDescription = ?

--DisplayNameId for DisplayNameValue
SELECT DisplayNameId FROM DisplayName WHERE DisplayNameValue = ?

--AudioTranscriptId by values
SELECT AudioTranscriptId 
FROM AudioTranscript 
WHERE AudioTranscriptValue = ? 
AND AudioTranscriptBeginTime = ? 
AND AudioTranscriptEndTime = ?

--FileId by DeviceDescription and PathValue
SELECT FileId 
FROM File 
WHERE DeviceId = (
	SELECT DeviceId 
	FROM Device 
	WHERE DeviceDescription = ?) 
AND PathId = (
	SELECT PathId 
	FROM Path 
	WHERE PathValue = ?)

--TagId for TagValue
SELECT TagId 
FROM Tag 
WHERE TagValue = ?

--Get TagValues for HashValue
SELECT t.TagValue 
FROM Tag t 
JOIN FileTag ft 
ON t.TagId = ft.TagId 
JOIN File f 
ON f.FileId = ft.FileId 
JOIN FileHash fh 
ON f.FileId = fh.FileId
JOIN Hash h 
ON h.HashId = fh.HashId 
WHERE h.HashValue = ?


