-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE Media (
	MediaId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	MediaFileName TEXT,
	MediaDescription TEXT, 
	MediaHash TEXT, 
	MediaCreatedAt TEXT,
	MediaUpdatedAt TEXT,  
	UNIQUE(MediaHash)
)

-- updated at trigger
CREATE TRIGGER SetMediaUpdatedAt
AFTER UPDATE ON Media
BEGIN
UPDATE Media 
	SET MediaUpdatedAt = CURRENT_TIMESTAMP
	WHERE Media.MediaId = NEW.MediaId;
END

-- created at & updated at trigger
CREATE TRIGGER SetMediaCreatedAt 
AFTER INSERT ON Media
BEGIN
UPDATE Media 
	SET MediaCreatedAt = CURRENT_TIMESTAMP, 
		   MediaUpdatedAt = CURRENT_TIMESTAMP
	WHERE Media.MediaId = NEW.MediaId;
END