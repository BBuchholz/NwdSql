-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE LyricSequence (
	LyricSequenceId INTEGER PRIMARY KEY NOT NULL UNIQUE, 
	LyricSequenceDescription TEXT, 
	LyricSequenceCreatedAt TEXT NOT NULL, 
	LyricSequenceUpdatedAt TEXT NOT NULL 
)

-- updated at trigger
CREATE TRIGGER SetLyricSequenceUpdatedAt
AFTER UPDATE ON LyricSequence
BEGIN
UPDATE LyricSequence 
	SET LyricSequenceUpdatedAt = CURRENT_TIMESTAMP
	WHERE LyricSequence.LyricSequenceId = NEW.LyricSequenceId;
END

-- created at & updated at trigger
CREATE TRIGGER SetLyricSequenceCreatedAt 
AFTER INSERT ON LyricSequence
BEGIN
UPDATE LyricSequence 
	SET LyricSequenceCreatedAt = CURRENT_TIMESTAMP, 
		   LyricSequenceUpdatedAt = CURRENT_TIMESTAMP
	WHERE LyricSequence.LyricSequenceId = NEW.LyricSequenceId;
END