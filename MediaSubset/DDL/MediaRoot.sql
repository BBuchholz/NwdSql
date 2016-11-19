-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE MediaRoot (
	MediaRootId INTEGER NOT NULL PRIMARY KEY UNIQUE, 
	MediaDeviceId INTEGER NOT NULL REFERENCES MediaDevice (MediaDeviceId), 
	MediaRootPath TEXT NOT NULL UNIQUE,
	MediaRootCreatedAt TEXT,
	MediaRootUpdatedAt TEXT
)

-- updated at trigger
CREATE TRIGGER SetMediaRootUpdatedAt
AFTER UPDATE ON MediaRoot
BEGIN
UPDATE MediaRoot 
	SET MediaRootUpdatedAt = CURRENT_TIMESTAMP
	WHERE MediaRoot.MediaRootId = NEW.MediaRootId;
END

-- created at & updated at trigger
CREATE TRIGGER SetMediaRootCreatedAt 
AFTER INSERT ON MediaRoot
BEGIN
UPDATE MediaRoot 
	SET MediaRootCreatedAt = CURRENT_TIMESTAMP, 
		   MediaRootUpdatedAt = CURRENT_TIMESTAMP
	WHERE MediaRoot.MediaRootId = NEW.MediaRootId;
END