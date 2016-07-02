-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE FileTags (
	FileTagsId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	FileId INTEGER NOT NULL REFERENCES File (FileId), 
	TagId INTEGER NOT NULL REFERENCES Tag (TagId),
	FileTagsCreatedAt TEXT NOT NULL,
	FileTagsUpdatedAt TEXT NOT NULL, 
	UNIQUE(FileId, TagId)
)

-- updated at trigger
CREATE TRIGGER SetFileTagsUpdatedAt
AFTER UPDATE ON FileTags
BEGIN
UPDATE FileTags 
	SET FileTagsUpdatedAt = CURRENT_TIMESTAMP
	WHERE FileTags.FileTagsId = NEW.FileTagsId;
END

-- created at & updated at trigger
CREATE TRIGGER SetFileTagsCreatedAt 
AFTER INSERT ON FileTags
BEGIN
UPDATE FileTags 
	SET FileTagsCreatedAt = CURRENT_TIMESTAMP, 
		   FileTagsUpdatedAt = CURRENT_TIMESTAMP
	WHERE FileTags.FileTagsId = NEW.FileTagsId;
END