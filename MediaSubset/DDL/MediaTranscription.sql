-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE MediaTranscription (
	MediaTranscriptionId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	MediaId INTEGER NOT NULL REFERENCES Media (MediaId), 
	MediaTranscriptId INTEGER NOT NULL REFERENCES MediaTranscript (MediaTranscriptId),
	MediaTranscriptionCreatedAt TEXT,
	MediaTranscriptionUpdatedAt TEXT, 
	UNIQUE(MediaId, MediaTranscriptId)
)

-- updated at trigger
CREATE TRIGGER SetMediaTranscriptionUpdatedAt
AFTER UPDATE ON MediaTranscription
BEGIN
UPDATE MediaTranscription 
	SET MediaTranscriptionUpdatedAt = CURRENT_TIMESTAMP
	WHERE MediaTranscription.MediaTranscriptionId = NEW.MediaTranscriptionId;
END

-- created at & updated at trigger
CREATE TRIGGER SetMediaTranscriptionCreatedAt 
AFTER INSERT ON MediaTranscription
BEGIN
UPDATE MediaTranscription 
	SET MediaTranscriptionCreatedAt = CURRENT_TIMESTAMP, 
		   MediaTranscriptionUpdatedAt = CURRENT_TIMESTAMP
	WHERE MediaTranscription.MediaTranscriptionId = NEW.MediaTranscriptionId;
END