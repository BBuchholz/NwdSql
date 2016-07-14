-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE FileTag (
	FileTagId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	FileId INTEGER NOT NULL REFERENCES File (FileId), 
	TagId INTEGER NOT NULL REFERENCES Tag (TagId),
	FileTagTaggedAt TEXT NOT NULL,
	FileTagUntaggedAt TEXT,
	FileTagCreatedAt TEXT NOT NULL,
	FileTagUpdatedAt TEXT NOT NULL, 
	UNIQUE(FileId, TagId)
)

-- updated at trigger
CREATE TRIGGER SetFileTagUpdatedAt
AFTER UPDATE ON FileTag
BEGIN
UPDATE FileTag 
	SET FileTagUpdatedAt = CURRENT_TIMESTAMP
	WHERE FileTag.FileTagId = NEW.FileTagId;
END

-- created at & updated at trigger
CREATE TRIGGER SetFileTagCreatedAt 
AFTER INSERT ON FileTag
BEGIN
UPDATE FileTag 
	SET FileTagCreatedAt = CURRENT_TIMESTAMP, 
		   FileTagUpdatedAt = CURRENT_TIMESTAMP,
		   FileTagTaggedAt = CURRENT_TIMESTAMP
	WHERE FileTag.FileTagId = NEW.FileTagId;
END