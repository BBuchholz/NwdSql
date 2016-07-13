-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE Transcription (
	TranscriptionId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	FileId INTEGER NOT NULL REFERENCES File (FileId), 
	AudioTranscriptId INTEGER NOT NULL REFERENCES AudioTranscript (AudioTranscriptId),
	TranscriptionCreatedAt TEXT NOT NULL,
	TranscriptionUpdatedAt TEXT NOT NULL, 
	UNIQUE(FileId, AudioTranscriptId)
)

-- updated at trigger
CREATE TRIGGER SetTranscriptionUpdatedAt
AFTER UPDATE ON Transcription
BEGIN
UPDATE Transcription 
	SET TranscriptionUpdatedAt = CURRENT_TIMESTAMP
	WHERE Transcription.TranscriptionId = NEW.TranscriptionId;
END

-- created at & updated at trigger
CREATE TRIGGER SetTranscriptionCreatedAt 
AFTER INSERT ON Transcription
BEGIN
UPDATE Transcription 
	SET TranscriptionCreatedAt = CURRENT_TIMESTAMP, 
		   TranscriptionUpdatedAt = CURRENT_TIMESTAMP
	WHERE Transcription.TranscriptionId = NEW.TranscriptionId;
END