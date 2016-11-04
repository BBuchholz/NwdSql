-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE MediaTag (
	MediaTagId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	MediaId INTEGER NOT NULL REFERENCES Media (MediaId), 
	TagId INTEGER NOT NULL REFERENCES Tag (TagId),
	MediaTagTaggedAt TEXT,
	MediaTagUntaggedAt TEXT,
	MediaTagCreatedAt TEXT,
	MediaTagUpdatedAt TEXT, 
	UNIQUE(MediaId, TagId)
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
		   MediaTagUpdatedAt = CURRENT_TIMESTAMP,
		   MediaTagTaggedAt = CURRENT_TIMESTAMP
	WHERE MediaTag.MediaTagId = NEW.MediaTagId;
END