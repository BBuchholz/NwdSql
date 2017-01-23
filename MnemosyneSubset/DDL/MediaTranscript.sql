-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE MediaTranscript (
	MediaTranscriptId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	MediaTranscriptValue TEXT,
	MediaTranscriptBeginTime TEXT, 
	MediaTranscriptEndTime Text, 
	MediaTranscriptCreatedAt TEXT,
	MediaTranscriptUpdatedAt TEXT, 
	UNIQUE(MediaTranscriptValue, MediaTranscriptBeginTime, MediaTranscriptEndTime)
)

-- updated at trigger
CREATE TRIGGER SetMediaTranscriptUpdatedAt
AFTER UPDATE ON MediaTranscript
BEGIN
UPDATE MediaTranscript 
	SET MediaTranscriptUpdatedAt = CURRENT_TIMESTAMP
	WHERE MediaTranscript.MediaTranscriptId = NEW.MediaTranscriptId;
END

-- created at & updated at trigger
CREATE TRIGGER SetMediaTranscriptCreatedAt 
AFTER INSERT ON MediaTranscript
BEGIN
UPDATE MediaTranscript 
	SET MediaTranscriptCreatedAt = CURRENT_TIMESTAMP, 
		   MediaTranscriptUpdatedAt = CURRENT_TIMESTAMP
	WHERE MediaTranscript.MediaTranscriptId = NEW.MediaTranscriptId;
END