-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE DisplayName (
	DisplayNameId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	DisplayNameValue TEXT NOT NULL UNIQUE,
	DisplayNameCreatedAt TEXT NOT NULL,
	DisplayNameUpdatedAt TEXT NOT NULL
)

-- updated at trigger
CREATE TRIGGER SetDisplayNameUpdatedAt
AFTER UPDATE ON DisplayName
BEGIN
UPDATE DisplayName 
	SET DisplayNameUpdatedAt = CURRENT_TIMESTAMP
	WHERE DisplayName.DisplayNameId = NEW.DisplayNameId;
END

-- created at & updated at trigger
CREATE TRIGGER SetDisplayNameCreatedAt 
AFTER INSERT ON DisplayName
BEGIN
UPDATE DisplayName 
	SET DisplayNameCreatedAt = CURRENT_TIMESTAMP, 
		   DisplayNameUpdatedAt = CURRENT_TIMESTAMP
	WHERE DisplayName.DisplayNameId = NEW.DisplayNameId;
END