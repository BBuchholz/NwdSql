-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE MediaHash (
	MediaHashId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	MediaId INTEGER NOT NULL REFERENCES Media (MediaId), 
	HashId INTEGER NOT NULL REFERENCES Hash (HashId),
	MediaHashCreatedAt TEXT,
	MediaHashUpdatedAt TEXT, 
	UNIQUE(MediaId, HashId)
)

-- updated at trigger
CREATE TRIGGER SetMediaHashUpdatedAt
AFTER UPDATE ON MediaHash
BEGIN
UPDATE MediaHash 
	SET MediaHashUpdatedAt = CURRENT_TIMESTAMP
	WHERE MediaHash.MediaHashId = NEW.MediaHashId;
END

-- created at & updated at trigger
CREATE TRIGGER SetMediaHashCreatedAt 
AFTER INSERT ON MediaHash
BEGIN
UPDATE MediaHash 
	SET MediaHashCreatedAt = CURRENT_TIMESTAMP, 
		   MediaHashUpdatedAt = CURRENT_TIMESTAMP
	WHERE MediaHash.MediaHashId = NEW.MediaHashId;
END