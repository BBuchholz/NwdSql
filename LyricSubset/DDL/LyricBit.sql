-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE LyricBit (
	LyricBitId INTEGER PRIMARY KEY NOT NULL UNIQUE, 
	LyricBitValue TEXT NOT NULL UNIQUE,
	LyricBitCreatedAt TEXT,
	LyricBitUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetLyricBitUpdatedAt
AFTER UPDATE ON LyricBit
BEGIN
UPDATE LyricBit 
	SET LyricBitUpdatedAt = CURRENT_TIMESTAMP
	WHERE LyricBit.LyricBitId = NEW.LyricBitId;
END

-- created at & updated at trigger
CREATE TRIGGER SetLyricBitCreatedAt 
AFTER INSERT ON LyricBit
BEGIN
UPDATE LyricBit 
	SET LyricBitCreatedAt = CURRENT_TIMESTAMP, 
		   LyricBitUpdatedAt = CURRENT_TIMESTAMP
	WHERE LyricBit.LyricBitId = NEW.LyricBitId;
END