-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SourceType (
	SourceTypeId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	SourceTypeValue TEXT NOT NULL UNIQUE,
	SourceTypeCreatedAt TEXT,
	SourceTypeUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetSourceTypeUpdatedAt
AFTER UPDATE ON SourceType
BEGIN
UPDATE SourceType 
	SET SourceTypeUpdatedAt = CURRENT_TIMESTAMP
	WHERE SourceType.SourceTypeId = NEW.SourceTypeId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSourceTypeCreatedAt 
AFTER INSERT ON SourceType
BEGIN
UPDATE SourceType 
	SET SourceTypeCreatedAt = CURRENT_TIMESTAMP, 
		   SourceTypeUpdatedAt = CURRENT_TIMESTAMP
	WHERE SourceType.SourceTypeId = NEW.SourceTypeId;
END