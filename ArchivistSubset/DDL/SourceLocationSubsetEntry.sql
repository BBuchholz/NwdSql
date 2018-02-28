-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SourceLocationSubsetEntry (
	SourceLocationSubsetEntryId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	SourceLocationSubsetId INTEGER NOT NULL REFERENCES SourceLocationSubset (SourceLocationSubsetId),
	SourceId INTEGER NOT NULL REFERENCES Source (SourceId), 
	SourceLocationSubsetEntryValue TEXT NOT NULL UNIQUE,
	SourceLocationSubsetEntryVerifiedPresentAt TEXT,
	SourceLocationSubsetEntryVerifiedMissingAt TEXT,
	SourceLocationSubsetEntryCreatedAt TEXT,
	SourceLocationSubsetEntryUpdatedAt TEXT,
	UNIQUE(SourceLocationSubsetId, SourceId, SourceLocationSubsetEntryValue)
)

-- updated at trigger
CREATE TRIGGER SetSourceLocationSubsetEntryUpdatedAt
AFTER UPDATE ON SourceLocationSubsetEntry
BEGIN
UPDATE SourceLocationSubsetEntry 
	SET SourceLocationSubsetEntryUpdatedAt = CURRENT_TIMESTAMP
	WHERE SourceLocationSubsetEntry.SourceLocationSubsetEntryId = NEW.SourceLocationSubsetEntryId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSourceLocationSubsetEntryCreatedAt 
AFTER INSERT ON SourceLocationSubsetEntry
BEGIN
UPDATE SourceLocationSubsetEntry 
	SET SourceLocationSubsetEntryCreatedAt = CURRENT_TIMESTAMP, 
		   SourceLocationSubsetEntryUpdatedAt = CURRENT_TIMESTAMP
	WHERE SourceLocationSubsetEntry.SourceLocationSubsetEntryId = NEW.SourceLocationSubsetEntryId;
END