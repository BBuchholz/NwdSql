-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE MediaTag (
	MediaTagId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	MediaTagValue TEXT NOT NULL UNIQUE,
	MediaTagCreatedAt TEXT,
	MediaTagUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetMediaTagUpdatedAt
AFTER UPDATE ON MediaTag
BEGIN
UPDATE MediaTag 
	SET MediaTagUpdatedAt = CURRENT_TIMESTAMP
	WHERE MediaTag.MediaTagId = NEW.MediaTagId;
END

-- created at & updated at trigger
CREATE TRIGGER SetMediaTagCreatedAt 
AFTER INSERT ON MediaTag
BEGIN
UPDATE MediaTag 
	SET MediaTagCreatedAt = CURRENT_TIMESTAMP, 
		   MediaTagUpdatedAt = CURRENT_TIMESTAMP
	WHERE MediaTag.MediaTagId = NEW.MediaTagId;
END