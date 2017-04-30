-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SourceExcerptTagging (
	SourceExcerptTaggingId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	SourceExcerptId INTEGER NOT NULL REFERENCES SourceExcerpt (SourceExcerptId), 
	MediaTagId INTEGER NOT NULL REFERENCES MediaTag (MediaTagId),
	SourceExcerptTaggingTaggedAt TEXT,
	SourceExcerptTaggingUntaggedAt TEXT,
	SourceExcerptTaggingCreatedAt TEXT,
	SourceExcerptTaggingUpdatedAt TEXT, 
	UNIQUE(SourceExcerptId, MediaTagId)
)

-- updated at trigger
CREATE TRIGGER SetSourceExcerptTaggingUpdatedAt
AFTER UPDATE ON SourceExcerptTagging
BEGIN
UPDATE SourceExcerptTagging 
	SET SourceExcerptTaggingUpdatedAt = CURRENT_TIMESTAMP
	WHERE SourceExcerptTagging.SourceExcerptTaggingId = NEW.SourceExcerptTaggingId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSourceExcerptTaggingCreatedAt 
AFTER INSERT ON SourceExcerptTagging
BEGIN
UPDATE SourceExcerptTagging 
	SET SourceExcerptTaggingCreatedAt = CURRENT_TIMESTAMP, 
		   SourceExcerptTaggingUpdatedAt = CURRENT_TIMESTAMP,
		   SourceExcerptTaggingTaggedAt = CURRENT_TIMESTAMP
	WHERE SourceExcerptTagging.SourceExcerptTaggingId = NEW.SourceExcerptTaggingId;
END