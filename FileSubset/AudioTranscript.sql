-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE AudioTranscript (
	AudioTranscriptId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	FileId INTEGER NOT NULL REFERENCES File (FileId), 
	AudioTranscriptValue TEXT,
	AudioTranscriptCreatedAt TEXT NOT NULL,
	AudioTranscriptUpdatedAt TEXT NOT NULL, 
	UNIQUE(FileId)
)

-- updated at trigger
CREATE TRIGGER SetAudioTranscriptUpdatedAt
AFTER UPDATE ON AudioTranscript
BEGIN
UPDATE AudioTranscript 
	SET AudioTranscriptUpdatedAt = CURRENT_TIMESTAMP
	WHERE AudioTranscript.AudioTranscriptId = NEW.AudioTranscriptId;
END

-- created at & updated at trigger
CREATE TRIGGER SetAudioTranscriptCreatedAt 
AFTER INSERT ON AudioTranscript
BEGIN
UPDATE AudioTranscript 
	SET AudioTranscriptCreatedAt = CURRENT_TIMESTAMP, 
		   AudioTranscriptUpdatedAt = CURRENT_TIMESTAMP
	WHERE AudioTranscript.AudioTranscriptId = NEW.AudioTranscriptId;
END