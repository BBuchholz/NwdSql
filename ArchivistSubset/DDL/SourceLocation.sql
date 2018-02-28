-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SourceLocation (
	SourceLocationId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	SourceLocationValue TEXT NOT NULL UNIQUE,
	SourceLocationCreatedAt TEXT,
	SourceLocationUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetSourceLocationUpdatedAt
AFTER UPDATE ON SourceLocation
BEGIN
UPDATE SourceLocation 
	SET SourceLocationUpdatedAt = CURRENT_TIMESTAMP
	WHERE SourceLocation.SourceLocationId = NEW.SourceLocationId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSourceLocationCreatedAt 
AFTER INSERT ON SourceLocation
BEGIN
UPDATE SourceLocation 
	SET SourceLocationCreatedAt = CURRENT_TIMESTAMP, 
		   SourceLocationUpdatedAt = CURRENT_TIMESTAMP
	WHERE SourceLocation.SourceLocationId = NEW.SourceLocationId;
END