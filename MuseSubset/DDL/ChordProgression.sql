-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE ChordProgression (
	ChordProgressionId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	ChordProgressionSignature TEXT NOT NULL UNIQUE, 
	ChordProgressionNotes TEXT, 
	ChordProgressionCreatedAt TEXT,
	ChordProgressionUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetChordProgressionUpdatedAt
AFTER UPDATE ON ChordProgression
BEGIN
UPDATE ChordProgression 
	SET ChordProgressionUpdatedAt = CURRENT_TIMESTAMP
	WHERE ChordProgression.ChordProgressionId = NEW.ChordProgressionId;
END

-- created at & updated at trigger
CREATE TRIGGER SetChordProgressionCreatedAt 
AFTER INSERT ON ChordProgression
BEGIN
UPDATE ChordProgression 
	SET ChordProgressionCreatedAt = CURRENT_TIMESTAMP, 
		   ChordProgressionUpdatedAt = CURRENT_TIMESTAMP
	WHERE ChordProgression.ChordProgressionId = NEW.ChordProgressionId;
END