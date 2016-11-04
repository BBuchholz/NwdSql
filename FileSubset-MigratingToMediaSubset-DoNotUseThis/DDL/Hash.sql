-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE Hash (
	HashId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	HashValue TEXT NOT NULL UNIQUE,
	HashCreatedAt TEXT,
	HashUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetHashUpdatedAt
AFTER UPDATE ON Hash
BEGIN
UPDATE Hash 
	SET HashUpdatedAt = CURRENT_TIMESTAMP
	WHERE Hash.HashId = NEW.HashId;
END

-- created at & updated at trigger
CREATE TRIGGER SetHashCreatedAt 
AFTER INSERT ON Hash
BEGIN
UPDATE Hash 
	SET HashCreatedAt = CURRENT_TIMESTAMP, 
		   HashUpdatedAt = CURRENT_TIMESTAMP
	WHERE Hash.HashId = NEW.HashId;
END