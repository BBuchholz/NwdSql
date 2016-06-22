-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SequencePosition (
	SequencePositionId INTEGER PRIMARY KEY NOT NULL UNIQUE, 
	LyricSequenceId INTEGER NOT NULL REFERENCES LyricSequence(LyricSequenceId), 
	LyricBitId INTEGER NOT NULL REFERENCES LyricBit(LyricBitId), 
	SequencePosition INTEGER NOT NULL, 
	SequencePositionCreatedAt TEXT NOT NULL, 
	SequencePositionUpdatedAt TEXT NOT NULL,
	UNIQUE(LyricSequenceId, LyricBitId, SequencePosition)  
)

-- updated at trigger
CREATE TRIGGER SetSequencePositionUpdatedAt
AFTER UPDATE ON SequencePosition
BEGIN
UPDATE SequencePosition 
	SET SequencePositionUpdatedAt = CURRENT_TIMESTAMP
	WHERE SequencePosition.SequencePositionId = NEW.SequencePositionId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSequencePositionCreatedAt 
AFTER INSERT ON SequencePosition
BEGIN
UPDATE SequencePosition 
	SET SequencePositionCreatedAt = CURRENT_TIMESTAMP, 
		   SequencePositionUpdatedAt = CURRENT_TIMESTAMP
	WHERE SequencePosition.SequencePositionId = NEW.SequencePositionId;
END