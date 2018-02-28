-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SourceLocationSubset (
	SourceLocationSubsetId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	SourceLocationSubsetValue TEXT NOT NULL UNIQUE,
	SourceLocationSubsetCreatedAt TEXT,
	SourceLocationSubsetUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetSourceLocationSubsetUpdatedAt
AFTER UPDATE ON SourceLocationSubset
BEGIN
UPDATE SourceLocationSubset 
	SET SourceLocationSubsetUpdatedAt = CURRENT_TIMESTAMP
	WHERE SourceLocationSubset.SourceLocationSubsetId = NEW.SourceLocationSubsetId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSourceLocationSubsetCreatedAt 
AFTER INSERT ON SourceLocationSubset
BEGIN
UPDATE SourceLocationSubset 
	SET SourceLocationSubsetCreatedAt = CURRENT_TIMESTAMP, 
		   SourceLocationSubsetUpdatedAt = CURRENT_TIMESTAMP
	WHERE SourceLocationSubset.SourceLocationSubsetId = NEW.SourceLocationSubsetId;
END