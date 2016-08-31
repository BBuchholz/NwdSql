-- due to differences regarding sqlite, each of these
-- statements should be run by itself (one big statement fails)

-- table
CREATE TABLE SyncProfile ( 
	SyncProfileId INTEGER PRIMARY KEY NOT NULL UNIQUE, 
	SyncProfileName TEXT NOT NULL UNIQUE,
	SyncProfileCreatedAt TEXT,
	SyncProfileUpdatedAt TEXT  
)


-- updated at trigger
CREATE TRIGGER SetSyncProfileUpdatedAt
AFTER UPDATE ON SyncProfile
BEGIN
UPDATE SyncProfile 
	SET SyncProfileUpdatedAt = CURRENT_TIMESTAMP
	WHERE SyncProfile.SyncProfileId = NEW.SyncProfileId;
END

-- created at & updated at trigger
CREATE TRIGGER SetSyncProfileCreatedAt 
AFTER INSERT ON SyncProfile
BEGIN
UPDATE SyncProfile 
	SET SyncProfileCreatedAt = CURRENT_TIMESTAMP, 
		   SyncProfileUpdatedAt = CURRENT_TIMESTAMP
	WHERE SyncProfile.SyncProfileId = NEW.SyncProfileId;
END