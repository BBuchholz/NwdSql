-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE MediaTagging (
	MediaTaggingId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	MediaId INTEGER NOT NULL REFERENCES Media (MediaId), 
	TagId INTEGER NOT NULL REFERENCES Tag (TagId),
	MediaTaggingTaggedAt TEXT,
	MediaTaggingUntaggedAt TEXT,
	MediaTaggingCreatedAt TEXT,
	MediaTaggingUpdatedAt TEXT, 
	UNIQUE(MediaId, TagId)
)

-- updated at trigger
CREATE TRIGGER SetMediaTaggingUpdatedAt
AFTER UPDATE ON MediaTagging
BEGIN
UPDATE MediaTagging 
	SET MediaTaggingUpdatedAt = CURRENT_TIMESTAMP
	WHERE MediaTagging.MediaTaggingId = NEW.MediaTaggingId;
END

-- created at & updated at trigger
CREATE TRIGGER SetMediaTaggingCreatedAt 
AFTER INSERT ON MediaTagging
BEGIN
UPDATE MediaTagging 
	SET MediaTaggingCreatedAt = CURRENT_TIMESTAMP, 
		   MediaTaggingUpdatedAt = CURRENT_TIMESTAMP,
		   MediaTaggingTaggedAt = CURRENT_TIMESTAMP
	WHERE MediaTagging.MediaTaggingId = NEW.MediaTaggingId;
END