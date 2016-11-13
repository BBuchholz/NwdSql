-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE MediaPath (
	MediaPathId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	MediaPathValue TEXT NOT NULL UNIQUE,
	MediaPathCreatedAt TEXT,
	MediaPathUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetMediaPathUpdatedAt
AFTER UPDATE ON MediaPath
BEGIN
UPDATE MediaPath 
	SET MediaPathUpdatedAt = CURRENT_TIMESTAMP
	WHERE MediaPath.MediaPathId = NEW.MediaPathId;
END

-- created at & updated at trigger
CREATE TRIGGER SetMediaPathCreatedAt 
AFTER INSERT ON MediaPath
BEGIN
UPDATE MediaPath 
	SET MediaPathCreatedAt = CURRENT_TIMESTAMP, 
		   MediaPathUpdatedAt = CURRENT_TIMESTAMP
	WHERE MediaPath.MediaPathId = NEW.MediaPathId;
END