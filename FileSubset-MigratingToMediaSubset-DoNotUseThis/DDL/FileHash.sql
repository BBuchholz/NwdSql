-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE FileHash (
	FileHashId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	FileId INTEGER NOT NULL REFERENCES File (FileId), 
	HashId INTEGER NOT NULL REFERENCES Hash (HashId),
	FileHashCreatedAt TEXT,
	FileHashUpdatedAt TEXT, 
	UNIQUE(FileId, HashId)
)

-- updated at trigger
CREATE TRIGGER SetFileHashUpdatedAt
AFTER UPDATE ON FileHash
BEGIN
UPDATE FileHash 
	SET FileHashUpdatedAt = CURRENT_TIMESTAMP
	WHERE FileHash.FileHashId = NEW.FileHashId;
END

-- created at & updated at trigger
CREATE TRIGGER SetFileHashCreatedAt 
AFTER INSERT ON FileHash
BEGIN
UPDATE FileHash 
	SET FileHashCreatedAt = CURRENT_TIMESTAMP, 
		   FileHashUpdatedAt = CURRENT_TIMESTAMP
	WHERE FileHash.FileHashId = NEW.FileHashId;
END